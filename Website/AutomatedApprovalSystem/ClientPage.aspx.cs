﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_ClientPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }

    protected void AddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("FileForm.aspx");
    }

    protected void CreatedFileData_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        System.Diagnostics.Debug.WriteLine(User.Identity.Name);
        e.InputParameters["currUser_Name"] = User.Identity.Name;
    }

    protected void ReportLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/FileReport");
    }

    protected void Upload_Click(object sender, EventArgs e)
    {
        Response.Redirect("UploadPDF.aspx");
    }
}