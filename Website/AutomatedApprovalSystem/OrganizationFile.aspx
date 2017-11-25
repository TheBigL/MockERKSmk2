<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganizationFile.aspx.cs" Inherits="AutomatedApprovalSystem_OrganizationFile" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">

    <h1>Files by Organization</h1>

    <asp:DropDownList ID="OrganizationDropdown" runat="server" DataSourceID="OrganizationDataSource" DataTextField="organizationName" DataValueField="organizationID" OnSelectedIndexChanged="OrganizationDropdown_SelectedIndexChanged"></asp:DropDownList>
    

    <asp:GridView ID="FileByOrganization" runat="server">
    </asp:GridView>
    

    <asp:ObjectDataSource ID="OrganizationDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="organizationDropdown" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFileByOrganization" TypeName="MockERKS.Framework.BLL.StaffController">
        <SelectParameters>
            <asp:ControlParameter ControlID="OrganizationDropdown" DefaultValue="0" Name="orgID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
