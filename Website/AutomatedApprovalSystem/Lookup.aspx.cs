using MockERKS.Framework.BLL;
using MockERKS.Framework.Entities;
using MockERKS.Framework.Entities.POCOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using System.IO;
using iTextSharp.tool.xml;

public partial class AutomatedApprovalSystem_LookupFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DataBind();
        }

        if(!Request.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }

        else if(User.IsInRole("Client"))
        {
            Response.Redirect("~/Default.aspx");
        }

    }



    protected void ReportLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/FileReport");
    }

    protected void ToOfficerReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/StaffReport");
    }

    protected void OrganizationLinkReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/OrganizationReport");
    }

    protected void ManagerReportLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/ManagerReport");
    }

    protected void ExportPDF(GridView gv, iTextSharp.text.Document newDoc)
    {
        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=LookupPDF.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);



                gv.AllowPaging = false;
                gv.DataBind();


                StringReader sr = new StringReader(sw.ToString());

                PdfWriter writer = PdfWriter.GetInstance(newDoc, Response.OutputStream);
                newDoc.Open();
                XMLWorkerHelper.GetInstance().ParseXHtml(writer, newDoc, sr);
                gv.RenderControl(hw);
                Response.Write(newDoc);
                newDoc.Close();



                Response.Close();


            }
        }

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        

    }




    protected void PDFOrganization_Click(object sender, EventArgs e)
    {
        iTextSharp.text.Document orgListDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 10f);
        orgListDoc.AddTitle("List of Registered Oranizations");
        orgListDoc.AddAuthor("Leban Mohamed");
        orgListDoc.AddLanguage("English");
        ExportPDF(OrganizationGrid, orgListDoc);
        
    }

    protected void PDFFileReportLink_Click(object sender, EventArgs e)
    {

    }

    protected void OfficerPDF_Click(object sender, EventArgs e)
    {

    }

    protected void ManagerPDF_Click(object sender, EventArgs e)
    {

    }
}

