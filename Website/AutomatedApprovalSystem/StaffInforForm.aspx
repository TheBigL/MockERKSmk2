<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StaffInforForm.aspx.cs" Inherits="AutomatedApprovalSystem_StaffForm" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Staff Information</h1>

    <fieldset class="form-horizontal">
        <asp:Label ID="Label" runat="server" Text="Staff ID:" AssociatedControlID="StaffID"></asp:Label>
        <asp:Label ID="StaffID" runat="server"></asp:Label><br />

        <asp:Label ID="Label1" runat="server" Text="Staff Name:" AssociatedControlID="StaffName"></asp:Label>
        <asp:TextBox ID="StaffName" runat="server"></asp:TextBox><br />

        <asp:Label ID="Label3" runat="server" Text="Phone:" AssociatedControlID="StaffPhone"></asp:Label>
        <asp:TextBox ID="StaffPhone" runat="server"></asp:TextBox><br />

        <asp:Label ID="Label4" runat="server" Text="Email:" AssociatedControlID="StaffEmail"></asp:Label>
        <asp:TextBox ID="StaffEmail" runat="server"></asp:TextBox><br />

        <asp:Button CssClass="btn" ID="SaveForm" runat="server" Text="Save" />
        <asp:Button CssClass="btn" ID="ResetForm" runat="server" OnClick="ResetForm_Click" Text="Reset" />
        <asp:Button CssClass="btn" ID="CancelActivity" runat="server" Text="Cancel" />
        <asp:Button CssClass="btn" ID="AddStaff" runat="server" Text="Add Staff Member" />
    </fieldset>
</asp:Content>

