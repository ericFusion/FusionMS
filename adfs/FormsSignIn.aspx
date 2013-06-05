<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"  ValidateRequest="false"
    CodeFile="FormsSignIn.aspx.cs" Inherits="FormsSignIn" Title="<%$ Resources:CommonResources, FormsSignInPageTitle%>"
    EnableViewState="false" runat="server"%>
<%@ OutputCache Location="None" %>

<asp:Content ID="FormsSignInContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="GroupXLargeMargin"><asp:Label Text="<%$ Resources:CommonResources, FormsSignInHeader%>" runat="server" /></div>
    <table class="UsernamePasswordTable">
        <%--<tr>
            <td>
                <span class="Label"><asp:Label Text="<%$ Resources:CommonResources, UsernameLabel%>" runat="server" /></span>
            </td>
        </tr>--%>
        <tr>
            <td>
                <asp:TextBox runat="server" ID="UsernameTextBox" ></asp:TextBox>            
            </td>
        </tr>
        <tr>
            <td class="TextColorSecondary TextSizeSmall">
                <asp:Label Text="<%$ Resources:CommonResources, UsernameExample%>" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <span class="Label"><asp:Label Text="<%$ Resources:CommonResources, PasswordLabel%>" runat="server" /></span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox runat="server" ID="PasswordTextBox" TextMode="Password" ></asp:TextBox>            
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="TextSizeSmall TextColorError">
                <asp:Label ID="ErrorTextLabel" runat="server" Text="" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div class="CenterAlign GroupXLargeMargin">
                    <asp:Button ID="SubmitButton" runat="server" Text="<%$ Resources:CommonResources, FormsSignInButtonText%>" OnClick="SubmitButton_Click" CssClass="Resizable"/>
                </div>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
