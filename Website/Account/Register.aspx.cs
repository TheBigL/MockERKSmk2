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

    SqlCommand cmd = new SqlCommand();
    SqlConnection sysmgr = new SqlConnection();

    protected void CreateUser_Click(object sender, EventArgs e)
    {

        SqlCommand cmd = new SqlCommand("insert into Organization" + "Organization_Name,Email,Phone,Description)values (@Organization_Name,@Email,@Phone,@Description)",sysmgr);
        cmd.Parameters.AddWithValue("@Organization_Name", OrganizationName.Text);
        cmd.Parameters.AddWithValue("@Email", Email.Text);
        cmd.Parameters.AddWithValue("@Description", Description.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@Phone", OrganizationName.Text);
        cmd.ExecuteNonQuery();

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