<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupFile.aspx.cs" Inherits="AutomatedApprovalSystem_LookupFile" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>File List</h2>
    <p>
        
        
        
        <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource2">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
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
                <tr style="background-color:#008A8C;color: #FFFFFF;">
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
                <tr style="background-color:#DCDCDC;color: #000000;">
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
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
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
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
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
        
        
        
    </p>

           



    



     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFiles" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>



     </asp:Content>
