<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupFile.aspx.cs" Inherits="AutomatedApprovalSystem_LookupFile" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>File List
    </h2>

    <span><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
        <Columns>
            <asp:BoundField DataField="fileID" HeaderText="fileID" SortExpression="fileID" />
            <asp:BoundField DataField="categoryName" HeaderText="categoryName" SortExpression="categoryName" />
            <asp:BoundField DataField="docTypeDescription" HeaderText="docTypeDescription" SortExpression="docTypeDescription" />
            <asp:BoundField DataField="securityClassificationTypeName" HeaderText="securityClassificationTypeName" SortExpression="securityClassificationTypeName" />
            <asp:BoundField DataField="organizationName" HeaderText="organizationName" SortExpression="organizationName" />
            <asp:BoundField DataField="operationName" HeaderText="operationName" SortExpression="operationName" />
        </Columns>
        </asp:GridView></span>


           



    



     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFiles" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>



     </asp:Content>
