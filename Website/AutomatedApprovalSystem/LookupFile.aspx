<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupFile.aspx.cs" Inherits="AutomatedApprovalSystem_LookupFile" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>File List
    </h2>

    <div>
    <ul class="nav nav-tabs">
                <li class="active"><a href="#FileLookUp" data-toggle="tab">File Look Up</a></li>
                <li ><a href="#organization" data-toggle="tab">Organizations</a></li>
                
    </ul>

    <span><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Organization_Name" HeaderText="Organization_Name" SortExpression="Organization_Name" />
            <asp:BoundField DataField="Organization_Description" HeaderText="Organization_Description" SortExpression="Organization_Description" />
            <asp:BoundField DataField="Organization_ID" HeaderText="Organization_ID" SortExpression="Organization_ID" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
        </asp:GridView></span>


           



    



     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupRegisteredOrganizations" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

    </div>

     </asp:Content>
