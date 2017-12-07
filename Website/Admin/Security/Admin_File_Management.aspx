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
                          
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="File_ID" 
                                    DataSourceID="SqlDataSource1" CellPadding="4" CssClass="active"  ForeColor="#333333" GridLines="None"
                                     OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                        <asp:TemplateField HeaderText="File ID" InsertVisible="False" SortExpression="File_ID">
                                            <EditItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("File_ID") %>' ID="Label1"></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("File_ID") %>' ID="Label1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Security Classification ID" SortExpression="Security_Classification_ID">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList1" runat="server"
                                                     DataSourceID="SecurityClassODS" 
                                                     DataTextField="securityClassificationName"
                                                     DataValueField="securityClassificationID"
                                                     selectedValue='<%# Bind("Security_Classification_ID") %>'></asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Security_Classification_ID") %>' ID="Label2"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File Status" SortExpression="File_Status">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("File_Status") %>'>
                                                    <asp:ListItem >Open</asp:ListItem>
                                                    <asp:ListItem >Closed</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("File_Status") %>' ID="Label3"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Closed Date" SortExpression="Closed_Date">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("Closed_Date") %>' ID="TextBox3"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Closed_Date") %>' ID="Label4"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LINC Number" SortExpression="LINC_Number">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("LINC_Number") %>' ID="TextBox4"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("LINC_Number") %>' ID="Label5"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization ID" SortExpression="Organization_ID">
                                            <EditItemTemplate>
                                                <asp:label runat="server" Text='<%# Bind("Organization_ID") %>' ID="TextBox5"></asp:label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Organization_ID") %>' ID="Label6"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                                
                               
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:MockERKSConnectionString %>'
                                DeleteCommand="DELETE FROM [Site_File] WHERE [File_ID] = @original_File_ID"
                                InsertCommand="INSERT INTO [Site_File] ([Security_Classification_ID], [File_Status], [Closed_Date], [LINC_Number], [Organization_ID]) VALUES (@Security_Classification_ID, @File_Status, @Closed_Date, @LINC_Number, @Organization_ID)"
                                SelectCommand="SELECT [File_ID], [Security_Classification_ID], [File_Status], [Closed_Date], [LINC_Number], [Organization_ID] FROM [Site_File]" UpdateCommand="UPDATE [Site_File] SET [Security_Classification_ID] = @Security_Classification_ID, [File_Status] = @File_Status, [Closed_Date] = @Closed_Date, [LINC_Number] = @LINC_Number, [Organization_ID] = @Organization_ID WHERE [File_ID] = @original_File_ID" OldValuesParameterFormatString="original_{0}">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_File_ID" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Security_Classification_ID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="File_Status" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="Closed_Date" DbType="Date"></asp:Parameter>
                                    <asp:Parameter Name="LINC_Number" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="Organization_ID" Type="Int32"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Security_Classification_ID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="File_Status" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="Closed_Date" DbType="Date"></asp:Parameter>
                                    <asp:Parameter Name="LINC_Number" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="Organization_ID" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="original_File_ID" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>

                           <br />
                           
                            
                        </ContentTemplate>

                    </asp:UpdatePanel>
                  </div>
                   
                  
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
                            <asp:ListView ID="ClientListView" runat="server" DataKeyNames="Organization_ID" DataSourceID="ClientODS" InsertItemPosition="LastItem">
                                <AlternatingItemTemplate>
                                    <tr style="background-color: #FFFFFF; color: #284775;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" class="btn btn-danger"/>
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" class="btn btn-info"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_ID") %>' runat="server" ID="Organization_IDLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Location_Code") %>' runat="server" ID="Location_CodeLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_Name") %>' runat="server" ID="Organization_NameLabel" /></td>
                                        <td>
                                            <asp:DropDownList ID="DescriptionDDl" runat="server"
                                                 DataSourceID="DescriptionODS"
                                                 DataTextField="Description" 
                                                DataValueField="Description_ID"
                                                selectedvalue='<%# Eval("Description_ID") %>'
                                                     Width="250"></asp:DropDownList></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Phone") %>' runat="server" ID="PhoneLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /></td>
                     
                                   
                                    </tr>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <tr style="background-color: #90EE90;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" class="btn btn-success"/>
                                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" class="btn"/>
                                        </td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Organization_ID") %>' runat="server" ID="Organization_IDTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Location_Code") %>' runat="server" ID="Location_CodeTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Organization_Name") %>' runat="server" ID="Organization_NameTextBox" /></td>
                                        <td>
                                            <asp:DropDownList ID="DescriptionDDl" runat="server"
                                                 DataSourceID="DescriptionODS"
                                                 DataTextField="Description" 
                                                DataValueField="Description_ID"
                                                selectedvalue='<%# Bind("Description_ID") %>'
                                                     Width="250"></asp:DropDownList>
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
                                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" class="btn btn-success"/>
                                            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" class="btn"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Organization_ID") %>' runat="server" ID="Organization_IDTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Location_Code") %>' runat="server" ID="Location_CodeTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Organization_Name") %>' runat="server" ID="Organization_NameTextBox" /></td>
                                        <td>
                                            <asp:DropDownList ID="DescriptionDDl" runat="server"
                                                 DataSourceID="DescriptionODS"
                                                 DataTextField="Description" 
                                                DataValueField="Description_ID"
                                                selectedvalue='<%# Bind("Description_ID") %>'
                                                     Width="250"></asp:DropDownList>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /></td>
                                       
                                       
                                       
                                    </tr>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <tr style="background-color: #E0FFFF; color: #333333;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" class="btn btn-danger" />
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" class="btn btn-info"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_ID") %>' runat="server" ID="Organization_IDLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Location_Code") %>' runat="server" ID="Location_CodeLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_Name") %>' runat="server" ID="Organization_NameLabel" /></td>
                                        <td>
                                              <asp:DropDownList ID="DescriptionDDl" runat="server"
                                                 DataSourceID="DescriptionODS"
                                                 DataTextField="Description" 
                                                DataValueField="Description_ID"
                                                selectedvalue='<%# Bind("Description_ID") %>'
                                                     Width="250"></asp:DropDownList></td>
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
                                                        <th runat="server">Organization_ID</th>
                                                        <th runat="server">Location_Code</th>
                                                        <th runat="server">Organization_Name</th>
                                                        <th runat="server">Description_ID</th>
                                                        <th runat="server">Phone</th>
                                                        <th runat="server">Email</th>
                                                        
                                                        
                                                    </tr>
                                                    <tr runat="server" id="itemPlaceholder"></tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                                                <asp:DataPager runat="server" ID="DataPager3">
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
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" class="btn btn-danger" />
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_ID") %>' runat="server" ID="Organization_IDLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Location_Code") %>' runat="server" ID="Location_CodeLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_Name") %>' runat="server" ID="Organization_NameLabel" /></td>
                                        <td>
                                              <asp:DropDownList ID="DescriptionDDl" runat="server"
                                                 DataSourceID="DescriptionODS"
                                                 DataTextField="Description" 
                                                DataValueField="Description_ID"
                                                selectedvalue='<%# Bind("Description_ID") %>'
                                                     Width="250"></asp:DropDownList></td>
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


                </div>
                <asp:ObjectDataSource ID="ClientODS" runat="server" DataObjectTypeName="MockERKS.Framework.Entities.Organization" 
                    DeleteMethod="Client_Delete" InsertMethod="Client_Add" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="ListAll_Organizations" 
                    TypeName="MockERKS.Framework.BLL.AdminController" 
                    UpdateMethod="Client_Update">

                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DescriptionODS" runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="DescriptionList" 
                    TypeName="MockERKS.Framework.BLL.ClientController"></asp:ObjectDataSource>
              
                

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
                                        <%--<td>
                                            <asp:Label Text='<%# Eval("Record_Details") %>' runat="server" ID="Record_DetailsLabel" /></td>--%>
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
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /></td>
                                        <%--<td>
                                            <asp:TextBox Text='<%# Bind("Record_Details") %>' runat="server" ID="Record_DetailsTextBox" /></td>--%>
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
                                  <%--      <td>
                                            <asp:TextBox Text='<%# Bind("Record_Details") %>' runat="server" ID="Record_DetailsTextBox" /></td>--%>
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
                                       <%-- <td>
                                            <asp:Label Text='<%# Eval("Record_Details") %>' runat="server" ID="Record_DetailsLabel" /></td>--%>
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
                                       <%-- <td>
                                            <asp:Label Text='<%# Eval("Record_Details") %>' runat="server" ID="Record_DetailsLabel" /></td>--%>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <br />
                            <asp:Button ID="SearchEmployeeByID" runat="server" Text="Search Employee By ID" />


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

