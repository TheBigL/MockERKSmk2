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

    //class TempOrg
    //{
    //    public int Organization_ID { get; set; }
    //    public string Organization_Name { get; set; }
    //    public string Phone { get; set; }
    //    public string Email { get; set; }
    //}

    protected void AddFile_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            List<Organization> orgs;

            using (var context = new MockERKSDb())
            {
                orgs = (from org in context.Organizations
                       where org.User_Name.Trim().Equals(User.Identity.Name.Trim(), StringComparison.InvariantCultureIgnoreCase)
                       select org).ToList();
            }

            MessageUserControl.TryRun(() =>
            {
                FileController sysmgr = new FileController();
                Site_File newSiteFile = new Site_File();
                newSiteFile.Organization = orgs.FirstOrDefault();
                int i;


                if (int.TryParse(FileType.SelectedValue, out i))
                    newSiteFile.Type_ID = i;
                else
                    newSiteFile.Type_ID = null;

                if (int.TryParse(Category.SelectedValue, out i))
                    newSiteFile.Category_ID = i;
                else
                    newSiteFile.Category_ID = null;

                if (int.TryParse(SecurityClassification.SelectedValue, out i))
                    newSiteFile.Security_Classification_ID = i;
                else
                    newSiteFile.Security_Classification_ID = null;

                newSiteFile.Operation.Operation_Name = OperationName.Text;

                if (int.TryParse(OperationID.Text, out i))
                    newSiteFile.Operation_ID = i;
                else
                    newSiteFile.Operation_ID = null;

                newSiteFile.Organization.Site_Address.Location = Location.SelectedValue;
                newSiteFile.Organization.Site_Address.Address = Address.Text;
                newSiteFile.Organization.Site_Address.LLD_ATS.Meridian_Number = Meridian.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.Range_Number = Range.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.Township_Number = Township.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.Section_Number = Section.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.Quarter_Section_Number = QuarterSection.SelectedValue;
                newSiteFile.Organization.Site_Address.LLD_ATS.LSD = LSD.SelectedValue;

                newSiteFile.LLD_PBL.Plan_Number = Plan.Text;


                if (Block.Text.Trim().Equals(""))
                    newSiteFile.LLD_PBL.Block_Number = "<None>";
                else
                    newSiteFile.LLD_PBL.Block_Number = Block.Text;

                if (Lot.Text.Trim().Equals(""))
                    newSiteFile.LLD_PBL.Lot_Number = "<None>";
                else
                    newSiteFile.LLD_PBL.Lot_Number = Lot.Text;

                if (LINC.Text.Trim().Equals(""))
                    newSiteFile.LINC_Number = "<None>";
                else
                    newSiteFile.LINC_Number = LINC.Text;

                newSiteFile.File_Status = FileStatus.SelectedValue;
                newSiteFile.Closed_Date = ClosedDate.SelectedDate;

                sysmgr.File_Add(newSiteFile);
            }, "Add File", "File has been successfuly added to the database");
            
            Response.Redirect("ClientPage.aspx");
        }
    }

    protected void CancelActivity_Click(object sender, EventArgs e)
    {
        Response.Redirect("ClientPage.aspx");
    }

    protected void CheckBoxValidation(object sender, ServerValidateEventArgs e)
    {
        e.IsValid = Check.Checked;
    }
}