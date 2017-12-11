<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PDFReport.aspx.cs" Inherits="AutomatedApprovalSystem_PDFReport" MasterPageFile="~/Site.master" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">


    <rsweb:ReportViewer ID="PDFReport" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="AutomatedApprovalSystem\PDFReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="PDFReportDS" Name="PDFDS" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="PDFReportDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="lookupPDFs" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>


    <asp:LinkButton ID="BacktoLookup" runat="server" Text="Back to Main Lookup" OnClick="BacktoLookup_Click"></asp:LinkButton>

</asp:Content>
