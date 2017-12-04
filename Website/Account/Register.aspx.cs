using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using Website;
using MockERKS.Framework.BLL;
using MockERKS.Framework.Entities;
using System.Data.SqlClient;

public partial class Account_Register : Page
{
    
    //Author :Sayed
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        string organizationName = OrganizationName.Text;
        string phone = Phone.Text;
        string email = Email.Text;
        string description = Description.SelectedValue;

        ClientController sysmgr = new ClientController();

        sysmgr.RegisterOrganization(organizationName,int.Parse(description),phone,email);

        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            if (!User.IsInRole("WebAdmins") && !User.IsInRole("Staff"))
            {
                Response.Redirect("~/AutomatedApprovalSystem/ClientPage.aspx");
            }
            else
            {
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}