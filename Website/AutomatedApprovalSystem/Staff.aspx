<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="AutomatedApprovalSystem_Staff" MasterPageFile="~/Site.master" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <div class="row">
        <h2>Staff List<asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="Officer_IDLabel" runat="server" Text='<%# Eval("Officer_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
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
                        <asp:TextBox ID="Officer_IDTextBox" runat="server" Text='<%# Bind("Officer_ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="First_NameTextBox" runat="server" Text='<%# Bind("First_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("Last_Name") %>' />
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
                        <asp:TextBox ID="Officer_IDTextBox" runat="server" Text='<%# Bind("Officer_ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="First_NameTextBox" runat="server" Text='<%# Bind("First_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("Last_Name") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="Officer_IDLabel" runat="server" Text='<%# Eval("Officer_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">Officer_ID</th>
                                    <th runat="server">First_Name</th>
                                    <th runat="server">Last_Name</th>
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
                        <asp:Label ID="Officer_IDLabel" runat="server" Text='<%# Eval("Officer_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
            </asp:ListView>
        </h2>
        <div class="row">




        
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupOfficers" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>



        
        
        </div>
    </div>

</asp:content>
