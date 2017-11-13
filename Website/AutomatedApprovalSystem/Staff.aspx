<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="AutomatedApprovalSystem_Staff" MasterPageFile="~/Site.master" %>

<asp:content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <div class="row">
        <h2>Staff
        </h2>
        <div class="row">



        
        <asp:ListView ID="StaffList" runat="server" DataSourceID="StaffData">
            <AlternatingItemTemplate>
                <tr style="background-color: #FAFAD2;color: #284775;">
                    <td>
                        <asp:DynamicControl runat="server" DataField="Officer_ID" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="First_Name" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Last_Name" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Phone" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Email" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Record_Details" Mode="ReadOnly" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #FFCC66;color: #000080;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Officer_ID" Mode="Edit" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="First_Name" Mode="Edit" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Last_Name" Mode="Edit" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Phone" Mode="Edit" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Email" Mode="Edit" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Record_Details" Mode="Edit" />
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
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Officer_ID" Mode="Insert" ValidationGroup="Insert" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="First_Name" Mode="Insert" ValidationGroup="Insert" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Last_Name" Mode="Insert" ValidationGroup="Insert" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Phone" Mode="Insert" ValidationGroup="Insert" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Email" Mode="Insert" ValidationGroup="Insert" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Record_Details" Mode="Insert" ValidationGroup="Insert" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFBD6;color: #333333;">
                    <td>
                        <asp:DynamicControl runat="server" DataField="Officer_ID" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="First_Name" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Last_Name" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Phone" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Email" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Record_Details" Mode="ReadOnly" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                    <th runat="server">Officer_ID</th>
                                    <th runat="server">First_Name</th>
                                    <th runat="server">Last_Name</th>
                                    <th runat="server">Phone</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">Record_Details</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
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
                <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    <td>
                        <asp:DynamicControl runat="server" DataField="Officer_ID" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="First_Name" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Last_Name" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Phone" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Email" Mode="ReadOnly" />
                    </td>
                    <td>
                        <asp:DynamicControl runat="server" DataField="Record_Details" Mode="ReadOnly" />
                    </td>
                </tr>
            </SelectedItemTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="StaffData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupStaff" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>



        
        
        </div>
    </div>

</asp:content>
