<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupByID.aspx.cs" Inherits="AutomatedApprovalSystem_LookupByID" MasterPageFile="~/Site.master" %>

<asp:content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <div id="row">
        <h2>
            Look up By ID</h2>

        <ul class="nav nav-tabs">
            <li ><a href="#Organizations" data-toggle="tab">Organizations</a></li>
            <li ><a href="#RecordDetails" data-toggle="tab">Files</a></li>
            <li ><a href="#Officers" data-toggle="tab">Officers</a></li>
        </ul>


        <div id="Organizations" class="tab-pane fade">

        </div>

        <div id="RecordDetails" class="tab-pane fade">



        </div>

        <div id="Officers" class="tab-pane fade">

            <asp:DropDownList ID="OfficersDropdown" runat="server" DataSourceID="OfficerDropdownDS" DataTextField="fullName" DataValueField="officerID">
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

            <asp:Button ID="OfficerDropdownReset" runat="server" Text="Reset Dropdown"/>

        </div>



    </div>
</asp:content>
