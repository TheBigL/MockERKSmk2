using MockERKS.Framework.DAL;
using MockERKS.Framework.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutomatedApprovalSystem_Staff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            using (var context = new MockERKSDb())
            {
                if(context.Officers.Count() < 1)
                {
                    
                }
            }
        }

        

        
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        
    }

    protected void InsertButton_Click(object sender, EventArgs e)
    {

    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        
    }
}