//------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//------------------------------------------------------------

using System;

using Microsoft.IdentityServer.Web.Configuration;
using Microsoft.IdentityServer.Web.UI;

/// <summary>
/// This page enables home realm discovery if this STS is configured to trust multiple claims providers.
///
/// If the persistIdentityProviderInformation setting is enabled and the user has previously
/// selected a claims provider, that claims provider will be used automatically.
/// </summary>
public partial class HomeRealmDiscovery : Microsoft.IdentityServer.Web.UI.HomeRealmDiscoveryPage
{
    protected void Page_Init( object sender, EventArgs e )
    {
        PassiveIdentityProvidersDropDownList.DataSource = base.ClaimsProviders;
        PassiveIdentityProvidersDropDownList.DataBind();
    }    

    protected void PassiveSignInButton_Click( object sender, EventArgs e )
    {
        SelectHomeRealm( PassiveIdentityProvidersDropDownList.SelectedItem.Value );
    }
}
