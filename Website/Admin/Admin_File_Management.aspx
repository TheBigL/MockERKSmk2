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
                            <div class="col-sm-2">

                               <%-- <asp:DropDownList ID="FileTypeDDL" runat="server" DataSourceID="FileTypeODS" DataTextField="typeDescription" DataValueField="typeID"></asp:DropDownList>&nbsp;--%>
                               
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search All Files" />
                                <br />
                                <br />
                                <br />
                                <asp:Button ID="Button2" runat="server"  Text="Search Files By Type" />
                            </div>

                            <div class="col-sm-9">
                                

                                <asp:GridView ID="SiteFileGridView" runat="server" Visible="false" AutoGenerateColumns="False" DataKeyNames="File_ID" DataSourceID="LookUpAllFilesODS" AllowPaging="True">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                                        <asp:TemplateField HeaderText="File_ID" SortExpression="File_ID">
                                            <EditItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("File_ID") %>' ID="TextBox1"></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("File_ID") %>' ID="Label1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type_ID" SortExpression="Type_ID">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("Type_ID") %>' ID="TextBox2"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Type_ID") %>' ID="Label2"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Operation_ID" SortExpression="Operation_ID">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("Operation_ID") %>' ID="TextBox3"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Operation_ID") %>' ID="Label3"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PBL_ID" SortExpression="PBL_ID">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("PBL_ID") %>' ID="TextBox4"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("PBL_ID") %>' ID="Label4"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Category_ID" SortExpression="Category_ID">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("Category_ID") %>' ID="TextBox5"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Category_ID") %>' ID="Label5"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LINC_Number" SortExpression="LINC_Number">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("LINC_Number") %>' ID="TextBox6"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("LINC_Number") %>' ID="Label6"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization_ID" SortExpression="Organization_ID">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("Organization_ID") %>' ID="TextBox7"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Organization_ID") %>' ID="Label7"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Document_ID" SortExpression="Document_ID">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("Document_ID") %>' ID="TextBox8"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Document_ID") %>' ID="Label8"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Security_Classification_ID" SortExpression="Security_Classification_ID">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("Security_Classification_ID") %>' ID="TextBox9"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Security_Classification_ID") %>' ID="Label9"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File_Status" SortExpression="File_Status">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("File_Status") %>' ID="TextBox10"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("File_Status") %>' ID="Label10"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Closed_Date" SortExpression="Closed_Date">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("Closed_Date") %>' ID="TextBox11"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Closed_Date") %>' ID="Label11"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>



                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:ObjectDataSource ID="LookUpAllFilesODS" runat="server"
                         DataObjectTypeName="MockERKS.Framework.Entities.Site_File" 
                        DeleteMethod="DeleteFile" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="ListAll_SiteFile" 
                        TypeName="MockERKS.Framework.BLL.AdminController" 
                        UpdateMethod="File_Update">
                        <DeleteParameters>
                            <asp:Parameter Name="fileID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="rdetails" Type="Object"></asp:Parameter>
                        </DeleteParameters>
                    </asp:ObjectDataSource>
                   
                    <asp:ObjectDataSource ID="SearchFileTypeODS" runat="server"></asp:ObjectDataSource>
                </div>

                <asp:ObjectDataSource ID="SecurityClass" runat="server"></asp:ObjectDataSource>


                <asp:ObjectDataSource ID="FileTypeLISTODS" runat="server"
                     OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="File_TypeList" 
                    TypeName="MockERKS.Framework.BLL.AdminController"></asp:ObjectDataSource>
                <br />

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

