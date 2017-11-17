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
    
   

    protected void CreateUser_Click(object sender, EventArgs e)
    {
        ClientController sysmgr = new ClientController();
        Organization neworg = new Organization();
        neworg.Organization_Name = OrganizationName.Text;
        neworg.Organization_Description = Description.SelectedValue;
        neworg.Phone = Convert.ToInt32(this.Phone.Text);
        neworg.Email = Email.Text;


       var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}