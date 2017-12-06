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

        <br />

        <br />
        <asp:ListView ID="OrganizationList" runat="server" DataSourceID="OrganizationData" OnItemEditing="OrganizationList_ItemEditing">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="Organization_NameLabel" runat="server" Text='<%# Eval("Organization_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Organization_DescriptionLabel" runat="server" Text='<%# Eval("Organization_Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Organization_IDLabel" runat="server" Text='<%# Eval("Organization_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="Organization_NameTextBox" runat="server" Text='<%# Bind("Organization_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Organization_DescriptionTextBox" runat="server" Text='<%# Bind("Organization_Description") %>'/>
                        
                    </td>
                    <td>
                        <asp:TextBox ID="Organization_IDTextBox" runat="server" Text='<%# Bind("Organization_ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="Organization_NameTextBox" runat="server" Text='<%# Bind("Organization_Name") %>' />
                    </td>
                    <td>
                        <asp:Textbox ID="Organization_DescriptionTextBox" runat="server" Text='<%# Bind("Organization_Description") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Organization_IDTextBox" runat="server" Text='<%# Bind("Organization_ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="Organization_NameLabel" runat="server" Text='<%# Eval("Organization_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Organization_DescriptionLabel" runat="server" Text='<%# Eval("Organization_Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Organization_IDLabel" runat="server" Text='<%# Eval("Organization_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">Organization_Name</th>
                                    <th runat="server">Organization_Description</th>
                                    <th runat="server">Organization_ID</th>
                                    <th runat="server">Phone</th>
                                    <th runat="server">Email</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="Organization_NameLabel" runat="server" Text='<%# Eval("Organization_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Organization_DescriptionLabel" runat="server" Text='<%# Eval("Organization_Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Organization_IDLabel" runat="server" Text='<%# Eval("Organization_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />

        <asp:LinkButton ID="OrganizationLinkReport" runat="server" OnClick="OrganizationLinkReport_Click"></asp:LinkButton>

    </div>

           



    


        <div id="filelookup" class="tab-pane fade" role="tabpanel">

            <asp:ListView ID="FileList" runat="server" DataSourceID="FilesDataSource">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="fileIDLabel" runat="server" Text='<%# Eval("fileID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="categoryNameLabel" runat="server" Text='<%# Eval("categoryName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="docTypeDescriptionLabel" runat="server" Text='<%# Eval("docTypeDescription") %>' />
                        </td>
                        <td>
                            <asp:Label ID="securityClassificationTypeNameLabel" runat="server" Text='<%# Eval("securityClassificationTypeName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="organizationNameLabel" runat="server" Text='<%# Eval("organizationName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="operationNameLabel" runat="server" Text='<%# Eval("operationName") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="fileIDTextBox" runat="server" Text='<%# Bind("fileID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="categoryNameTextBox" runat="server" Text='<%# Bind("categoryName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="docTypeDescriptionTextBox" runat="server" Text='<%# Bind("docTypeDescription") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="securityClassificationTypeNameTextBox" runat="server" Text='<%# Bind("securityClassificationTypeName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="organizationNameTextBox" runat="server" Text='<%# Bind("organizationName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="operationNameTextBox" runat="server" Text='<%# Bind("operationName") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="fileIDTextBox" runat="server" Text='<%# Bind("fileID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="categoryNameTextBox" runat="server" Text='<%# Bind("categoryName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="docTypeDescriptionTextBox" runat="server" Text='<%# Bind("docTypeDescription") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="securityClassificationTypeNameTextBox" runat="server" Text='<%# Bind("securityClassificationTypeName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="organizationNameTextBox" runat="server" Text='<%# Bind("organizationName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="operationNameTextBox" runat="server" Text='<%# Bind("operationName") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="fileIDLabel" runat="server" Text='<%# Eval("fileID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="categoryNameLabel" runat="server" Text='<%# Eval("categoryName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="docTypeDescriptionLabel" runat="server" Text='<%# Eval("docTypeDescription") %>' />
                        </td>
                        <td>
                            <asp:Label ID="securityClassificationTypeNameLabel" runat="server" Text='<%# Eval("securityClassificationTypeName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="organizationNameLabel" runat="server" Text='<%# Eval("organizationName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="operationNameLabel" runat="server" Text='<%# Eval("operationName") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">fileID</th>
                                        <th runat="server">categoryName</th>
                                        <th runat="server">docTypeDescription</th>
                                        <th runat="server">securityClassificationTypeName</th>
                                        <th runat="server">organizationName</th>
                                        <th runat="server">operationName</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="fileIDLabel" runat="server" Text='<%# Eval("fileID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="categoryNameLabel" runat="server" Text='<%# Eval("categoryName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="docTypeDescriptionLabel" runat="server" Text='<%# Eval("docTypeDescription") %>' />
                        </td>
                        <td>
                            <asp:Label ID="securityClassificationTypeNameLabel" runat="server" Text='<%# Eval("securityClassificationTypeName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="organizationNameLabel" runat="server" Text='<%# Eval("organizationName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="operationNameLabel" runat="server" Text='<%# Eval("operationName") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
        </asp:ListView>
           
            <asp:LinkButton ID="ReportLink" runat="server" OnClick="ReportLink_Click">To the File Report</asp:LinkButton>

            </div>
           

        <div id="staff" class="tab-pane fade">

            <asp:ListView ID="StaffList" runat="server" DataSourceID="OfficerDataSource">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="Officer_IDLabel" runat="server" Text='<%# Eval("Officer_ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="Officer_IDTextBox" runat="server" Text='<%# Bind("Officer_ID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="First_NameTextBox" runat="server" Text='<%# Bind("First_Name") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("Last_Name") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="Officer_IDTextBox" runat="server" Text='<%# Bind("Officer_ID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="First_NameTextBox" runat="server" Text='<%# Bind("First_Name") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("Last_Name") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="Officer_IDLabel" runat="server" Text='<%# Eval("Officer_ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">Officer_ID</th>
                                        <th runat="server">First_Name</th>
                                        <th runat="server">Last_Name</th>
                                        <th runat="server">Phone</th>
                                        <th runat="server">Email</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="Officer_IDLabel" runat="server" Text='<%# Eval("Officer_ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
        </asp:ListView>

            <asp:LinkButton ID="ToOfficerReport" runat="server" OnClick="ToOfficerReport_Click">To Officer Report Page</asp:LinkButton>




        </div>

        <div id="managers" class="tab-pane fade">
            <asp:ListView ID="ManagerList" runat="server" DataSourceID="ManagerDataSource">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Label ID="managerIDLabel" runat="server" Text='<%# Eval("managerID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="fullNameLabel" runat="server" Text='<%# Eval("fullName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="managerIDTextBox" runat="server" Text='<%# Bind("managerID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="fullNameTextBox" runat="server" Text='<%# Bind("fullName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="managerIDTextBox" runat="server" Text='<%# Bind("managerID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="fullNameTextBox" runat="server" Text='<%# Bind("fullName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Label ID="managerIDLabel" runat="server" Text='<%# Eval("managerID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="fullNameLabel" runat="server" Text='<%# Eval("fullName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">managerID</th>
                                        <th runat="server">fullName</th>
                                        <th runat="server">phone</th>
                                        <th runat="server">email</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Label ID="managerIDLabel" runat="server" Text='<%# Eval("managerID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="fullNameLabel" runat="server" Text='<%# Eval("fullName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
        </asp:ListView>

            <asp:LinkButton ID="ManagerReportLink" runat="server" OnClick="ManagerReportLink_Click">To Manager Report Page</asp:LinkButton>
        </div>



     <asp:ObjectDataSource ID="OrganizationData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupRegisteredOrganizations" TypeName="MockERKS.Framework.BLL.StaffController" DataObjectTypeName="MockERKS.Framework.Entities.Organization" UpdateMethod="updateOrganization"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="FilesDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFiles" TypeName="MockERKS.Framework.BLL.StaffController" DataObjectTypeName="MockERKS.Framework.Entities.Site_File" UpdateMethod="File_Update"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="OfficerDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupOfficers" TypeName="MockERKS.Framework.BLL.StaffController" DataObjectTypeName="MockERKS.Framework.Entities.Officer" UpdateMethod="updateOfficer"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ManagerDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupManager" TypeName="MockERKS.Framework.BLL.StaffController" DataObjectTypeName="MockERKS.Framework.Entities.Manager" UpdateMethod="updateManager"></asp:ObjectDataSource>

    </div>

     </asp:Content>
