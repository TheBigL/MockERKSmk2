using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MockERKS.Framework.BLL;
using Microsoft.AspNet.Identity;

public partial class AutomatedApprovalSystem_FileReport : System.Web.UI.Page
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

    protected void ODSFileReport_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["currUser_Name"] = Context.User.Identity.GetUserName();
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ClientPage.aspx");
    }

    protected void BacktoLookup_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Lookup.aspx");
    }
}