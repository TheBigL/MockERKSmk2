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

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridView1.DataBind();


        organizationRegistrationPOCO org = new organizationRegistrationPOCO();

        GridViewRow gvr = GridView1.SelectedRow;
        org.Organization_ID = int.Parse(GridView1.Rows[gvr.RowIndex].Cells[2].Text);
        org.Organization_Name = GridView1.Rows[gvr.RowIndex].Cells[0].Text;
        org.Phone = GridView1.Rows[gvr.RowIndex].Cells[3].Text;
        org.Organization_Description = GridView1.Rows[gvr.RowIndex].Cells[1].Text;
        org.Email = GridView1.Rows[gvr.RowIndex].Cells[4].Text;




    }
}