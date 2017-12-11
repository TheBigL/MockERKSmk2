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
                gv.RenderControl(hw);
                gv.AllowPaging = false;
                gv.DataBind();


                StringReader sr = new StringReader(sw.ToString());

                HTMLWorker htmlParse = new HTMLWorker(newDoc);
                PdfWriter writer = PdfWriter.GetInstance(newDoc, Response.OutputStream);
                newDoc.Open();
                htmlParse.Parse(sr);
                
                Response.Write(newDoc);
                newDoc.Close();



                Response.End();
                gv.AllowPaging = true;


            }
        }

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        

    }




    protected void PDFOrganization_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=LookupOrganization.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        iTextSharp.text.Document orgListDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 10f);
        orgListDoc.AddTitle("List of Registered Oranizations");
        orgListDoc.AddAuthor("Leban Mohamed");
        orgListDoc.AddLanguage("English");
        ExportPDF(OrganizationGrid, orgListDoc);
        
    }

    protected void PDFFileReportLink_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=LookupFiles.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        iTextSharp.text.Document fileListDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 10f);
        fileListDoc.AddTitle("List of Files");
        fileListDoc.AddAuthor("Leban Mohamed");
        fileListDoc.AddLanguage("English");
        ExportPDF(FileGrid, fileListDoc);


    }

    protected void OfficerPDF_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=LookupOfficers.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        iTextSharp.text.Document officerListDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 10f);
        officerListDoc.AddTitle("List of Officers");
        officerListDoc.AddAuthor("Leban Mohamed");
        officerListDoc.AddLanguage("English");
        ExportPDF(StaffGrid, officerListDoc);
    }

    protected void ManagerPDF_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=LookupManagers.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        iTextSharp.text.Document managerListDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 10f);
        managerListDoc.AddTitle("List of Managers");
        managerListDoc.AddAuthor("Leban Mohamed");
        managerListDoc.AddLanguage("English");
        ExportPDF(ManagerGrid, managerListDoc);
    }

    protected void LinktoPDFReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AutomatedApprovalSystem/PDFReport");
    }
}

