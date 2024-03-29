﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_OrganizationReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }

        else if (User.IsInRole("Client"))
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void backtoLookup_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Lookup.aspx");
    }
}