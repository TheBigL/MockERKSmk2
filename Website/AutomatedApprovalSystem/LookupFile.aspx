<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupFile.aspx.cs" Inherits="AutomatedApprovalSystem_LookupFile" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>File List<asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Label ID="File_IDLabel" runat="server" Text='<%# Eval("File_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Type_IDLabel" runat="server" Text='<%# Eval("Type_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Operation_IDLabel" runat="server" Text='<%# Eval("Operation_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="PBL_IDLabel" runat="server" Text='<%# Eval("PBL_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Category_IDLabel" runat="server" Text='<%# Eval("Category_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="LINC_NumberLabel" runat="server" Text='<%# Eval("LINC_Number") %>' />
                </td>
                <td>
                    <asp:Label ID="Organization_IDLabel" runat="server" Text='<%# Eval("Organization_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Document_Type_IDLabel" runat="server" Text='<%# Eval("Document_Type_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Security_Classification_IDLabel" runat="server" Text='<%# Eval("Security_Classification_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="File_StatusLabel" runat="server" Text='<%# Eval("File_Status") %>' />
                </td>
                <td>
                    <asp:Label ID="Closed_DateLabel" runat="server" Text='<%# Eval("Closed_Date") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                </td>
                <td>
                    <asp:Label ID="Document_TypeLabel" runat="server" Text='<%# Eval("Document_Type") %>' />
                </td>
                <td>
                    <asp:Label ID="File_TypeLabel" runat="server" Text='<%# Eval("File_Type") %>' />
                </td>
                <td>
                    <asp:Label ID="LLD_PBLLabel" runat="server" Text='<%# Eval("LLD_PBL") %>' />
                </td>
                <td>
                    <asp:Label ID="OperationLabel" runat="server" Text='<%# Eval("Operation") %>' />
                </td>
                <td>
                    <asp:Label ID="OrganizationLabel" runat="server" Text='<%# Eval("Organization") %>' />
                </td>
                <td>
                    <asp:Label ID="Record_DetailsLabel" runat="server" Text='<%# Eval("Record_Details") %>' />
                </td>
                <td>
                    <asp:Label ID="Security_ClassificationLabel" runat="server" Text='<%# Eval("Security_Classification") %>' />
                </td>
                <td>
                    <asp:Label ID="SPIN_IILabel" runat="server" Text='<%# Eval("SPIN_II") %>' />
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
                    <asp:TextBox ID="File_IDTextBox" runat="server" Text='<%# Bind("File_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Type_IDTextBox" runat="server" Text='<%# Bind("Type_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Operation_IDTextBox" runat="server" Text='<%# Bind("Operation_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PBL_IDTextBox" runat="server" Text='<%# Bind("PBL_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Category_IDTextBox" runat="server" Text='<%# Bind("Category_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LINC_NumberTextBox" runat="server" Text='<%# Bind("LINC_Number") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Organization_IDTextBox" runat="server" Text='<%# Bind("Organization_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Document_Type_IDTextBox" runat="server" Text='<%# Bind("Document_Type_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Security_Classification_IDTextBox" runat="server" Text='<%# Bind("Security_Classification_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="File_StatusTextBox" runat="server" Text='<%# Bind("File_Status") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Closed_DateTextBox" runat="server" Text='<%# Bind("Closed_Date") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Document_TypeTextBox" runat="server" Text='<%# Bind("Document_Type") %>' />
                </td>
                <td>
                    <asp:TextBox ID="File_TypeTextBox" runat="server" Text='<%# Bind("File_Type") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LLD_PBLTextBox" runat="server" Text='<%# Bind("LLD_PBL") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OperationTextBox" runat="server" Text='<%# Bind("Operation") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OrganizationTextBox" runat="server" Text='<%# Bind("Organization") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Record_DetailsTextBox" runat="server" Text='<%# Bind("Record_Details") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Security_ClassificationTextBox" runat="server" Text='<%# Bind("Security_Classification") %>' />
                </td>
                <td>
                    <asp:TextBox ID="SPIN_IITextBox" runat="server" Text='<%# Bind("SPIN_II") %>' />
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
                    <asp:TextBox ID="File_IDTextBox" runat="server" Text='<%# Bind("File_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Type_IDTextBox" runat="server" Text='<%# Bind("Type_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Operation_IDTextBox" runat="server" Text='<%# Bind("Operation_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PBL_IDTextBox" runat="server" Text='<%# Bind("PBL_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Category_IDTextBox" runat="server" Text='<%# Bind("Category_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LINC_NumberTextBox" runat="server" Text='<%# Bind("LINC_Number") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Organization_IDTextBox" runat="server" Text='<%# Bind("Organization_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Document_Type_IDTextBox" runat="server" Text='<%# Bind("Document_Type_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Security_Classification_IDTextBox" runat="server" Text='<%# Bind("Security_Classification_ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="File_StatusTextBox" runat="server" Text='<%# Bind("File_Status") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Closed_DateTextBox" runat="server" Text='<%# Bind("Closed_Date") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Document_TypeTextBox" runat="server" Text='<%# Bind("Document_Type") %>' />
                </td>
                <td>
                    <asp:TextBox ID="File_TypeTextBox" runat="server" Text='<%# Bind("File_Type") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LLD_PBLTextBox" runat="server" Text='<%# Bind("LLD_PBL") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OperationTextBox" runat="server" Text='<%# Bind("Operation") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OrganizationTextBox" runat="server" Text='<%# Bind("Organization") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Record_DetailsTextBox" runat="server" Text='<%# Bind("Record_Details") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Security_ClassificationTextBox" runat="server" Text='<%# Bind("Security_Classification") %>' />
                </td>
                <td>
                    <asp:TextBox ID="SPIN_IITextBox" runat="server" Text='<%# Bind("SPIN_II") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Label ID="File_IDLabel" runat="server" Text='<%# Eval("File_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Type_IDLabel" runat="server" Text='<%# Eval("Type_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Operation_IDLabel" runat="server" Text='<%# Eval("Operation_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="PBL_IDLabel" runat="server" Text='<%# Eval("PBL_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Category_IDLabel" runat="server" Text='<%# Eval("Category_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="LINC_NumberLabel" runat="server" Text='<%# Eval("LINC_Number") %>' />
                </td>
                <td>
                    <asp:Label ID="Organization_IDLabel" runat="server" Text='<%# Eval("Organization_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Document_Type_IDLabel" runat="server" Text='<%# Eval("Document_Type_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Security_Classification_IDLabel" runat="server" Text='<%# Eval("Security_Classification_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="File_StatusLabel" runat="server" Text='<%# Eval("File_Status") %>' />
                </td>
                <td>
                    <asp:Label ID="Closed_DateLabel" runat="server" Text='<%# Eval("Closed_Date") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                </td>
                <td>
                    <asp:Label ID="Document_TypeLabel" runat="server" Text='<%# Eval("Document_Type") %>' />
                </td>
                <td>
                    <asp:Label ID="File_TypeLabel" runat="server" Text='<%# Eval("File_Type") %>' />
                </td>
                <td>
                    <asp:Label ID="LLD_PBLLabel" runat="server" Text='<%# Eval("LLD_PBL") %>' />
                </td>
                <td>
                    <asp:Label ID="OperationLabel" runat="server" Text='<%# Eval("Operation") %>' />
                </td>
                <td>
                    <asp:Label ID="OrganizationLabel" runat="server" Text='<%# Eval("Organization") %>' />
                </td>
                <td>
                    <asp:Label ID="Record_DetailsLabel" runat="server" Text='<%# Eval("Record_Details") %>' />
                </td>
                <td>
                    <asp:Label ID="Security_ClassificationLabel" runat="server" Text='<%# Eval("Security_Classification") %>' />
                </td>
                <td>
                    <asp:Label ID="SPIN_IILabel" runat="server" Text='<%# Eval("SPIN_II") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">File_ID</th>
                                <th runat="server">Type_ID</th>
                                <th runat="server">Operation_ID</th>
                                <th runat="server">PBL_ID</th>
                                <th runat="server">Category_ID</th>
                                <th runat="server">LINC_Number</th>
                                <th runat="server">Organization_ID</th>
                                <th runat="server">Document_Type_ID</th>
                                <th runat="server">Security_Classification_ID</th>
                                <th runat="server">File_Status</th>
                                <th runat="server">Closed_Date</th>
                                <th runat="server">Category</th>
                                <th runat="server">Document_Type</th>
                                <th runat="server">File_Type</th>
                                <th runat="server">LLD_PBL</th>
                                <th runat="server">Operation</th>
                                <th runat="server">Organization</th>
                                <th runat="server">Record_Details</th>
                                <th runat="server">Security_Classification</th>
                                <th runat="server">SPIN_II</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="File_IDLabel" runat="server" Text='<%# Eval("File_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Type_IDLabel" runat="server" Text='<%# Eval("Type_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Operation_IDLabel" runat="server" Text='<%# Eval("Operation_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="PBL_IDLabel" runat="server" Text='<%# Eval("PBL_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Category_IDLabel" runat="server" Text='<%# Eval("Category_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="LINC_NumberLabel" runat="server" Text='<%# Eval("LINC_Number") %>' />
                </td>
                <td>
                    <asp:Label ID="Organization_IDLabel" runat="server" Text='<%# Eval("Organization_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Document_Type_IDLabel" runat="server" Text='<%# Eval("Document_Type_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="Security_Classification_IDLabel" runat="server" Text='<%# Eval("Security_Classification_ID") %>' />
                </td>
                <td>
                    <asp:Label ID="File_StatusLabel" runat="server" Text='<%# Eval("File_Status") %>' />
                </td>
                <td>
                    <asp:Label ID="Closed_DateLabel" runat="server" Text='<%# Eval("Closed_Date") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                </td>
                <td>
                    <asp:Label ID="Document_TypeLabel" runat="server" Text='<%# Eval("Document_Type") %>' />
                </td>
                <td>
                    <asp:Label ID="File_TypeLabel" runat="server" Text='<%# Eval("File_Type") %>' />
                </td>
                <td>
                    <asp:Label ID="LLD_PBLLabel" runat="server" Text='<%# Eval("LLD_PBL") %>' />
                </td>
                <td>
                    <asp:Label ID="OperationLabel" runat="server" Text='<%# Eval("Operation") %>' />
                </td>
                <td>
                    <asp:Label ID="OrganizationLabel" runat="server" Text='<%# Eval("Organization") %>' />
                </td>
                <td>
                    <asp:Label ID="Record_DetailsLabel" runat="server" Text='<%# Eval("Record_Details") %>' />
                </td>
                <td>
                    <asp:Label ID="Security_ClassificationLabel" runat="server" Text='<%# Eval("Security_Classification") %>' />
                </td>
                <td>
                    <asp:Label ID="SPIN_IILabel" runat="server" Text='<%# Eval("SPIN_II") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
        </asp:ListView>
    </h2>
    <p>
        
    </p>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFiles" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

       







     </asp:Content>
