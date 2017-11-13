using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_FileForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {

        }

        //Redirects the user if the user is not authenticated.
        if (!Request.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }

        //Redirects the user if the user is neither a Website Admin or a Staff member.
        else if (!User.IsInRole("WebAdmin") || !User.IsInRole("Staff"))
        {
            Response.Redirect("~/Account/Login.aspx");
        }

    }
}