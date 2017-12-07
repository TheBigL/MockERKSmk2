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
       resetDropdownValues("0");
    }

    public void resetDropdownValues(string selectedValue)
    {
        OfficersDropdown.DataBind();
        OrganizationDropdown.DataBind();
        OfficersDropdown.Items.Insert(0, "[Select an Officer]");
        OrganizationDropdown.Items.Insert(0, "[Select an Organization]");
        if(OfficersDropdown.SelectedValue.Contains(selectedValue))
        {
            OfficersDropdown.SelectedIndex = 0;
        }

        if (OrganizationDropdown.SelectedValue.Contains(selectedValue))
        {
            OfficersDropdown.SelectedIndex = 0;
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
        int officerID = OfficersDropdown.SelectedIndex;
        string officerName = OfficersDropdown.SelectedValue;

        StaffController sysmgr = new StaffController();

        sysmgr.RDSummaryByOfficerID(officerID);
        RecordDetailsByEmployeeDS.DataBind();
    }

    protected void OfficerDropdownReset_Click(object sender, EventArgs e)
    {
        resetDropdownValues(OrganizationDropdown.SelectedValue.ToString());
        resetDropdownValues(OfficersDropdown.SelectedValue.ToString());
    }
}