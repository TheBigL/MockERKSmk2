<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupFile.aspx.cs" Inherits="AutomatedApprovalSystem_LookupFile" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>File List</h2>
    <p>
        
        
        
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource2" DataTextField="categoryName" DataValueField="categoryID">
        </asp:DropDownList>
        
        
        
    </p>

           



    



     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="DropdownCategories" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>



     </asp:Content>
