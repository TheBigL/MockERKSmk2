using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additional Namespaces
using MockERKS.Framework.Entities;
using MockERKS.UI;
using MockERKS.Framework.BLL;
#endregion

public partial class AutomatedApprovalSystem_StaffForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ResetForm_Click(object sender, EventArgs e)
    {
        StaffID.Text = "";
        StaffName.Text = "";
        StaffPhone.Text = "";
        StaffEmail.Text = "";
    }

    protected void SaveForm_Click(object sender, EventArgs e)
    {
        // Retest the validation of the incoming data via the Validation Controls
        if (IsValid)
        {
            MessageUserControl.TryRun(() =>
            {

            });
        }
    }
}