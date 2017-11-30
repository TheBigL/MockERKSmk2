<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lookup.aspx.cs" Inherits="AutomatedApprovalSystem_LookupFile" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>Look up Organization & File</h2>

    <div class="row">
    <ul class="nav nav-tabs">
                <li class="active"><a href="#organization" data-toggle="tab">Organizations</a></li>
                <li ><a href="#filelookup" data-toggle="tab">Files</a></li>
                <li><a href="#staff" data-toggle="tab">Officers</a></li>
                <li><a href="#managers" data-toggle="tab">Managers</a></li>
                
                
    </ul>

    <div id="organization" class="tab-pane fade in active" role="tabpanel">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="OrganizationData" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="Organization_Name" HeaderText="Organization_Name" SortExpression="Organization_Name" />
            <asp:BoundField DataField="Organization_Description" HeaderText="Organization_Description" SortExpression="Organization_Description" />
            <asp:BoundField DataField="Organization_ID" HeaderText="Organization_ID" SortExpression="Organization_ID" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
        </asp:GridView>
        <asp:LinkButton ID="OrganizationLinkReport" runat="server" OnClick="OrganizationLinkReport_Click"></asp:LinkButton>

    </div>

           



    


        <div id="filelookup" class="tab-pane fade" role="tabpanel">
           
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="FilesDataSource">
            <Columns>
                <asp:BoundField DataField="fileID" HeaderText="fileID" SortExpression="fileID" />
                <asp:BoundField DataField="categoryName" HeaderText="categoryName" SortExpression="categoryName" />
                <asp:BoundField DataField="docTypeDescription" HeaderText="docTypeDescription" SortExpression="docTypeDescription" />
                <asp:BoundField DataField="securityClassificationTypeName" HeaderText="securityClassificationTypeName" SortExpression="securityClassificationTypeName" />
                <asp:BoundField DataField="organizationName" HeaderText="organizationName" SortExpression="organizationName" />
                <asp:BoundField DataField="operationName" HeaderText="operationName" SortExpression="operationName" />
            </Columns>

        </asp:GridView>

            <asp:LinkButton ID="ReportLink" runat="server" OnClick="ReportLink_Click">To the File Report</asp:LinkButton>

            </div>
           

        <div id="staff" class="tab-pane fade">




            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="OfficerDataSource">
                <Columns>
                    <asp:BoundField DataField="Officer_ID" HeaderText="Officer_ID" SortExpression="Officer_ID" />
                    <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
                    <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
            </asp:GridView>

            <asp:LinkButton ID="ToOfficerReport" runat="server" OnClick="ToOfficerReport_Click">To Officer Report Page</asp:LinkButton>




        </div>

        <div id="managers" class="tab-pane fade">


            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ManagerDataSource">
                <Columns>
                    <asp:BoundField DataField="managerID" HeaderText="managerID" SortExpression="managerID" />
                    <asp:BoundField DataField="fullName" HeaderText="fullName" SortExpression="fullName" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                </Columns>
            </asp:GridView>

            <asp:LinkButton ID="ManagerReportLink" runat="server" OnClick="ManagerReportLink_Click">To Manager Report Page</asp:LinkButton>
        </div>



     <asp:ObjectDataSource ID="OrganizationData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupRegisteredOrganizations" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="FilesDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFiles" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="OfficerDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupOfficers" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ManagerDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupManager" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

    </div>

     </asp:Content>
