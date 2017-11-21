using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_AutomatedApproval : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {


        }
        /*
        if(!Request.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");

        }

        if(!User.IsInRole("Staff")||!User.IsInRole("WebsiteAdmins"))
        {
            Response.Redirect("~/Account/Login.aspx");
        }
        */
    }
}