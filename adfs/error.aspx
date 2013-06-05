<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
ValidateRequest="false" CodeFile="Error.aspx.cs"
Inherits="Error" Title="<%$ Resources:CommonResources, ErrorPageTitle%>"
EnableViewState="false" runat="server" %>
 <%@ OutputCache Location="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="GroupLargeMargin"><asp:Label Text="<%$ Resources:CommonResources, GenericErrorText%>" runat="server" /></div>
    <div class="GroupLargeMargin"><asp:Label Text="<%$ Resources:CommonResources, GenericErrorTextFurtherHelp%>" runat="server" /></div>
    <div class="GroupLargeMargin"><asp:Label runat="server" ID="ExceptionMessageLabel" Visible=false /> </div>
    <div class="GroupLargeMargin"><span class="TextWeightBold"><asp:Label Text="<%$ Resources:CommonResources, AdditionalInfoText%>" runat="server" /></span> <%= ActivityId %>
    </div>
</asp:Content>

