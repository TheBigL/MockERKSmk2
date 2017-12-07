<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FileReport.aspx.cs" Inherits="AutomatedApprovalSystem_FileReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <br />
    <br />
    <%--<button type="button" class="btn" id="cancel" onclick="window.history.back()">Back</button>--%>
    <asp:Button CssClass="btn" ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
    <br />
    <br />

    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" Height="800px">
        <LocalReport ReportPath="AutomatedApprovalSystem\FileReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ODSFileReport" Name="FileReportDS" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ODSFileReport" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetFileReport" TypeName="MockERKS.Framework.BLL.ClientController" OnSelecting="ODSFileReport_Selecting">
        <SelectParameters>
            <asp:Parameter Name ="currUser_Name" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:LinkButton ID="BacktoLookup" runat="server" Text="Back to the main lookup page" OnClick="BacktoLookup_Click"></asp:LinkButton>
</asp:Content>

