using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additional Namespaces
using MockERKS.Framework.BLL;
using MockERKS.Framework.Entities;
using MockERKS.UI;
#endregion

public partial class WebPages_FileForm : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            //if (User.IsInRole("Client"))
            //{
            //    Update.Visible = false;
            //}
        }

        //Redirects the user if the user is not authenticated.
        if (!Request.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
    }

    protected void ResetForm_Click(object sender, EventArgs e)
    {
        FileType.SelectedIndex = 0;
        Category.SelectedIndex = 0;
        SecurityClassification.SelectedIndex = 0;
        FileID.Text = "";
        OperationName.Text = "";
        OperationID.Text = "";
        Location.SelectedIndex = 0;
        Address.Text = "";
        Meridian.SelectedIndex = 0;
        Range.SelectedIndex = 0;
        Township.SelectedIndex = 0;
        Section.SelectedIndex = 0;
        QuarterSection.SelectedIndex = 0;
        LSD.SelectedIndex = 0;
        Plan.Text = "";
        Block.Text = "";
        Lot.Text = "";
        LINC.Text = "";
        FileStatus.SelectedIndex = 0;
        ClosedDate.SelectedDates.Clear();
    }

    protected void AddFile_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            MessageUserControl.TryRun(() =>
            {
                FileController sysmgr = new FileController();
                Site_File newSiteFile = new Site_File();
                newSiteFile.Type_ID = int.Parse(FileType.SelectedValue);
                newSiteFile.Category_ID = int.Parse(Category.SelectedValue);
                newSiteFile.Security_Classification_ID = int.Parse(SecurityClassification.SelectedValue);
                newSiteFile.Operation.Operation_Name = OperationName.Text;
                newSiteFile.Organization.Site_Address.Location = Location.SelectedValue;
                newSiteFile.Organization.Site_Address.Address = Address.Text;
                newSiteFile.Organization.Site_Address.LLD_ATS.Meridian_Number = Meridian.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.Range_Number = Range.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.Township_Number = Township.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.Section_Number = Section.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.Quarter_Section_Number = QuarterSection.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.LSD = LSD.SelectedValue;
                newSiteFile.LLD_PBL.Plan_Number = Plan.Text;
                newSiteFile.LLD_PBL.Block_Number = Block.Text;
                newSiteFile.LLD_PBL.Lot_Number = Lot.Text;
                newSiteFile.File_Status = FileStatus.SelectedValue;
                newSiteFile.Closed_Date = ClosedDate.SelectedDate;

                sysmgr.File_Add(newSiteFile);
            }, "Add File", "File has been successfuly added to the database");

        }
    }

    //protected void CancelActivity_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("ClientPage.aspx");
    //}
}