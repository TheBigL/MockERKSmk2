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
                <%--<li class="active"><a href="#FileLookup" data-toggle="tab">File Lookup</a></li>--%>
                <li class="active"><a href="#Client" data-toggle="tab">Client Management</a></li>
                <li><a href="#Employee" data-toggle="tab">Employee Management</a></li>
            </ul>

          <div class="tab-content">

                <%--<div class="tab-pane active" id="FileLookup">
                    
                    <asp:UpdatePanel ID="UpdatePanelUser" runat="server">
                        <ContentTemplate>

                                <h1> File Manager</h1>
                
                                <br />
                            

                            <asp:GridView ID="GVSitefile" runat="server"
                                 AutoGenerateColumns="False" 
                                OnRowEditing="GVSitefile_RowEditing"
                                OnRowCancelingEdit="GVSitefile_RowCancelingEdit"
                                OnRowUpdating="GVSitefile_RowUpdating"
                                BackColor="White" 
                                BorderColor="#CCCCCC" 
                                BorderStyle="None" 
                                BorderWidth="1px" 
                                CellPadding="3">
                                <Columns>
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
                                            <asp:DropDownList ID="TypeDDL" runat="server" Selectedvalue='<%# Bind("Type_ID") %>' AutoPostBack="True" >
                                                     <asp:ListItem Value="1">SCD</asp:ListItem>
                                                     <asp:ListItem  Value="2">CSU</asp:ListItem>
                                                     <asp:ListItem  Value="3">PST</asp:ListItem> 
                                                </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Type_ID") %>' ID="Label2"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
 
                                    <asp:TemplateField HeaderText="Organization_ID" SortExpression="Organization_ID">
                                        <EditItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Organization_ID") %>' ID="TextBox4"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Organization_ID") %>' ID="Label4"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Security_Classification_ID" SortExpression="Security_Classification_ID">
                                        <EditItemTemplate>
                                             <asp:DropDownList ID="securityclassDDL" runat="server" Selectedvalue='<%# Bind("Security_Classification_ID") %>'  AutoPostBack="True" >
                                                     <asp:ListItem  Value="1">Unrestricted</asp:ListItem>
                                                     <asp:ListItem  Value="2">Protected</asp:ListItem>  
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Security_Classification_ID") %>' ID="Label5"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="File_Status" SortExpression="File_Status">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="FileStausDDL" runat="server" Selectedvalue='<%# Bind("File_Status") %>'  AutoPostBack="True" >
                                                        <asp:ListItem >Open</asp:ListItem>
                                                     <asp:ListItem>Closed</asp:ListItem>     
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("File_Status") %>' ID="Label6"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Closed_Date" SortExpression="Closed_Date">
                                        <EditItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Closed_Date") %>' ID="TextBox7"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Closed_Date") %>' ID="Label7"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Controls" SortExpression="Controls">
                                        <EditItemTemplate>
                                            <asp:ImageButton ImageUrl="~/Images/saved.png" runat="server" commandName="Update" ToolTip="Update" CausesValidation="false" Width="20px" Height="20px" />
                                            <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" commandName="Cancel" ToolTip="Cancel" CausesValidation="false" Width="20px" Height="20px" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" commandName="Edit" CausesValidation="false" ToolTip="Edit" Width="20px" Height="20px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                                <RowStyle ForeColor="#000066"></RowStyle>

                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
                            </asp:GridView>

                            <br />
                            <asp:Label ID="SuccessMessage" Text="" runat="server" Forecolor="Green" />
                            <br />
                            <asp:Label ID="ErrorMessage" Text="" runat="server" Forecolor="Red" />
                        </ContentTemplate>

                    </asp:UpdatePanel>
                  </div>--%>
  <%------------------------------------------file type ODS--%>
                <asp:ObjectDataSource ID="FileTypeODS" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="DropDownFileType" 
                    TypeName="MockERKS.Framework.BLL.FileController">

                </asp:ObjectDataSource>
 <%------------------------------Security Class ODS--%>
                <asp:ObjectDataSource ID="SecurityClassODS" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="DropDownSecurityClassification" 
                    TypeName="MockERKS.Framework.BLL.FileController">

                </asp:ObjectDataSource>




                  
 
 <%-- //Client Management-------------------------------------------------------------------------------------------------%>


                <div class="tab-content" >

                      <div class="tab-pane active" id="Client">

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <h1>Existing Clients</h1>
                     <br />
                            
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="OrganizationODS">
                                <AlternatingItemTemplate>
                                    <tr style="background-color: #FFFFFF; color: #284775;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CausesValidation="false"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_ID") %>' runat="server" ID="Organization_IDLabel" /></td>
                                       
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_Name") %>' runat="server" ID="Organization_NameLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Description_ID") %>' runat="server" ID="Description_IDLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Phone") %>' runat="server" ID="PhoneLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /></td>


                                        <td>
                                            <asp:Label Text='<%# Eval("User_Name") %>' runat="server" ID="User_NameLabel" /></td>
                                        
                                       
                                    </tr>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <tr style="background-color: #999999;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" CausesValidation="false"/>
                                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" CausesValidation="false"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Organization_ID") %>' runat="server" ID="Organization_IDTextBox" /></td>
                                      
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Organization_Name") %>' runat="server" ID="Organization_NameTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Description_ID") %>' runat="server" ID="Description_IDTextBox" /></td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ControlToValidate="PhoneTextBox" ErrorMessage="Enter a valid 10 digit number."
                                                 ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" /></td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="regexEmailValid" 
                                                runat="server" 
                                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ControlToValidate="EmailTextBox" ErrorMessage="Invalid Email Format"
                                              ForeColor="Red"></asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /></td>
                                        <td>
                                            <asp:Label Text='<%# Bind("User_Name") %>' runat="server" ID="User_NameTextBox" /></td>

                                        
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
                                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" CausesValidation="false"/>
                                            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" CausesValidation="false"/>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Bind("Organization_ID") %>' runat="server" ID="Organization_IDTextBox" /></td>
                                      
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                                ErrorMessage="First name required " ControlToValidate="Organization_NameTextBox" SetFocusOnError="True" >
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox Text='<%# Bind("Organization_Name") %>' runat="server" ID="Organization_NameTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Description_ID") %>' runat="server" ID="Description_IDTextBox" /></td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ControlToValidate="PhoneTextBox" ErrorMessage="Enter a valid 10 digit number."
                                                 ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBox" /></td>
                                        <td>
                                             <asp:RegularExpressionValidator ID="regexEmailValid" 
                                                runat="server" 
                                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ControlToValidate="EmailTextBox" ErrorMessage="Invalid Email Format"
                                              ForeColor="Red"></asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /></td>
                                        <td>
                                            <asp:Label Text='<%# Bind("User_Name") %>' runat="server" ID="User_NameTextBox" /></td>


                                    
                                    </tr>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <tr style="background-color: #E0FFFF; color: #333333;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CausesValidation="false" />
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_ID") %>' runat="server" ID="Organization_IDLabel" /></td>
                                       
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_Name") %>' runat="server" ID="Organization_NameLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Description_ID") %>' runat="server" ID="Description_IDLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Phone") %>' runat="server" ID="PhoneLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /></td>


                                        <td>
                                            <asp:Label Text='<%# Eval("User_Name") %>' runat="server" ID="User_NameLabel" /></td>
                                       
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
                                                        <th runat="server">Organization_Name</th>
                                                        <th runat="server">Description_ID</th>
                                                        <th runat="server">Phone</th>
                                                        <th runat="server">Email</th>
                                                        <th runat="server">User_Name</th>
                                                        
                                                    </tr>
                                                    <tr runat="server" id="itemPlaceholder"></tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                                        <td>
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CausesValidation="false" />
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_ID") %>' runat="server" ID="Organization_IDLabel" /></td>
                                       
                                        <td>
                                            <asp:Label Text='<%# Eval("Organization_Name") %>' runat="server" ID="Organization_NameLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Description_ID") %>' runat="server" ID="Description_IDLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Phone") %>' runat="server" ID="PhoneLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /></td>

                                        <td>
                                            <asp:Label Text='<%# Eval("User_Name") %>' runat="server" ID="User_NameLabel" /></td>
                                      
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                           
                           
                           
                           
                        </ContentTemplate>
                        
                    </asp:UpdatePanel>
                    </div>
               
                    <asp:ObjectDataSource ID="OrganizationODS" runat="server"
                         DataObjectTypeName="MockERKS.Framework.Entities.Organization" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="ListAll_Organizations" 
                        TypeName="MockERKS.Framework.BLL.AdminController" UpdateMethod="Client_Update"></asp:ObjectDataSource>

              
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="DescriptionList" 
                        TypeName="MockERKS.Framework.BLL.ClientController"></asp:ObjectDataSource>
                

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
                                                ControlToValidate="PhoneTextBoxE" ErrorMessage="Enter a valid 10 digit number."
                                                 ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="PhoneTextBoxE" />

                                        </td>
                                        <td>
                                              <asp:RegularExpressionValidator ID="regexEmailValid" 
                                                runat="server" 
                                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ControlToValidate="EmailTextBoxE" ErrorMessage="Invalid Email Format"
                                              ForeColor="Red">
                                              </asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBoxE" /></td>
                                     
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
                                                ErrorMessage="First name required " ControlToValidate="IFirst_NameTextBox" SetFocusOnError="True" >
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox Text='<%# Bind("First_Name") %>' runat="server" ID="IFirst_NameTextBox" /></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="Requiredlastname" runat="server" ForeColor="Red"
                                                ErrorMessage="Last name required " ControlToValidate="ILast_NameTextBox" SetFocusOnError="True">
                                            </asp:RequiredFieldValidator>
                                            <asp:TextBox Text='<%# Bind("Last_Name") %>' runat="server" ID="ILast_NameTextBox" /></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="#990000" 
                                                 ErrorMessage="Phone required field" ControlToValidate="IPhoneTextBox" SetFocusOnError="True" >
                                                          </asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ControlToValidate="IPhoneTextBox" ErrorMessage="Enter A 10 Digit Number."
                                                 ValidationExpression="[0-9]{10}" ForeColor="Red"  SetFocusOnError="True"></asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Phone") %>' runat="server" ID="IPhoneTextBox" /></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="#990000" 
                                                 ErrorMessage="Email required field" ControlToValidate="IEmailTextBox" SetFocusOnError="True" >
                                                          </asp:RequiredFieldValidator>
                                            <br />
                                              <asp:RegularExpressionValidator ID="regexEmailValid" 
                                                runat="server" 
                                                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ControlToValidate="IEmailTextBox" ErrorMessage="Invalid Email Format"
                                              ForeColor="Red"  SetFocusOnError="True">
                                              </asp:RegularExpressionValidator>
                                            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="IEmailTextBox" /></td>
                                 
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




    </div>
</asp:Content>

