using System;
using MockERKS.Framework.BLL;
using Microsoft.AspNet.Identity;
using MockERKS.Framework.Entities.Security;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin_File_Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else
            {
                if (!User.IsInRole(SecurityRoles.WebAdmins))
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
            }
        }

        
    }
    protected void CheckForException(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MessageUserControl.HandleDataBoundException(e);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SiteFileGridView.Visible = true;
    }
}