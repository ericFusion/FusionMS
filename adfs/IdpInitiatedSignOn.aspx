<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" 
    AutoEventWireup="true" CodeFile="IdpInitiatedSignOn.aspx.cs" Inherits="IdpInitiatedSignOn" 
    Title="<%$ Resources:CommonResources, IdpInitiatedSignOnPageTitle%>" 
    EnableViewState="false" runat="server"%>

<%@ OutputCache Location="None" %>
<asp:Content ID="SignInContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Panel ID="LoginStatusLabel" runat="server" CssClass="GroupXLargeMargin">
<asp:Label Text="<%$ Resources:CommonResources, SignedInText%>" runat="server" />
        <div class="Divider"></div>
        </asp:Panel>
        <asp:Panel ID="LogoutStatusLabel" runat="server" CssClass="GroupXLargeMargin">
        <asp:Label Text="<%$ Resources:CommonResources, NotSignedInText%>"  runat="server" />
        <div class="Divider"></div>
        </asp:Panel>
        <div class="GroupXLargeMargin">
            <asp:Panel ID="SelectASiteToSignInToPanel" runat="server" CssClass="GroupLargeMargin">
                <asp:Label Text="<%$ Resources:CommonResources, SelectASiteText%>" runat="server" />
            </asp:Panel>
            <div class="RadioButtonGroup">
                <asp:Panel runat="server" ID="ThisRpPanel" CssClass="Radio GroupNormalMargin">
                    <label>
                        <asp:RadioButton ID="ThisRpRadioButton" runat="server" GroupName="group1" AutoPostBack="true"
                        OnCheckedChanged="SetRpListState" Checked="True" />
                    <span class="CtrlTextRight"><asp:Label Text="<%$ Resources:CommonResources, SignInCurrentSiteRadioButtonText%>" runat="server" /></span>
                    </label>
                </asp:Panel>
                <asp:Panel runat="server" ID="OtherRpPanel" CssClass="Radio GroupNormalMargin">
                    <label>
                        <asp:RadioButton ID="OtherRpRadioButton" runat="server" GroupName="group1"
                        OnCheckedChanged="SetRpListState"
                        AutoPostBack="true" />
                        <asp:Label ID="SignInToASiteLabel" runat="server" CssClass="CtrlTextRight" Text="<%$ Resources:CommonResources, SignInOtherSiteRadioButtonText%>"></asp:Label>
                        <asp:Label ID="SelectASiteLabel" runat="server" CssClass="CtrlTextRight"
                        Text="<%$ Resources:CommonResources, SelectAsiteRadioButtonText%>"></asp:Label>
                    </label>
                    <div class="Indent2 GroupNormalMargin">
                        <asp:DropDownList ID="RelyingPartyDropDownList" DataTextField="Name" DataValueField="Id" runat="server" Enabled="False"/>
                    </div>
                    <div class="Indent2 GroupNormalMargin"> <asp:Label ID="ConsentLabel" runat="server" Style="vertical-align: middle; text-align: left"
                            Font-Bold="false" Font-Size="small" Text="<%$ Resources:CommonResources, ConsentDropDownText%>"/>

                        <asp:DropDownList ID="ConsentDropDownList" DataTextField="Name" DataValueField="Id" runat="server" Enabled="False">
                            <asp:ListItem Text="<%$ Resources:CommonResources, ConsentUnspecified%>" Value="urn:oasis:names:tc:SAML:2.0:consent:unspecified" Selected="True"/>
                            <asp:ListItem Text="<%$ Resources:CommonResources, ConsentObtained%>" Value="urn:oasis:names:tc:SAML:2.0:consent:obtained"/>
                            <asp:ListItem Text="<%$ Resources:CommonResources, ConsentPrior%>" Value="urn:oasis:names:tc:SAML:2.0:consent:prior"/>
                            <asp:ListItem Text="<%$ Resources:CommonResources, ConsentImplicit%>" Value="urn:oasis:names:tc:SAML:2.0:consent:current-implicit"/>
                            <asp:ListItem Text="<%$ Resources:CommonResources, ConsentExplicit%>" Value="urn:oasis:names:tc:SAML:2.0:consent:current-explicit"/>
                            <asp:ListItem Text="<%$ Resources:CommonResources, ConsentUnavailable%>" Value="urn:oasis:names:tc:SAML:2.0:consent:unavailable"/>
                            <asp:ListItem Text="<%$ Resources:CommonResources, ConsentInapplicable%>" Value="urn:oasis:names:tc:SAML:2.0:consent:inapplicable"/>
                        </asp:DropDownList>
                    </div>
                </asp:Panel>
            </div>

            <asp:Panel ID="SignInPanel" runat="server" CssClass="GroupXXLargeMargin">
                <asp:Button runat="server" ID="SignInButton" Text="<%$ Resources:CommonResources, HomeRealmSignInButtonText%>" EnableViewState="False"
                    OnClick="SignInButton_Click" CssClass="Resizable"/>
            </asp:Panel>
            <asp:Panel ID="SignOutPanel1" runat="server" CssClass="GroupXLargeMargin">
                <asp:Button runat="server" ID="GoButton" Text="<%$ Resources:CommonResources, GoButtonText%>" EnableViewState="False"
                    OnClick="SignInButton_Click" CssClass="Resizable"/>
            </asp:Panel>
            <asp:Panel ID="SignOutPanel2" runat="server" CssClass="Divider"></asp:Panel>
        </div>
        <asp:Panel ID="SignOutPanel3" runat="server" CssClass="GroupXLargeMargin">
            <div class="GroupNormalMargin">
                <asp:Button ID="SingleLogoutButton" runat="server" Text="<%$ Resources:CommonResources, SignOutButtonText%>" EnableViewState="False"
                    OnClick="SingleLogoutButton_Click" CssClass="Resizable"/> 
                <span class="Indent1"><asp:Label Text="<%$ Resources:CommonResources, SingleSignOutText%>" runat="server" /></span>
            </div>
            <div class="GroupNormalMargin">
                <asp:Button ID="LocalLogoutButton" runat="server" Text="<%$ Resources:CommonResources, SignOutButtonText%>" EnableViewState="False"
                    OnClick="LocalLogoutButton_Click" CssClass="Resizable"/>
                <span class="Indent1"><asp:Label Text="<%$ Resources:CommonResources, LocalSignOutText%>" runat="server" /></span>
            </div>
        </asp:Panel>
</asp:Content>
