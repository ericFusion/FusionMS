<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
CodeFile="HomeRealmDiscovery.aspx.cs"
ValidateRequest="false"
Inherits="HomeRealmDiscovery" Title="<%$ Resources:CommonResources, HomeRealmDiscoveryPageTitle%>"
EnableViewState="false" runat="server"%>
<%@ Register TagPrefix="adfs" Namespace="Microsoft.IdentityServer.Web.UI" assembly="Microsoft.IdentityServer" %>
<%@ OutputCache Location="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="GroupXLargeMargin">
            <asp:Label Text="<%$ Resources:CommonResources, HomeRealmSelectionText%>"  runat="server" />
        </div>
        <div class="GroupXXLargeMargin">
            <asp:DropDownList ID="PassiveIdentityProvidersDropDownList" DataTextField="Name" DataValueField="Id" runat="server"></asp:DropDownList>

            <div>
                <asp:Button runat="server" ID="PassiveSignInButton" Text="<%$ Resources:CommonResources, HomeRealmSignInButtonText%>" EnableViewState="False"
                OnClick="PassiveSignInButton_Click" CssClass="Resizable"/>
            </div>
        </div>
</asp:Content>

