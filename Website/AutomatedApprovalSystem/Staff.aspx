<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="AutomatedApprovalSystem_Staff" MasterPageFile="~/Site.master" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <div class="row">
        <h2>Staff List</h2>
        <div class="row">



        
            <asp:ObjectDataSource ID="StaffData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupStaff" TypeName="MockERKS.Framework.BLL.StaffController" DeleteMethod="Delete_Staff" InsertMethod="Insert_Staff">
                <DeleteParameters>
                    <asp:Parameter Name="staffID" Type="Int32" />
                    <asp:Parameter Name="rdetails" Type="Object" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="phone" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>



        
        
        </div>
    </div>

</asp:content>
