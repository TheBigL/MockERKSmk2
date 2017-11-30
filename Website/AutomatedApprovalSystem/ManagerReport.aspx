<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerReport.aspx.cs" Inherits="AutomatedApprovalSystem_ManagerReport" MasterPageFile="~/Site.master" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">



    <rsweb:ReportViewer ID="ManagerReport" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="AutomatedApprovalSystem\ManagerReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ManagerDS" Name="ManagerDS" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ManagerDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupManager" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>



</asp:Content>
