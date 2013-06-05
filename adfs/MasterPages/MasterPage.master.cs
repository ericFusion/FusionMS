//------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//------------------------------------------------------------

using System;
using System.Web.UI;

public partial class MyMasterPage : Microsoft.IdentityServer.Web.UI.MasterPage
{
    protected void Page_Load( object sender, EventArgs e )
    {
        PageTitleLabel.Text = Page.Title;
        STSLabel.Text = "FusionMS Sign In";
        STSFooter.Text = "This is a secured, private computer system owned by FusionMS. All Information contained on this system is deemed to be PRIVATE, PROPRIETARY, CONFIDENTIAL and the property of FusionMS, its affiliates, divisions or subsidiaries. Unauthorized access or use is strictly prohibited.";
    }
}
