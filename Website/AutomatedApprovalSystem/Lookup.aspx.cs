﻿using MockERKS.Framework.BLL;
using MockERKS.Framework.Entities.POCOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_LookupFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Request.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }

        else if(User.IsInRole("Client"))
        {
            Response.Redirect("~/Default.aspx");
        }

    }



    protected void ReportLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/FileReport");
    }

    protected void ToOfficerReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/Staff");
    }

    protected void OrganizationLinkReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/OrganizationReport");
    }

    protected void ManagerReportLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/ManagerReport");
    }
}