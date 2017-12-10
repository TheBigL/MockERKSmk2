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
                gv.AllowPaging = false;
                gv.DataBind();

                gv.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());
                
                PdfWriter writer = PdfWriter.GetInstance(newDoc, Response.OutputStream);
                newDoc.Open();
                XMLWorkerHelper.GetInstance().ParseXHtml(writer, newDoc, sr);
                newDoc.Close();


                Response.Write(newDoc);
                Response.Close();


            }
        }

    }



    protected void PDFOrganization_Click(object sender, EventArgs e)
    {

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

