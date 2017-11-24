<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupFile.aspx.cs" Inherits="AutomatedApprovalSystem_LookupFile" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>File List
    </h2>

    <span><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
        <Columns>
            <asp:BoundField DataField="Officer_ID" HeaderText="Officer_ID" SortExpression="Officer_ID" />
            <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
            <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
        </Columns>
        </asp:GridView></span>


           



    



     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupOfficers" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>



     </asp:Content>
