using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_PDFReport : System.Web.UI.Page
{
    /*PDF Report
     * Author: Leban Mohamed
     * 
     * */
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BacktoLookup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Lookup.aspx");
    }
}