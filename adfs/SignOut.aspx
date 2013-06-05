<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="SignOut.aspx.cs" Inherits="SignOut"
   Title="<%$ Resources:CommonResources, SignOutPageTitle%>"  EnableViewState="false" runat="server"%>
<%@ OutputCache Location="None" %>
<asp:Content ID="SignOutContent" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="DivSigningOut">
    <div class="GroupXLargeMargin">
        <asp:Label Text="<%$ Resources:CommonResources, SigningOutText%>"  runat="server" />
    </div>
    <div class="GroupXXLargeMargin Spinner">
        <img src="App_Themes/Default/Spinner.gif" />
        <div class="TextSizeSmall GroupXLargeMargin">
            <asp:Label Text="<%$ Resources:CommonResources, WaitText%>" runat="server" />
        </div>
    </div>

    <asp:Repeater runat="server" ID="CleanupUrisRepeater">
        <ItemTemplate>
    <iframe class="NotShown" src="<%# HttpUtility.HtmlAttributeEncode((string)DataBinder.Eval(Container.DataItem, "Url")) %>"></iframe>
        </ItemTemplate>
    </asp:Repeater>
    </div>
    <div id="DivSignedOut" class="NotRendered">
        <div class="GroupXLargeMargin">
            <asp:Label Text="<%$ Resources:CommonResources, SucessfulSignoutText%>" runat="server" />
        </div>
        <div class="GroupXLargeMargin">
            <asp:Label Text="<%$ Resources:CommonResources, SignOutWarning%>" runat="server" />
        </div>
        <div class="goBack">
            <a href="http://auth.mwc.ms/" >Sign back in.</a>
        </div>
    </div>

    <script>
        window.onload = function()
        {
            document.getElementById( 'DivSigningOut' ).setAttribute( "class", "NotRendered" );
            document.getElementById( 'DivSigningOut' ).setAttribute( "className", "NotRendered" );

            document.getElementById( 'DivSignedOut' ).setAttribute( "class", "" );
            document.getElementById( 'DivSignedOut' ).setAttribute( "className", "" );
        }
    </script>
</asp:Content>
