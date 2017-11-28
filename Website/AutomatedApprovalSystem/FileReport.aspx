<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FileReport.aspx.cs" Inherits="AutomatedApprovalSystem_FileReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
        <LocalReport ReportPath="AutomatedApprovalSystem\FileReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ODSFileReport" Name="FileReportDS" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ODSFileReport" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetFileReport" TypeName="MockERKS.Framework.BLL.ClientController"></asp:ObjectDataSource>
</asp:Content>

