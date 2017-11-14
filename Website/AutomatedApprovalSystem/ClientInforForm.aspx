<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ClientInforForm.aspx.cs" Inherits="AutomatedApprovalSystem_ClientForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Client Information</h1>

    <%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


    <fieldset class="form-horizontal">
        <asp:Label runat="server" Text="Client ID:" AssociatedControlID="ClientID"></asp:Label>
        <asp:Label ID="clientID" runat="server"></asp:Label><br />

        <asp:Label runat="server" Text="Client Name:" AssociatedControlID="ClientName"></asp:Label>
        <asp:TextBox ID="ClientName" runat="server"></asp:TextBox><br />

        <asp:Label  runat="server" Text="Description:" AssociatedControlID="ClientDescription"></asp:Label>
        <asp:DropDownList ID="ClientDescription" runat="server"></asp:DropDownList><br />

        <asp:Label  runat="server" Text="Phone:" AssociatedControlID="ClientPhone"></asp:Label>
        <asp:TextBox ID="ClientPhone" runat="server"></asp:TextBox><br />

        <asp:Label  runat="server" Text="Email:" AssociatedControlID="ClientEmail"></asp:Label>
        <asp:TextBox ID="ClientEmail" runat="server"></asp:TextBox><br />

        <asp:Button CssClass="btn" ID="SaveForm" runat="server" Text="Save" />
        <asp:Button CssClass="btn" ID="ResetForm" runat="server" OnClick="ResetForm_Click" Text="Reset" />
        <asp:Button CssClass="btn" ID="CancelActivity" runat="server" Text="Cancel" />
        <asp:Button CssClass="btn" ID="AddClient" runat="server" Text="Add Client" OnClick="AddClient_Click" />
    </fieldset>
</asp:Content>

