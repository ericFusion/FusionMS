<%@ Assembly Name="CustomLoginPageFBA, Version=1.0.0.0, Culture=neutral, PublicKeyToken=1194d845cb51c5a4" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomLogin.aspx.cs" Inherits="CustomLoginPageFBA.Layouts.CustomLoginPageFBA.CustomLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head id="Head1" runat="server">
    <title>Login Page </title>
    <style>
        body
        {
            color: #000000;
            font: 12px/1.4 arial,FreeSans,Helvetica,sans-serif;
            margin: 0;
			text-align:center;
			width:1021px;
			
        }
        #btnWinAuth
        {
            color:White;
        }
		div#container
		{
			position: absolute;
			left: 50%;
			width:1021px;
			margin-left: -510px;
			/*background-color:#B3B3B3;*/
			background-image:url('/_layouts/LoginResources/signin_BGgradient.jpg');
			background-repeat:repeat-x;
			height:100%;
		}

		.loginHeader
		{
			height:37px;
			background-image:url('/_layouts/LoginResources/headerBars.jpg');
		}
        #LoginBox
        {
            margin: 0 auto;
            min-width: 200px;
            padding: 1em;
            width: 470px;
            margin-top: 100px;
			color:#727272;
        }
        #LoginBox .Form-Content
        {
            -moz-border-radius: 0em 0em 0.4em 0.4em;
            background-color: #FFFFFF;
            border: 1px solid #BBBBBB;
            min-height: 50px;
            padding: 1em;
            position: relative;
            
			
        }
        #LoginBox .Form-Content h2
        {
            border-bottom: medium none;
            color: #333333;
            font-size: 1.6em;
            margin: 0 0 1em;
        }
        #LoginBox .LoginTextField
        {
            -moz-border-radius: 0.3em 0.3em 0.3em 0.3em;
            border: 1px solid #DDDDDD;
            margin: 0;
            padding: 2px;
            width: 160px;
        }
        #LoginBox .LoginButton
        {
            -moz-border-radius: 0.3em 0.3em 0.3em 0.3em;
            line-height: 1.2;
            margin: 10px 10px 0 0;
            padding: 0 0.5em;
        }
    </style>
    <link rel="shortcut icon" type="image/ico" href="/SiteAssets/favicon.ico"> 
</head>
<body>
<div id="container">    
    <div id="header">
		<img src="/_layouts/LoginResources/topBanner.jpg" alt="" />
		<br/>
    </div>
       
    

    <form id="form1" runat="server">
    <div style="clear: both;">
    </div>

    <div id="LoginBox">
		<div class="loginHeader">
            <div style="display:table-cell; vertical-align:middle">
			    <h2 align="left" style="padding-left:10px;color:#727272 !important;font-size:10pt;font-family:Verdana;font-weight:bold">Login</h2>
            </div>
		</div>
        <div class="Form-Content">
            <center>
            <table cellpadding="0" cellspacing="1">
                <tr>
                    <td style="width: 80px; white-space: nowrap; line-height: 2.4;">
                        Username:
                    </td>

                    <td>
						
                        <asp:textbox id="UserName" cssclass="LoginTextField" runat="server"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px; white-space: nowrap; line-height: 2.4;">
                        Password:
                    </td>
                    <td>

                        <asp:textbox id="Password" cssclass="LoginTextField" runat="server" textmode="Password"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lblError" runat="server"></asp:Label>

                    </td>
                </tr>
             </table>
             <asp:button id="Login" runat="server" cssclass="LoginButton" onclick="Login_Click"
                            text="Login" />
             
            </center>
            <p>
                &nbsp;</p>
        </div>
    </div>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
             <asp:linkbutton id="btnWinAuth" runat="server" cssclass="LoginButton" onclick="WinAuthLogin_Click"
                            text="PDI Users" />
    </form>
</div>
</body>
</html>
