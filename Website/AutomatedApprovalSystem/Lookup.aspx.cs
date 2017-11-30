using MockERKS.Framework.BLL;
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
        int ID = int.Parse(GridView1.Rows[gvr.RowIndex].Cells[2].Text);
        StaffController sc = new StaffController();
        sc.getOrganization(ID);



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
}