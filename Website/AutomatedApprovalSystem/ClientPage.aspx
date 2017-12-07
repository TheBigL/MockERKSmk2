<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ClientPage.aspx.cs" Inherits="AutomatedApprovalSystem_ClientPage" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <h2>Created File List</h2>
        <asp:Button ID="AddNew" runat="server" Text="Add New File" OnClick="AddNew_Click" />
        <asp:Label ID="or" runat="server">Or</asp:Label>
        <asp:Button ID="Upload" runat="server" Text="Upload PDF File" OnClick="Upload_Click" />
        <br />
        <br />

        <div class="row">
            <asp:GridView ID="CreatedFile" runat="server" AutoGenerateColumns="false" DataSourceID="CreatedFileData" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="fileID" HeaderText="fileID" SortExpression="fileID"></asp:BoundField>
                    <asp:BoundField DataField="organizationName" HeaderText="organizationName" SortExpression="organizationName"></asp:BoundField>
                    <asp:BoundField DataField="categoryName" HeaderText="categoryName" SortExpression="categoryName"></asp:BoundField>
                    <asp:BoundField DataField="operationName" HeaderText="operationName" SortExpression="operationName"></asp:BoundField>

                </Columns>
            </asp:GridView>

            <asp:LinkButton ID="ReportLink" runat="server" OnClick="ReportLink_Click" Text="See the Report"></asp:LinkButton>

            <asp:ObjectDataSource runat="server" ID="CreatedFileData" OldValuesParameterFormatString="original_{0}" TypeName="MockERKS.Framework.BLL.ClientController" SelectMethod="ListFilebyClient" OnSelecting="CreatedFileData_Selecting">
                <SelectParameters>
                    <asp:Parameter Name ="currUser_Name" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

