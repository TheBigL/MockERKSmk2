using MockERKS.Framework.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_ClientForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ResetForm_Click(object sender, EventArgs e)
    {
        clientID.Text = "";
        ClientName.Text = "";
        ClientDescription.SelectedIndex = 0;
        ClientPhone.Text = "";
        ClientEmail.Text = "";
    }


    /*
     * Add Client Click
     * Author: Leban Mohamed
     * */
    protected void AddClient_Click(object sender, EventArgs e)
    {
        ClientController sysman = new ClientController();
        string clientName = ClientName.Text;
        string description = ClientDescription.Text;
        int phone = Int32.Parse(ClientPhone.Text);

       

    }
}