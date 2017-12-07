<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StaffReport.aspx.cs" Inherits="AutomatedApprovalSystem_Default" MasterPageFile="~/Site.master" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    

    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="AutomatedApprovalSystem\OfficerReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="OfficerDS" Name="OfficerDS" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="OfficerDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupOfficers" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

    <asp:LinkButton ID="BackToLookup" runat="server" Text="Back to the Main Lookup" OnClick="BackToLookup_Click"></asp:LinkButton>

</asp:Content>
