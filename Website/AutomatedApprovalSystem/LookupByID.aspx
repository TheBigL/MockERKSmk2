<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupByID.aspx.cs" Inherits="AutomatedApprovalSystem_LookupByID" MasterPageFile="~/Site.master" %>

<asp:content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <div id="row">
        <h2>
            Look up By ID</h2>

        <ul class="nav nav-tabs">
            <li ><a href="#Organizations" data-toggle="tab">Organizations</a></li>
            <li ><a href="#Officers" data-toggle="tab">Officers</a></li>
        </ul>


        <div id="Organizations" class="tab-pane fade">
            <asp:DropDownList ID="OrganizationDropdown" runat="server" DataSourceID="OrganizationDropdownDS" DataTextField="organizationName" DataValueField="organizationID"></asp:DropDownList>

            <asp:GridView ID="FileByOrganizationGridView" runat="server" AutoGenerateColumns="False" DataSourceID="FileByOrganizationIDDS">
                <Columns>
                    <asp:BoundField DataField="fileID" HeaderText="fileID" SortExpression="fileID" />
                    <asp:BoundField DataField="categoryName" HeaderText="categoryName" SortExpression="categoryName" />
                    <asp:BoundField DataField="docTypeDescription" HeaderText="docTypeDescription" SortExpression="docTypeDescription" />
                    <asp:BoundField DataField="securityClassificationTypeName" HeaderText="securityClassificationTypeName" SortExpression="securityClassificationTypeName" />
                    <asp:BoundField DataField="organizationName" HeaderText="organizationName" SortExpression="organizationName" />
                    <asp:BoundField DataField="operationName" HeaderText="operationName" SortExpression="operationName" />
                </Columns>
            </asp:GridView>

        </div>


        <div id="Officers" class="tab-pane fade">

            <asp:DropDownList ID="OfficersDropdown" runat="server" DataSourceID="OfficerDropdownDS" DataTextField="fullName" DataValueField="officerID" OnSelectedIndexChanged="OfficersDropdown_SelectedIndexChanged">
            </asp:DropDownList>

            <asp:gridview ID="RecordDetailsByEmployeeDS" runat="server" AutoGenerateColumns="False" DataSourceID="RecordDetailGridViewDS">
                <Columns>
                    <asp:BoundField DataField="officerID" HeaderText="officerID" SortExpression="officerID" />
                    <asp:BoundField DataField="managerID" HeaderText="managerID" SortExpression="managerID" />
                    <asp:BoundField DataField="managerGroupID" HeaderText="managerGroupID" SortExpression="managerGroupID" />
                    <asp:BoundField DataField="fileID" HeaderText="fileID" SortExpression="fileID" />
                    <asp:BoundField DataField="recordDate" HeaderText="recordDate" SortExpression="recordDate" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    <asp:BoundField DataField="statusDate" HeaderText="statusDate" SortExpression="statusDate" />
                    <asp:BoundField DataField="dateRecieved" HeaderText="dateRecieved" SortExpression="dateRecieved" />
                    <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                    <asp:BoundField DataField="updateCyclePeroid" HeaderText="updateCyclePeroid" SortExpression="updateCyclePeroid" />
                    <asp:BoundField DataField="essential" HeaderText="essential" SortExpression="essential" />
                    <asp:BoundField DataField="offical" HeaderText="offical" SortExpression="offical" />
                </Columns>
            </asp:gridview>



            <asp:ObjectDataSource ID="RecordDetailGridViewDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="RDSummaryByOfficerID" TypeName="MockERKS.Framework.BLL.StaffController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="OfficersDropdown" Name="officerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="OfficerDropdownDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="RegisteredStaffDropdown" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

            <asp:ObjectDataSource ID="FileByOrganizationIDDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFileSummaryByOrganizationID" TypeName="MockERKS.Framework.BLL.StaffController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="OrganizationDropdown" Name="orgID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="OrganizationDropdownDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="organizationDropdown" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

            <asp:Button ID="OfficerDropdownReset" runat="server" Text="Reset Dropdown" OnClick="OfficerDropdownReset_Click"/>

        </div>



    </div>
</asp:content>
