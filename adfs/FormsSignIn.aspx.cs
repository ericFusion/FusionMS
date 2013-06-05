//------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//------------------------------------------------------------

using System;

using Microsoft.IdentityServer.Web;
using Microsoft.IdentityServer.Web.UI;

/// <summary>
/// Attempts to authenticate the user via HTTP Forms Authentication.
/// </summary>
public partial class FormsSignIn : FormsLoginPage
{
    protected void Page_Load( object sender, EventArgs e )
    {
    }

    protected void HandleError( string message )
    {
        ErrorTextLabel.Visible = true;
        ErrorTextLabel.Text = Resources.CommonResources.IncorrectUsernameText;
    }

    protected void SubmitButton_Click( object sender, EventArgs e )
    {
        try
        {
            SignIn( UsernameTextBox.Text, PasswordTextBox.Text );
        }
        catch ( AuthenticationFailedException ex )
        {
            HandleError( ex.Message );
        }
    }
}
