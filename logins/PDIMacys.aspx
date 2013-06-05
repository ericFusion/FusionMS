<%@ Assembly Name="CustomLoginPageFBA, Version=1.0.0.0, Culture=neutral, PublicKeyToken=1194d845cb51c5a4" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomLogin.aspx.cs" Inherits="CustomLoginPageFBA.Layouts.CustomLoginPageFBA.CustomLogin" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>Sign in PDI - Macy's Maintenance Site.</title>
<meta name="viewport" content="width=500, initial-scale=1.5, maximum-scale=1.5">

<style type="text/css">
body
{
    overflow:hidden;
    margin:0;
    padding:0;
    font:bold 0.813em/100% 'Segoe UI', Verdana, Tahoma, sans-serif;
    background-color:#e2e2e2;
}
div.s4-simple-iconcont
{
    display:none;
}
body #s4-simple-content
{
    margin:0;
}
body #s4-simple-content h1
{
    display:none;
}
body #s4-simple-content img
{
    margin:-20px -30px 0px !important; 
}
body #s4-simple-card
{
    background-color:transparent;
}
footer
{
    height: 0.625em;
    width : 100%;
    padding-bottom : 1.250em;
    padding-top: 1.250em;
    text-align:right;
    background:#FFFFFF;
}
header
{
    text-align:center;
    font-family: 'Segoe-UI',Arial,Helvetica,Verdana,sans-serif;
    font-size:1.500em;
    color:#FFFFFF;
    height:50px;
    width:100%;
    background:#e01a2b;
}

header h3
{
margin: 0;
padding: 0;
padding-top: 15px;   
}

header h1
{
    margin:0;
}

input:focus { outline:none; }

footer a
{
    display:block;
    color:rgb(129, 124, 124);
    font-weight:bold;
    text-decoration:none;
    font-size:1.025em;
    margin-right:5px;
    transition:all 1s;
    -o-transition:all 1s;
    -webkit-transition:all 1s;
    -moz-transition:all 1s;
    text-align:right;
    float:right;
}
footer a:hover
{
    color:#000000;
}
footer a:active
{
    text-decoration:underline;
}
.LoginTextField
{
    border:none;
    outline:none;
    padding:2px;
    margin:2px;
    height:25px; 
    line-height:25px; 
    text-indent:5px; 
    transition:background 1s, width 1s;
    -moz-tranisition:background 1s, width 1s;
    -webkit-transition:background 1s, width 1s;
    background:rgb(119, 116, 116);
    width:200px;
}


.LoginTextField:hover
{
    background:#DADADA;
}

.LoginTextField:focus
{
    background:#AAA9A9;
}

img
{
    max-width:100%;
}
.Form-Content
{
    padding-top:5px;
    padding-bottom:5px;
}
#container
{
    position:relative;
    margin:0 auto;
    width:100%; 
    max-width:475px;
    min-width:400px;
    height:100%;
    max-height:320px;
    min-height:100px;
    margin-top:20px;
}

span
{
    font-size:0.7em;
    text-align:center;
    display:block;
    margin:0 auto;
}
.button1 
{
    font-family: 'Segoe UI', Helvetica, Arial, sans-serif;
    font-size: 1.500em;
    color: #000000;
    padding: 0px 10px 5px 10px;
    text-shadow: 0px 1px 0px #FFF;
    border:none;
    cursor: pointer;
    transition:color 0.5s;
    -o-transition:color 0.5s;
    -webkit-transition:color 0.5s;
    -moz-transition:color 0.5s;
    width:100px;
    display:block;
    margin:0px auto 0px auto;
    background:transparent;
    font-weight:bold;
}
.button1:hover 
{
    color:#e01a2b;
}
.button1:active
{
    color:#e01a2b;
}
table
{
    color:#000000;
    margin:0 auto;
}
#LoginBox
{
    background:#FFFFFF;

}
footer img
{
float:left;
margin-left:20px;
}
.highlight
{
    color:#FFA403 !important; 
    text-align: left;
    display: inline;
    margin: 0px;
    font-size: 1.2em;
}
</style>
<link rel="shortcut icon" type="image/ico" href="/SiteAssets/favicon.ico" /> 
</head>
<body>
<section id="container" role="Login">    
    <header>
		<h3>Login to PDI Maintenance</h3>
    </header>
     <form id="form1" runat="server" autocomplete="off">
     <div id="LoginBox">
        <div class="Form-Content">
            <table>
                <tr>
                    <td>Username: </td>
                </tr>
                <tr>
                    <td>
                        <asp:textbox id="UserName" cssclass="LoginTextField" runat="server"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td>Password: </td>
                </tr>
                <tr>
                    <td>
                        <asp:textbox id="Password" cssclass="LoginTextField" runat="server" textmode="Password"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
             </table>
             <asp:button id="Login" runat="server" cssclass="button1" onclick="Login_Click" text="Sign in" />
         </div>
     </div>
        <footer>
        <img href="images/pdilogo.png" alt="PDI Logo" />
             <asp:linkbutton id="btnWinAuth" runat="server" cssclass="LoginButton" onclick="WinAuthLogin_Click" text="Internal Users" />
        </footer>
    </form>
</section>
</body>
</html>