//------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//------------------------------------------------------------

using System;
using System.Web.UI;
using System.Collections.ObjectModel;

using Microsoft.IdentityServer.Web;
using Microsoft.IdentityServer.Web.UI;

/// <summary>
/// This page allows the user to initiate a sign-in to a relying party from this STS.
///
/// By choosing the relying party from the drop-down list, the user will first sign in
/// to this claims provider (either directly or by federating with another claims provider),
/// and will then be redirected to the chosen relying party with the appropriate token.
/// </summary>
public partial class IdpInitiatedSignOn : IdentityProviderInitiatedSignonPage
{
    const string RpIdentityQueryParameter = "loginToRp";
    const string IdpAsRpIdentifier = "self";
    Collection<Control> _loggedInControls;
    Collection<Control> _loggedOutControls;

    private void PopulateConditionalVisibilityControls()
    {
        _loggedInControls = new Collection<Control>();
        _loggedInControls.Add( LoginStatusLabel );
        _loggedInControls.Add( GoButton );
        _loggedInControls.Add( SelectASiteLabel );
        _loggedInControls.Add( SignOutPanel2 );
        _loggedInControls.Add( SignOutPanel3 );

        _loggedOutControls = new Collection<Control>();
        _loggedOutControls.Add( LogoutStatusLabel );
        _loggedOutControls.Add( SelectASiteToSignInToPanel );
        _loggedOutControls.Add( SignInToASiteLabel );
        _loggedOutControls.Add( ThisRpPanel );
        _loggedOutControls.Add( SignInButton );
        _loggedOutControls.Add( SignInPanel );

    }

    protected void Page_Init( object sender, EventArgs e )
    {
        string rpIdentity = Context.Request.QueryString[RpIdentityQueryParameter];

        //
        // If the query string specified a certain relying party, sign in to that relying party.
        //
        if ( !String.IsNullOrEmpty( rpIdentity ) )
        {
            string decodedIdentity = Server.UrlDecode( rpIdentity );

            if ( decodedIdentity == IdpAsRpIdentifier )
            {
                decodedIdentity = String.Empty;
            }

            SignIn( rpIdentity, new SignOnRequestParameters() );
        }
        else
        {
            PopulateConditionalVisibilityControls();

            RelyingPartyDropDownList.DataSource = RelyingParties;
            RelyingPartyDropDownList.DataBind();

            UpdateText();
        }
    }

    protected void SetRpListState( object sender, EventArgs e )
    {
        RelyingPartyDropDownList.Enabled = OtherRpRadioButton.Checked;
        ConsentDropDownList.Enabled = OtherRpRadioButton.Checked;
    }

    void UpdateText()
    {
        foreach ( Control control in _loggedInControls )
        {
            control.Visible = IsAuthenticated;
        }

        foreach ( Control control in _loggedOutControls )
        {
            control.Visible = !IsAuthenticated;
        }

        ConsentLabel.Visible = ConsentDropDownList.Visible =
            System.Web.Configuration.WebConfigurationManager.AppSettings["displayConsent"] != null;

        OtherRpPanel.Visible = RelyingParties.Rows.Count > 0;

        if ( !ThisRpPanel.Visible && RelyingParties.Rows.Count > 0 )
        {
            OtherRpRadioButton.Checked = true;
            SetRpListState( null, null );
        }

        SignOutPanel1.Visible = ThisRpPanel.Visible || OtherRpPanel.Visible;
    }

    #region Event Handlers

    protected void LocalLogoutButton_Click( object sender, EventArgs e )
    {
        LocalLogout();
        UpdateText();
    }

    protected void SignInButton_Click( object sender, EventArgs e )
    {
        string rpIdentity = String.Empty;
        SignOnRequestParameters parameters = new SignOnRequestParameters();

        if ( OtherRpRadioButton.Checked )
        {
            rpIdentity = RelyingPartyDropDownList.SelectedItem.Value;

            //
            // The RequestedAuthenticationContext and IsPassive properties
            // of the AuthnRequest may be customized by setting properties
            // on the SignOnRequestParameters used here.
            //

            if ( ConsentDropDownList.Visible )
            {
                parameters.Consent = new Uri( ConsentDropDownList.SelectedItem.Value );
            }
        }

        SignIn( rpIdentity, parameters );
    }

    protected void SingleLogoutButton_Click( object sender, EventArgs e )
    {
        SingleLogout();
    }

    #endregion
}

