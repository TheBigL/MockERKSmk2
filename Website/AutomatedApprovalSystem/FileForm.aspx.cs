using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additional Namespaces
using MockERKS.Framework.BLL;
using MockERKS.Framework.Entities;
//using iTextSharp.text;
//using iTextSharp.text.pdf;
using System.IO;
using System.Text;
using Microsoft.AspNet.Identity;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.tool.xml;

#endregion

public partial class WebPages_FileForm : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
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

                string userName = Context.User.Identity.GetUserName();
                int orgainztionId = sysmgr.OrganizationId_get(userName);

                newSiteFile.Organization_ID = orgainztionId;
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

                Operation newOperation = new Operation();
                
                if (sysmgr.checkExist(OperationName.Text) == false)
                {
                    newOperation.Operation_Name = OperationName.Text;
                    //if (int.TryParse(OperationID.Text, out i))
                    //    newSiteFile.Operation_ID = i;
                    //else
                    //    newSiteFile.Operation_ID = null;
                    sysmgr.createOperation(newOperation);
                }
                else
                {
                    newOperation = sysmgr.findOperation(OperationName.Text);
                    newSiteFile.Operation_ID = newOperation.Operation_ID;
                }
                //newSiteFile.Operation.Operation_Name = OperationName.Text;
                newSiteFile.Operation_ID = newOperation.Operation_ID;
                
                //Organization newOrganization = new Organization();
                //newOrganization = sysmgr.getOrganzationById(orgainztionId);
                Site_Address newAddress = new Site_Address();
                newAddress.Location = Location.SelectedValue;
                newAddress.Address = Address.Text;
                LLD_ATS newAts = new LLD_ATS();
                newAts.Meridian_Number = Meridian.SelectedValue;
                newAts.Range_Number = Range.SelectedValue;
                newAts.Township_Number = Township.SelectedValue;
                newAts.Section_Number = Section.SelectedValue;
                newAts.Quarter_Section_Number = QuarterSection.SelectedValue;
                newAts.LSD = LSD.SelectedValue;
                LLD_PBL newPbl = new LLD_PBL();
                newPbl.Plan_Number = Plan.Text;
                                        


                if (Block.Text.Trim().Equals(""))
                    newPbl.Block_Number = "<None>";
                else
                    newPbl.Block_Number = Block.Text;

                if (Lot.Text.Trim().Equals(""))
                    newPbl.Lot_Number = "<None>";
                else
                    newPbl.Lot_Number = Lot.Text;

                sysmgr.createLocation(newAddress);
                sysmgr.createLLd_ATS(newAts);
                sysmgr.createLLD_PBL(newPbl);

                if (LINC.Text.Trim().Equals(""))
                    newSiteFile.LINC_Number = "<None>";
                else
                    newSiteFile.LINC_Number = LINC.Text;

                newSiteFile.File_Status = FileStatus.SelectedValue;
                newSiteFile.Closed_Date = ClosedDate.SelectedDate;
                newSiteFile.PBL_ID = newPbl.PBL_ID;
                newSiteFile.Document_ID = 1;
                sysmgr.File_Add(newSiteFile,orgainztionId);
                sysmgr.file_update(newSiteFile.File_ID, orgainztionId);
                


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