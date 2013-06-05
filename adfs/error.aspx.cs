//------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//------------------------------------------------------------

using System;

using Microsoft.IdentityServer.Web;
using Microsoft.IdentityServer.Web.UI;

/// <summary>
/// Shows the error page
/// </summary>
public partial class Error : ErrorPage
{
    protected void Page_Load( object sender, EventArgs e )
    {
        AuthorizationFailedException authorizationException = Exception as AuthorizationFailedException;
        AuthenticationFailedException authenticationException = Exception as AuthenticationFailedException;
        if( authorizationException != null )
        {
            //
            // To provide customized authorization error messages, inspect the RequestedRelyingParty
            // property of the authorizationException.  It will contain the identifier of
            // the Relying Party Trust for whom the user is not authorized.
            //
            ExceptionMessageLabel.Visible = true;
            ExceptionMessageLabel.Text = Resources.CommonResources.UnauthorizedText;
            Title = Resources.CommonResources.AccessDeniedTitle;
        }
        else if( authenticationException != null )
        {
            ExceptionMessageLabel.Visible = true;
            ExceptionMessageLabel.Text = Resources.CommonResources.UnauthenticatedText;
        }
        else
        {
            ExceptionMessageLabel.Visible = System.Web.Configuration.WebConfigurationManager.AppSettings[ "displayExceptions" ] != null;
            ExceptionMessageLabel.Text = Exception != null ? Exception.Message : String.Empty;
        }
    }
}
