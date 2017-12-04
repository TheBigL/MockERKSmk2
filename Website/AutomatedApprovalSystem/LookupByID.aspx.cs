﻿using MockERKS.Framework.BLL;
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
       
    }

    public void resetDropdownValues(string selectedValue)
    {
        OfficersDropdown.DataBind();
        OfficersDropdown.Items.Insert(0, "[Select an Officer]");
        if(OfficersDropdown.SelectedValue.Contains(selectedValue))
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

}