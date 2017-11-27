﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MockERKS.Framework.Entities.Security;

public partial class Admin_Security_UserRoleAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
   {

    }
    protected void CheckForException(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MessageUserControl.HandleDataBoundException(e);
   }
    protected void RefreshAll(object sender, EventArgs e)
    {
        DataBind();
    }

    protected void UserListView_ItemInserting(object sender, ListViewInsertEventArgs e)
   {        //collect roles the user will be assigned to
        var addtoroles = new List<string>();

       var roles = e.Item.FindControl("RoleMemberships") as CheckBoxList;
      
       if (roles != null)
        {
            
            foreach (ListItem item in roles.Items)
           {
               if (item.Selected)
                {
                   addtoroles.Add(item.Value);
               }
           }
           e.Values["RoleMemberships"] = addtoroles;
        }
    }
}