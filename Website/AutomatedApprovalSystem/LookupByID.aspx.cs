using MockERKS.Framework.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_LookupByID : System.Web.UI.Page
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

   

    public void GetRecordDetailInfo()
    {
        StaffController stamgr = new StaffController();
        var rdList = stamgr.RDSummaryByOfficerID(OfficersDropdown.SelectedIndex);
        

    }
    #region Dropdowns



    #endregion


    protected void OfficersDropdown_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(OfficersDropdown.SelectedIndex == 0)
        {
            MessageUserControl.ShowInfo("Pick an Officer");
        }
        else
        {
            MessageUserControl.TryRun(() => {
                int officerID = int.Parse(OfficersDropdown.SelectedValue);
                string officerName = OfficersDropdown.SelectedValue;

                StaffController sysmgr = new StaffController();

                sysmgr.RDSummaryByOfficerID(officerID);
                RecordDetailsByEmployeeDS.DataBind();
            }, "Officer Changed", "The Record details were retrieved.");
        }

       
        
    }




        
         
    }