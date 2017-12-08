<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Admin_File_Management.aspx.cs" Inherits="Admin_Admin_File_Management" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server" >

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
                            <div class="row">
                                <uc1:MessageUserControl runat="server" ID="MessageUserControl1" />
                            </div>
                            <div class="col-md-12">

                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="File_ID" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                        <asp:BoundField DataField="File_ID" HeaderText="File_ID" ReadOnly="True" InsertVisible="False" SortExpression="File_ID"></asp:BoundField>

                                        <asp:BoundField DataField="Type_ID" HeaderText="Type_ID" SortExpression="Type_ID"></asp:BoundField>
                                        <asp:BoundField DataField="Organization_ID" HeaderText="Organization_ID" SortExpression="Organization_ID"></asp:BoundField>
                                        <asp:BoundField DataField="LINC_Number" HeaderText="LINC_Number" SortExpression="LINC_Number"></asp:BoundField>
                                        <asp:BoundField DataField="Security_Classification_ID" HeaderText="Security_Classification_ID" SortExpression="Security_Classification_ID"></asp:BoundField>
                                        <asp:BoundField DataField="File_Status" HeaderText="File_Status" SortExpression="File_Status"></asp:BoundField>
                                        <asp:BoundField DataField="Closed_Date" HeaderText="Closed_Date" SortExpression="Closed_Date"></asp:BoundField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                    <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>

                                    <RowStyle BackColor="White"></RowStyle>

                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                    <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

                                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                    <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                </asp:GridView>
                               
                            </div>
                            <br />

                        </ContentTemplate>

                    </asp:UpdatePanel>
                  </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:MockERKSConnectionString %>' 
                    DeleteCommand="DELETE FROM [Site_File] WHERE [File_ID] = @File_ID" 
                    InsertCommand="INSERT INTO [Site_File] ([Type_ID], [Organization_ID], [LINC_Number], [Security_Classification_ID], [File_Status], [Closed_Date]) VALUES (@Type_ID, @Organization_ID, @LINC_Number, @Security_Classification_ID, @File_Status, @Closed_Date)" SelectCommand="SELECT [File_ID], [Type_ID], [Organization_ID], [LINC_Number], [Security_Classification_ID], [File_Status], [Closed_Date] FROM [Site_File]" 
                    UpdateCommand="UPDATE [Site_File] SET [Type_ID] = @Type_ID, [Organization_ID] = @Organization_ID, [LINC_Number] = @LINC_Number, [Security_Classification_ID] = @Security_Classification_ID, [File_Status] = @File_Status, [Closed_Date] = @Closed_Date WHERE [File_ID] = @File_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="File_ID" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Type_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Organization_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="LINC_Number" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Security_Classification_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="File_Status" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="Closed_Date"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Type_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Organization_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="LINC_Number" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Security_Classification_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="File_Status" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="Closed_Date"></asp:Parameter>
                        <asp:Parameter Name="File_ID" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                  
                <br />
               


                <%--file type ODS--%>
                <asp:ObjectDataSource ID="FileTypeODS" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="DropDownFileType" 
                    TypeName="MockERKS.Framework.BLL.FileController">

                </asp:ObjectDataSource>

                <%--Security Class ODS--%>
                <asp:ObjectDataSource ID="SecurityClassODS" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="DropDownSecurityClassification" 
                    TypeName="MockERKS.Framework.BLL.FileController">

                </asp:ObjectDataSource>

                <asp:ObjectDataSource ID="SiteFileODs" runat="server" 
                    OldValuesParameterFormatString="original_{0}"
                     SelectMethod="siteFile_Get" 
                    TypeName="MockERKS.Framework.BLL.AdminController">
                </asp:ObjectDataSource>
              
 <%-- //Client Management-------------------------------------------------------------------------------------------------%>
                <div class="tab-pane" id="Client">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="Label3" runat="server" Text="All Clients"></asp:Label>
                            <br />
                           
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Organization_ID" DataSourceID="SqlDataSource2" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                    <asp:BoundField DataField="Organization_ID" HeaderText="Organization_ID" ReadOnly="True" InsertVisible="False" SortExpression="Organization_ID"></asp:BoundField>
                                    <asp:BoundField DataField="Organization_Name" HeaderText="Organization_Name" SortExpression="Organization_Name"></asp:BoundField>
                                    <asp:BoundField DataField="Description_ID" HeaderText="Description_ID" SortExpression="Description_ID"></asp:BoundField>
                                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                                    <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name"></asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>

                                <RowStyle BackColor="White"></RowStyle>

                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                            </asp:GridView>
                            <br />

                            
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:MockERKSConnectionString %>' DeleteCommand="DELETE FROM [Organization] WHERE [Organization_ID] = @Organization_ID" InsertCommand="INSERT INTO [Organization] ([Organization_Name], [Description_ID], [Phone], [Email], [User_Name]) VALUES (@Organization_Name, @Description_ID, @Phone, @Email, @User_Name)" SelectCommand="SELECT [Organization_ID], [Organization_Name], [Description_ID], [Phone], [Email], [User_Name] FROM [Organization]" UpdateCommand="UPDATE [Organization] SET [Organization_Name] = @Organization_Name, [Description_ID] = @Description_ID, [Phone] = @Phone, [Email] = @Email, [User_Name] = @User_Name WHERE [Organization_ID] = @Organization_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Organization_ID" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Organization_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Description_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="User_Name" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Organization_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Description_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="User_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Organization_ID" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>

              
              
                

   <%-- //Employee Management--------------------------------------------------------------------------------------------------------%>
                <div class="tab-pane" id="Employee">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <asp:Label ID="Label2" runat="server" Text="Current Employees"></asp:Label>

                            <br />

                            <asp:ListView ID="officerListView" runat="server" DataSourceID="OfficerODS" DataKeyNames="Officer_ID" InsertItemPosition="LastItem">
                                <AlternatingItemTemplate>
                                    <tr style="background-color: #FFFFFF; color: #284775;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton"  CausesValidation="false" class="btn btn-danger" />
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton"  CausesValidation="false" class="btn btn-info"/>
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
                                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton"  CausesValidation="false" class="btn btn-success"/>
                                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton"  CausesValidation="false" class="btn"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Officer_ID") %>' runat="server" ID="Officer_IDTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("First_Name") %>' runat="server" ID="First_NameTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Last_Name") %>' runat="server" ID="Last_NameTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" />

                                        </td>
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
                                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton"  CausesValidation="false" class="btn btn-success"/>
                                            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton"  CausesValidation="false" class="btn"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Officer_ID") %>' runat="server" ID="Officer_IDTextBox" /></td>
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
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CausesValidation="false" class="btn btn-danger"  />
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton"  CausesValidation="false" class="btn btn-info"/>
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
                                                <asp:DataPager runat="server" ID="DataPager2">
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
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton"  CausesValidation="false" class="btn btn-danger" />
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton"  CausesValidation="false" class="btn btn-info"/>
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
                            


                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:ObjectDataSource ID="OfficerODS" runat="server"
                         DataObjectTypeName="MockERKS.Framework.Entities.Officer"
                         DeleteMethod="Officer_Delete" 
                        InsertMethod="Officer_Add" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="ListAll_Officer" 
                        TypeName="MockERKS.Framework.BLL.AdminController"
                         UpdateMethod="Officer_Update"></asp:ObjectDataSource>

                </div>

            </div>

        </div>

    </div>




</asp:Content>

