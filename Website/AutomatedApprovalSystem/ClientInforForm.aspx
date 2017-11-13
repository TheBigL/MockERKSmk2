<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ClientInforForm.aspx.cs" Inherits="AutomatedApprovalSystem_ClientForm" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Client Information</h1>

    <fieldset class="form-horizontal">
        <asp:Label ID="Label" runat="server" Text="Client ID:" AssociatedControlID="ClientID"></asp:Label>
        <asp:Label ID="ClientID" runat="server"></asp:Label><br />

        <asp:Label ID="Label1" runat="server" Text="Client Name:" AssociatedControlID="ClientName"></asp:Label>
        <asp:TextBox ID="ClientName" runat="server"></asp:TextBox><br />

        <asp:Label ID="Label2" runat="server" Text="Description:" AssociatedControlID="ClientDescription"></asp:Label>
        <asp:DropDownList ID="ClientDescription" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label3" runat="server" Text="Phone:" AssociatedControlID="ClientPhone"></asp:Label>
        <asp:TextBox ID="ClientPhone" runat="server"></asp:TextBox><br />

        <asp:Label ID="Label4" runat="server" Text="Email:" AssociatedControlID="ClientEmail"></asp:Label>
        <asp:TextBox ID="ClientEmail" runat="server"></asp:TextBox><br />

        <asp:Button CssClass="btn" ID="SaveForm" runat="server" Text="Save" />
        <asp:Button CssClass="btn" ID="ResetForm" runat="server" OnClick="ResetForm_Click" Text="Reset" />
        <asp:Button CssClass="btn" ID="CancleActivity" runat="server" Text="Cancle" />
    </fieldset>
</asp:Content>

