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
<title>Sign in to the FusionMS Team Site</title>
<link href='http://fonts.googleapis.com/css?family=Lobster|Anton' rel='stylesheet' type='text/css'/>
<script type="text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<!--[if lt IE 9]>
<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script type="text/javascript">
    /*Centering box horizontally and vertically using jQuery due to responsive box height/width, adding HTML5 tag if IE8 and above, bypasing CSS 2.1 :before pseudo tag*/
    $(document).ready(function () {
        if (!($.browser.msie && $.browser.version == 7.0)) {
            $('#footer a').before("<img src='images/HTML5_Connectivity_64.png' alt='Connect'/>");
        }
        else { $('#html5').remove(); }

        $(window).resize(function () {
            $('#container').css({
                margin: '0 0 0 0',
                position: 'relative',
                left: ($(window).width() - $('#container').outerWidth()) / 2,
                top: ($(window).height() - $('#container').outerHeight()) / 2.25
            });
            $('#footer img').css({
                position: ' relative',
                margin: '-2% 5px 0px 0px',
                width: '6%',
                opacity: '0.5'
            });
        });
        $(window).resize();
    });
</script>
<style type="text/css">
/*Style must be inline due to IE issue*/
body
{
    overflow:hidden;
    margin:0;
    padding:0;
    background-image:url('images/bg.png');
    background-position:top;
    background-repeat:repeat-x;
    background-color:#2c80af;
    font:bold 0.813em/100% Verdana, Tahoma, sans-serif;
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
    margin-top:1.250em;
    text-align:right;
    background:url('images/content.png');
    background-repeat:repeat;
    border-radius:10px;
    -moz-border-radius:10px;
    -webkit-border-radius:10px;
    -o-border-radius:10px;
}
header
{
    line-height:200%;
    text-align:center;
    font-family: 'Lobster', cursive;
    font-size:2.500em;
    text-outline:solid black;
    color:#FFFFFF;
    opacity: 0.9;
    transition:transform 1s,color 1s;
    -moz-transition:moz-transform 1s,color 1s;
    -o-tranisiton:-o-transform 1s,color 1s;
    -webkit-transition:-webkit-transform 1s,color 1s;
    -ms-transition:-ms-transition 1s,color 1s; 
}
header h1
{
    margin:0;
}
header:hover
{
    color:#F3BD4B;
    -moz-transform: scale(1.2) rotate(-5deg) translate(0px, 0px) skew(0deg, 0deg);
    -webkit-transform: scale(1.2) rotate(-5deg) translate(0px, 0px) skew(0deg, 0deg);
    -o-transform: scale(1.2) rotate(-5deg) translate(0px, 0px) skew(0deg, 0deg);
    -ms-transform: scale(1.2) rotate(-5deg) translate(0px, 0px) skew(0deg, 0deg);
    transform: scale(1.2) rotate(-5deg) translate(0px, 0px) skew(0deg, 0deg);
}
footer a
{
    display:block;
    color:#7BA7CA;
    font-weight:bold;
    font-size:0.825em;
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
    text-shadow: 0px 0px 10px #E9E7CD;
    color:#222222;
}
footer a:active
{
    color:#F3BD4B;
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
    background:#FFFFFF;
}
.LoginTextField:hover
{
    width:170px !important;
    background:#DADADA;
}
.LoginTextField:focus
{
    width:200px !important;
    background:#AAA9A9;
}
.LoginTextField
{
    width:140px !important;
}
img
{
    max-width:100%;
}
#container
{
    position:relative;
    margin:0 auto;
    width:100%; 
    max-width:360px;
    min-width:300px;
    height:100%;
    max-height:320px;
    min-height:100px;
    -webkit-border-radius:50px;
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
    font-family: 'Anton', sans-serif;
    font-size: 1.500em;
    color: #FFF;
    padding: 5px 10px 5px 10px;
    text-shadow: 0px 1px 0px #000;
    border:none;
    cursor: pointer;
    transition:color 0.2s;
    -o-transition:color 0.2s;
    -webkit-transition:color 0.2s;
    -moz-transition:color 0.2s;
    width:100px;
    display:block;
    margin:5px auto 0px auto;
    background:transparent;
}
.button1:hover 
{
    color:#92C1E0
}
.button1:active
{
    color:#DF963A;
}
table
{
    color:#FFFFFF;
    margin:0 auto;
    text-transform:lowercase;
}
#LoginBox
{
    background:url('images/content.png');
    background-repeat:repeat;
    border-radius:10px;
    -moz-border-radius:10px;
    -webkit-border-radius:10px;
    -o-border-radius:10px;
}
#html5
{
    position:absolute;
    bottom:10px;
    left:30px;
    opacity:0.5;
    transition:opacity 1s;
    -moz-transition:opacity 1s;
    -webkit-transition:opacity 1s;
    -o-transition:opacity 1s;
}
#html5 img
{
    outline:none;
    border:0;
}
#html5:hover
{
    opacity:1.0;   
}
@media screen and (max-width: 800px) {
#html5 {
    display:none;
  }
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
		<h1>Fusion<span class="highlight">MS</span></h1>
    </header>
     <form id="form1" runat="server">
     <div id="LoginBox">
        <div class="Form-Content">
            <table>
                <tr>
                    <td> Username: </td>
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
             <asp:linkbutton id="btnWinAuth" runat="server" cssclass="LoginButton" onclick="WinAuthLogin_Click" text="Internal Users" />
        </footer>
    </form>
</section>
<div id="html5">
<a href="http://www.w3.org/html/logo/">
<img src="http://www.w3.org/html/logo/badge/html5-badge-v-css3-device-semantics.png" width="38" height="170" alt="HTML5 Powered with CSS3 / Styling, Device Access, and Semantics" title="HTML5 Powered with CSS3 / Styling, Device Access, and Semantics"/>
</a>
</div>
</body>
</html>