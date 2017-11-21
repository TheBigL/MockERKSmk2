<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AutomatedApproval.aspx.cs" Inherits="AutomatedApprovalSystem_AutomatedApproval" MasterPageFile="~/Site.master" %>

<asp:content id="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>Approval Screen
    </h2>

    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="UserName" DataValueField="Officer_ID"></asp:DropDownList>



    <br />
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="RegisteredStaffDropdown" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>
    <br />



</asp:content>
