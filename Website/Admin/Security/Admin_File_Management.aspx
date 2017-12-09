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

                            

                                <h1> File Manager</h1>
                
                                <br /> 
                                
                                <asp:GridView ID="GridView3" runat="server"  OnRowUpdating="GridView3_RowUpdating" AutoGenerateColumns="False" DataKeyNames="File_ID" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                        <asp:TemplateField HeaderText="File_ID" InsertVisible="False" SortExpression="File_ID">
                                            <EditItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("File_ID") %>' ID="Label1"></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("File_ID") %>' ID="Label1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type_ID" SortExpression="Type_ID">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="Type_ID" runat="server" Selectedvalue='<%# Bind("Type_ID") %>'>
                                                     <asp:ListItem Text="SCD" Value="1"></asp:ListItem>
                                                     <asp:ListItem Text="CSU" Value="2"></asp:ListItem>
                                                     <asp:ListItem Text="PST" Value="3"></asp:ListItem>   
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Type_ID") %>' ID="Label2"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organization_ID" SortExpression="Organization_ID">
                                            <EditItemTemplate>
                                                <asp:label runat="server" Text='<%# Bind("Organization_ID") %>' ID="TextBox2"></asp:label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Organization_ID") %>' ID="Label3"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LINC_Number" SortExpression="LINC_Number">
                                            <EditItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("LINC_Number") %>' ID="TextBox3"></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("LINC_Number") %>' ID="Label4"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Security_Classification_ID" SortExpression="Security_Classification_ID">
                                            <EditItemTemplate>
                                                  <asp:DropDownList ID="Security_Class_ID" runat="server" Selectedvalue='<%# Bind("Security_Classification_ID") %>'>
                                                     <asp:ListItem Text="Unrestricted" Value="1"></asp:ListItem>
                                                     <asp:ListItem Text="Protected" Value="2"></asp:ListItem>  
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Security_Classification_ID") %>' ID="Label5"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File_Status" SortExpression="File_Status">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList1" runat="server" Selectedvalue='<%# Bind("File_Status") %>'>
                                                     <asp:ListItem Text="Open"></asp:ListItem>
                                                     <asp:ListItem Text="Closed"></asp:ListItem>  
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("File_Status") %>' ID="Label6"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Closed_Date" SortExpression="Closed_Date">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("Closed_Date") %>' ID="TextBox6"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Closed_Date") %>' ID="Label7"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

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

                            <h1>Existing Clients</h1>
                     
                           
                           
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Organization_ID" DataSourceID="SqlDataSource2" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                    <asp:TemplateField HeaderText="Organization_ID" InsertVisible="False" SortExpression="Organization_ID">
                                        <EditItemTemplate>
                                            <asp:Label runat="server" Text='<%# Eval("Organization_ID") %>' ID="Label1"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Organization_ID") %>' ID="Label1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Organization_Name" SortExpression="Organization_Name">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("Organization_Name") %>' ID="TextBox1"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Organization_Name") %>' ID="Label2"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description_ID" SortExpression="Description_ID">
                                        <EditItemTemplate>
                                             <asp:DropDownList ID="DropDownList1" runat="server" Selectedvalue='<%# Bind("Description_ID") %>'>
                                                     <asp:ListItem Text="Individual" Value="1"></asp:ListItem>
                                                     <asp:ListItem Text="Organization" Value="2"></asp:ListItem>  
                                                </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Description_ID") %>' ID="Label3"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                                        <EditItemTemplate>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ControlToValidate="TextBox3" ErrorMessage="Enter a 10 digit number before continuing."
                                                 ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                                            <asp:TextBox runat="server" Text='<%# Bind("Phone") %>' ID="TextBox3"></asp:TextBox>
                                          
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Phone") %>' ID="Label4"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                        <EditItemTemplate>
                                          <asp:RegularExpressionValidator ID="regexEmailValid" 
                                                runat="server" 
                                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ControlToValidate="TextBox4" ErrorMessage="Invalid Email Format"
                                              ForeColor="Red">
                                              </asp:RegularExpressionValidator>
                                            <asp:TextBox runat="server" Text='<%# Bind("Email") %>' ID="TextBox4"></asp:TextBox>
                                            
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Email") %>' ID="Label5"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User_Name" SortExpression="User_Name">
                                        <EditItemTemplate>
                                            <asp:label runat="server" Text='<%# Bind("User_Name") %>' ID="TextBox5"></asp:label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("User_Name") %>' ID="Label6"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

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

                             <h1>Current Employees</h1>


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
                                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton"   class="btn btn-success"/>
                                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton"  CausesValidation="false" class="btn"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Officer_ID") %>' runat="server" ID="Officer_IDTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("First_Name") %>' runat="server" ID="First_NameTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Last_Name") %>' runat="server" ID="Last_NameTextBox" /></td>
                                        <td>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ControlToValidate="PhoneTextBox" ErrorMessage="Enter a valid 10 digit number."
                                                 ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" />

                                        </td>
                                        <td>
                                              <asp:RegularExpressionValidator ID="regexEmailValid" 
                                                runat="server" 
                                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ControlToValidate="EmailTextBox" ErrorMessage="Invalid Email Format"
                                              ForeColor="Red">
                                              </asp:RegularExpressionValidator>
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
                                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton"  class="btn btn-success"/>
                                            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton"  CausesValidation="false" class="btn"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Officer_ID") %>' runat="server" ID="Officer_IDTextBox" /></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                                ErrorMessage="First name required " ControlToValidate="First_NameTextBox" SetFocusOnError="True" >
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox Text='<%# Bind("First_Name") %>' runat="server" ID="First_NameTextBox" /></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldAlbumReleaseYear" runat="server" ForeColor="Red"
                                                ErrorMessage="Last name required " ControlToValidate="Last_NameTextBox" SetFocusOnError="True">
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox Text='<%# Bind("Last_Name") %>' runat="server" ID="Last_NameTextBox" /></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="#990000" 
                                                 ErrorMessage="Phone required field" ControlToValidate="PhoneTextBox" SetFocusOnError="True" >
                                                          </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ControlToValidate="PhoneTextBox" ErrorMessage="Enter A 10 Digit Number."
                                                 ValidationExpression="[0-9]{10}" ForeColor="Red"  SetFocusOnError="True"></asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" /></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="#990000" 
                                                 ErrorMessage="Email required field" ControlToValidate="EmailTextBox" SetFocusOnError="True" >
                                                          </asp:RequiredFieldValidator>
                                              <asp:RegularExpressionValidator ID="regexEmailValid" 
                                                runat="server" 
                                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ControlToValidate="EmailTextBox" ErrorMessage="Invalid Email Format"
                                              ForeColor="Red"  SetFocusOnError="True">
                                              </asp:RegularExpressionValidator>
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

