<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ClientPage.aspx.cs" Inherits="AutomatedApprovalSystem_ClientPage" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <h2>Created File List</h2>
        <asp:Button ID="AddNew" runat="server" Text="Add New File" />
        <div class="row">
            <asp:GridView ID="CreatedFile" runat="server" AutoGenerateColumns="false"></asp:GridView>
        </div>
    </div>
</asp:Content>

