//------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//------------------------------------------------------------

using System;
using System.Globalization;
using System.Resources;
using System.Web;
using System.Reflection;

public partial class WebApplication : Microsoft.IdentityServer.Web.PassiveProtocolApplication
{
    /// <summary>
    /// Per request, set the thread UICulture attribute to the best match from the request's
    /// Accept-Language header.
    ///
    /// If no header is found, this will default to the culture of the server install.
    /// </summary>
    public void Application_BeginRequest()
    {
        System.Threading.Thread.CurrentThread.CurrentUICulture = CultureInfo.InvariantCulture;

        if ( null != HttpContext.Current.Request.UserLanguages
                && HttpContext.Current.Request.UserLanguages.Length > 0 )
        {
            int languagesAttempted = 0;

            foreach ( string acceptlang in HttpContext.Current.Request.UserLanguages )
            {
                if( languagesAttempted == 5 )
                {
                    //
                    // Only consider the first 5 languages sent to prevent
                    // spinning on malformed requests.
                    //
                    return;
                }

                languagesAttempted++;
                if ( string.IsNullOrEmpty( acceptlang ) )
                {
                    continue;
                }

                string requestedLang = acceptlang;
                if ( requestedLang.IndexOf( ";" ) >= 0 )
                {
                    requestedLang = acceptlang.Substring( 0, requestedLang.IndexOf( ";" ) );
                }

                CultureInfo requestedCulture = null;
                try
                {
                    requestedCulture = CultureInfo.GetCultureInfo( requestedLang );
                }
                catch ( ArgumentException )
                {
                    //
                    // The requested culture was not a recognized .NET culture.
                    //
                    continue;
                }

                //
                // Test if the culture is supported by loading the resource set associated with it
                // and querying the Culture resource.  If it matches, we have a localized resource
                // set and should set the CurrentUICulture property appropriately.
                //
                ResourceSet set = Resources.CommonResources.ResourceManager.GetResourceSet( requestedCulture, true, true );

                if ( set.GetString( "Culture" ) == requestedCulture.ToString() )
                {
                    System.Threading.Thread.CurrentThread.CurrentUICulture = requestedCulture;
                    break;
                }

                //
                // If the request was for a specific culture (e.g., fr-FR), and we support the neutral culture (fr),
                // use the neutral culture.
                //
                if ( !requestedCulture.IsNeutralCulture && requestedCulture.Parent != null )
                {
                    set = Resources.CommonResources.ResourceManager.GetResourceSet( requestedCulture.Parent, true, true );

                    if ( set.GetString( "Culture" ) == requestedCulture.Parent.ToString() )
                    {
                        System.Threading.Thread.CurrentThread.CurrentUICulture = requestedCulture.Parent;
                        break;
                    }
                }
            }
        }
    }
}
