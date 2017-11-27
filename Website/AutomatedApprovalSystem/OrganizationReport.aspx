<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganizationReport.aspx.cs" Inherits="AutomatedApprovalSystem_OrganizationReport" MasterPageFile="~/Site.master" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">

    <div class="row">




    <asp:ObjectDataSource ID="ODSOrganizationReport" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupRegisteredOrganizations" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>
        
    </div>




</asp:Content>
