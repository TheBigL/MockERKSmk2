using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_OrganizationFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        


    }

    protected void OrganizationDropdown_SelectedIndexChanged(object sender, EventArgs e)
    {
        int organizationID = OrganizationDropdown.SelectedIndex;
        string organizationName = OrganizationDropdown.SelectedItem.Text;

    }


    protected void organizationDropdownreset(string selectedValue)
    {
        OrganizationDropdown.DataBind();
        OrganizationDropdown.Items.Insert(0, "[Select an Organization]");
        if (OrganizationDropdown.SelectedValue.Contains(selectedValue))
        {
            OrganizationDropdown.SelectedIndex = 0;
        }


    }
}