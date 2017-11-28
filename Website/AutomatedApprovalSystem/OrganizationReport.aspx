<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganizationReport.aspx.cs" Inherits="AutomatedApprovalSystem_OrganizationReport" MasterPageFile="~/Site.master" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">

    <div class="row">




    <asp:ObjectDataSource ID="ODSOrganizationReport" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupRegisteredOrganizations" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>
        
        <rsweb:ReportViewer ID="OrganizationReport" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="AutomatedApprovalSystem\Organization.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ODSOrganizationReport" Name="GeneralOrganizationDS" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        
    </div>




</asp:Content>
