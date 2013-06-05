//------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//------------------------------------------------------------

using System;

using Microsoft.IdentityServer.Web.UI;

/// <summary>
/// This page sends WS-Federation SignOutCleanup messages to all the relying parties
/// that the user has signed in to during this session.
/// </summary>
public partial class SignOut : SignOutPage
{
    protected void Page_Load( object sender, EventArgs e )
    {
        CleanupUrisRepeater.DataSource = SignOutMessages;
        CleanupUrisRepeater.DataBind();
    }
}
