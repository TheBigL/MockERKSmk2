<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupFile.aspx.cs" Inherits="AutomatedApprovalSystem_LookupFile" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>Look up Organization & File</h2>

    <div>
    <ul class="nav nav-tabs">
                <li class="active"><a href="#organization" data-toggle="tab">Organizations</a></li>
                <li ><a href="#filelookup" data-toggle="tab">File Look Up</a></li>
                
                
    </ul>

    <div id="organization" class="tab-pane fade in active" role="tabpanel">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="OrganizationData" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Organization_Name" HeaderText="Organization_Name" SortExpression="Organization_Name" />
            <asp:BoundField DataField="Organization_Description" HeaderText="Organization_Description" SortExpression="Organization_Description" />
            <asp:BoundField DataField="Organization_ID" HeaderText="Organization_ID" SortExpression="Organization_ID" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
        </asp:GridView>
    </div>

           



    


        <div id="filelookup" class="tab-pane fade" role="tabpanel">
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="FilesDataSource">
            <Columns>
                <asp:CommandField ShowSelectButton="true" />
                <asp:BoundField DataField="fileID" HeaderText="fileID" SortExpression="fileID" />
                <asp:BoundField DataField="categoryName" HeaderText="categoryName" SortExpression="categoryName" />
                <asp:BoundField DataField="docTypeDescription" HeaderText="docTypeDescription" SortExpression="docTypeDescription" />
                <asp:BoundField DataField="securityClassificationTypeName" HeaderText="securityClassificationTypeName" SortExpression="securityClassificationTypeName" />
                <asp:BoundField DataField="organizationName" HeaderText="organizationName" SortExpression="organizationName" />
                <asp:BoundField DataField="operationName" HeaderText="operationName" SortExpression="operationName" />
            </Columns>
        </asp:GridView>
            </div>

           



    



     <asp:ObjectDataSource ID="OrganizationData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupRegisteredOrganizations" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="FilesDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFiles" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

    </div>

     </asp:Content>
