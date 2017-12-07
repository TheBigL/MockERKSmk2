using System;
using MockERKS.Framework.BLL;
using Microsoft.AspNet.Identity;
using MockERKS.Framework.Entities.Security;
using MockERKS.Framework.Entities;
using MockERKS.Framework.Entities.POCOs;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin_File_Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SelectedTitle.Text = "";

        if (!IsPostBack)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else
            {
                if (!User.IsInRole(SecurityRoles.WebAdmins))
                {
                    Response.Redirect("~/Account/Login.aspx");
                }


            }
        }


    }



    protected void Search_Click(object sender, EventArgs e)
    {
        MessageUserControl1.TryRun(() =>
        {
            AdminController sysmgr = new AdminController();
            List<Site_File> fileList = sysmgr.siteFile_Get();
            if (fileList.Count == 0)
            {
                //(title string, message string)
                MessageUserControl1.ShowInfo("Search Result",
                    "No data for File could be retrieved ");
                FileList.DataSource = null;
                FileList.DataBind();
            }
            else
            {
                MessageUserControl1.ShowInfo("Search Result",
                   "Select the desired File for maintenance.");
                FileList.DataSource = fileList;
                FileList.DataBind();
            }
            

        });
    }


    protected void FileList_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow agvrow = FileList.Rows[FileList.SelectedIndex];
        string fileid = (agvrow.FindControl("FileID") as Label).Text;
        string typeid = (agvrow.FindControl("TypeID") as Label).Text;
        string organizationid = (agvrow.FindControl("OrganizationID") as Label).Text;
        string lincNumber = (agvrow.FindControl("LINCNumber") as Label).Text;
        string securityClassification = (agvrow.FindControl("SecurityClassificationID") as Label).Text;
        string operationid = (agvrow.FindControl("OperationID") as Label).Text;
        string fileStatus = (agvrow.FindControl("FileStatus") as Label).Text;
        string closedDate = (agvrow.FindControl("closedDate") as Label).Text;

        SelectedTitle.Text =  fileid + organizationid + fileStatus;

        mFileID.Text = fileid;
        mTypeID.SelectedValue = typeid;
        mOrganizationID.Text = organizationid;
        mLINCNumber.Text = lincNumber;
        mSecurityID.Text = securityClassification;
        mOperationID.Text = operationid;
        mFileStatus.Text = fileStatus;
        mClosedDate.Text = closedDate;

    }



    protected void AddFile_Click(object sender, EventArgs e)
    {

    }

    protected void UpdateFile_Click(object sender, EventArgs e)
    {

    }
    protected void DeleteFile_Click(object sender, EventArgs e)
    {

    }

    protected void Clear_Click(object sender, EventArgs e)
    {
       
    }

    protected void CheckForException(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MessageUserControl.HandleDataBoundException(e);
    }
}