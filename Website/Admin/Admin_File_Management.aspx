<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Admin_File_Management.aspx.cs" Inherits="Admin_Admin_File_Management" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <h1>File, Client And Employee Management</h1>
    <asp:UpdatePanel ID="UpdatePanelMessage" runat="server">
        <ContentTemplate>
            <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="row">
        <div class="col-md-12">
            <script>
                function nextButton(anchorRef) {
                    $('a[href="' + anchorRef + '"]').tab('show');
                }
            </script>
            <ul class="nav nav-tabs">
                <li class="active"><a href="#FileLookup" data-toggle="tab">File Lookup</a></li>
                <li><a href="#Client" data-toggle="tab">Client Management</a></li>
                <li><a href="#Employee" data-toggle="tab">Employee Management</a></li>
            </ul>

            <div class="tab-content">

                <div class="tab-pane active" id="FileLookup">
                    <asp:UpdatePanel ID="UpdatePanelUser" runat="server">
                        <ContentTemplate>
                            <div class="col-sm-2">

                                <br />
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Search By Type"></asp:Label>
                                <br />
                                <asp:DropDownList ID="FileTypeDDL" runat="server" DataSourceID="FileTypeODS" DataTextField="typeDescription" DataValueField="typeID"></asp:DropDownList>&nbsp;
                                <asp:Button ID="Button2" runat="server" Text="Search" />

                                <br />
                                <br />

                            </div>

                            <div class="col-sm-9">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="FileID" HeaderText="FileID" SortExpression="FileID"></asp:BoundField>
                                        <asp:BoundField DataField="filetype" HeaderText="filetype" SortExpression="filetype"></asp:BoundField>
                                        <asp:BoundField DataField="operationName" HeaderText="operationName" SortExpression="operationName"></asp:BoundField>
                                        <asp:BoundField DataField="organizationName" HeaderText="organizationName" SortExpression="organizationName"></asp:BoundField>
                                        <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName"></asp:BoundField>
                                        <asp:BoundField DataField="OrganizationID" HeaderText="OrganizationID" SortExpression="OrganizationID"></asp:BoundField>
                                        <asp:BoundField DataField="DocumentType" HeaderText="DocumentType" SortExpression="DocumentType"></asp:BoundField>
                                        <asp:BoundField DataField="SecurityClassification" HeaderText="SecurityClassification" SortExpression="SecurityClassification"></asp:BoundField>
                                        <asp:BoundField DataField="FileStatus" HeaderText="FileStatus" SortExpression="FileStatus"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>



                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:ObjectDataSource ID="FileTypeODS" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="DropDownFileType"
                        TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>
                   
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFiletype" TypeName="MockERKS.Framework.BLL.AdminController" UpdateMethod="UpdateFile">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="FileTypeDDL" PropertyName="SelectedValue" Name="typeId" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="file" Type="Object"></asp:Parameter>
                            <asp:Parameter Name="rDetails" Type="Object"></asp:Parameter>
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </div>
                <br />

                <%-- //Client Management--%>
                <div class="tab-pane" id="Client">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="SearchClients" runat="server" Text="Search All Clients" />
                            <br />

                            <br />

                            <asp:Button ID="SeacrhClientByID" runat="server" Text="Search Client By ID" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    
                </div>

                <%-- //Employee Management--%>
                <div class="tab-pane" id="Employee">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <asp:Label ID="Label2" runat="server" Text="Current Employees"></asp:Label>
                           
                            <br />
                            <asp:ListView ID="EmployeeListView" runat="server" DataSourceID="EmployeeODS" 
                                DataKeyNames="Officer_ID" InsertItemPosition="LastItem">
                                <AlternatingItemTemplate>
                                    <tr style="background-color: #FFFFFF; color: #284775;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Officer_ID") %>' runat="server" ID="Officer_IDLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("First_Name") %>' runat="server" ID="First_NameLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Last_Name") %>' runat="server" ID="Last_NameLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Phone") %>' runat="server" ID="PhoneLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /></td>
                                        
                                    </tr>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <tr style="background-color: #999999;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                                        </td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Officer_ID") %>' runat="server" ID="Officer_IDTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("First_Name") %>' runat="server" ID="First_NameTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Last_Name") %>' runat="server" ID="Last_NameTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /></td>
                                        
                                    </tr>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <InsertItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" CausesValidation="false" />
                                            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" CausesValidation="false"/>
                                        </td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Officer_ID") %>' runat="server" ID="Officer_IDTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("First_Name") %>' runat="server" ID="First_NameTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Last_Name") %>' runat="server" ID="Last_NameTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /></td>
                                      
                                    </tr>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <tr style="background-color: #E0FFFF; color: #333333;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CausesValidation="false"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Officer_ID") %>' runat="server" ID="Officer_IDLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("First_Name") %>' runat="server" ID="First_NameLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Last_Name") %>' runat="server" ID="Last_NameLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Phone") %>' runat="server" ID="PhoneLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /></td>
                                        
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                                        <th runat="server"></th>
                                                        <th runat="server">Officer_ID</th>
                                                        <th runat="server">First_Name</th>
                                                        <th runat="server">Last_Name</th>
                                                        <th runat="server">Phone</th>
                                                        <th runat="server">Email</th>
                                                        
                                                    </tr>
                                                    <tr runat="server" id="itemPlaceholder"></tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                                                <asp:DataPager runat="server" ID="DataPager1">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Officer_ID") %>' runat="server" ID="Officer_IDLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("First_Name") %>' runat="server" ID="First_NameLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Last_Name") %>' runat="server" ID="Last_NameLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Phone") %>' runat="server" ID="PhoneLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /></td>
                                        
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>

                            <br />
                            <asp:Button ID="SearchEmployeeByID" runat="server" Text="Search Employee By ID" />


                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:ObjectDataSource ID="EmployeeODS" runat="server" 
                        DataObjectTypeName="MockERKS.Framework.Entities.Officer" 
                        DeleteMethod="Officer_Delete" 
                        InsertMethod="Officer_Add" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="ListAll_Officer" 
                        TypeName="MockERKS.Framework.BLL.AdminController"
                          OnSelected="CheckForException"
                                 OnDeleted="CheckForException"
                                 OnInserted="CheckForException"
                                 OnUpdated="CheckForException"></asp:ObjectDataSource>

                </div>

            </div>

        </div>

    </div>




</asp:Content>

