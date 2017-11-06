<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganizationForm.aspx.cs" Inherits="AutomatedApprovalSystem_OrganizationForm" MasterPageFile="~/Site.master" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

        <div class="row">
        <asp:Label AssociatedControlID="OrgID" Text="Organization ID" runat="server"></asp:Label>
        <asp:TextBox ID="OrgID" Enabled="false" runat="server"></asp:TextBox><br />

        <asp:Label AssociatedControlID="OrgName" Text="Organization Name" runat="server"></asp:Label>
        <asp:TextBox ID="OrgName" runat="server"></asp:TextBox><br />

        <asp:Label AssociatedControlID="OrgAddress" Text="Organization Address" runat="server"></asp:Label>
        <asp:TextBox ID="OrgAddress" runat="server"></asp:TextBox><br />

        <asp:Label AssociatedControlID="OrgPhone" runat="server" Text="Phone"></asp:Label>
        <asp:TextBox ID="OrgPhone" runat="server"></asp:TextBox><br />

        <asp:Label AssociatedControlID="OrgEmail" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="OrgEmail" runat="server"></asp:TextBox><br />


        <asp:Button ID="Register" runat="server" Text="Register" />

        




    </div>

</asp:Content>
