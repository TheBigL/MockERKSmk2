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
                 <li><a href="#Maintain" data-toggle="tab">File Maintain</a></li>
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
                          
                                <asp:Button ID="Button1" runat="server" OnClick="Search_Click" Text="Search All Files"  CausesValidation="False" /> <br />
                                <br />
                                <br />
                                <br />
                                
                                
                                
                            

                            
                                 <asp:GridView ID="FileList" runat="server"
                                     AutoGenerateColumns="False" 
                                     OnSelectedIndexChanged="FileList_SelectedIndexChanged">
                                     <Columns>
                                         <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                         <asp:TemplateField HeaderText="File ID">
                                             <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label Id="FileID" runat="server" Text='<%# Eval("File_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Type ID">
                                             <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label Id="TypeID" runat="server" Text='<%# Eval("Type_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Organization ID">
                                             <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label Id="OrganizationID" runat="server" Text='<%# Eval("Organization_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                         <asp:TemplateField HeaderText="LINC">
                                             <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label Id="Linc" runat="server" Text='<%# Eval("LINC_Number") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Security Classification ID">
                                             <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label Id="SecurityClassificationID" CssClass="" runat="server" Text='<%# Eval("Security_Classification_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                         <asp:TemplateField HeaderText="Operation ID">
                                             <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label Id="OperationID" runat="server" Text='<%# Eval("Operation_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="File Status">
                                             <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label Id="FileStatus" runat="server" Text='<%# Eval("File_Status") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Closed Date" ItemStyle-Width="200px">
                                            <ItemTemplate>
                                                <asp:Label Id="closedDate" runat="server" Text='<%# Eval("Closed_Date") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                      </Columns>
                                </asp:GridView>
                                <asp:Label ID="Label1" runat="server" Text="Selected File:"></asp:Label>
                                <asp:Label ID="SelectedTitle" runat="server"></asp:Label>
                                <button type="button" class="btn" onclick="nextButton('#Maintain')">Next</button><br />
                            </div>
                           

                           <br />
                           
                            
                        </ContentTemplate>

                    </asp:UpdatePanel>
                  </div>
                   
                  
                <br />

<%------------------Maintain Tab--------------------------------------------------------------------------------------------------------------------------------------%>
              
                
                  <div class="tab-pane" id="Maintain">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <uc1:MessageUserControl runat="server" ID="MessageUserControl2" />
                            <asp:ValidationSummary ID="ContrestValidationSummary" runat="server" BackColor="#ff99cc"
                                HeaderText="Please correct the following parts of the form before submitting:<br/>" />
                             
                             <fieldset class="form-horizontal">
                                 <asp:Label ID="Label" runat="server" Text="File ID:"
                                     AssociatedControlID="mFileID"></asp:Label>
                                 <asp:Label ID="mFileID" runat="server" ></asp:Label><br />
                                 <%--TypeDDL--%>
                                 <asp:Label ID="Label4" runat="server" Text="Type ID:"
                                     AssociatedControlID="mTypeID"></asp:Label>
                                 <asp:DropDownList ID="mTypeID"
                                     runat="server" DataSourceID="FileTypeODS"
                                     DataTextField="typeDescription"
                                     DataValueField="typeID">
                                 </asp:DropDownList><br />

                                 <asp:Label ID="Label6" runat="server" Text="Organization ID:"
                                     AssociatedControlID="mOrganizationID"></asp:Label>
                                 <asp:Label ID="mOrganizationID" runat="server" ></asp:Label><br />
                                 <asp:Label ID="Label8" runat="server" Text="Operation ID:"
                                     AssociatedControlID="mOperationID"></asp:Label>
                                 <asp:Label ID="mOperationID" runat="server" ></asp:Label><br />

                                 <asp:Label ID="Label5" runat="server" Text="LINC Number:"
                                     AssociatedControlID="mLINCNumber"></asp:Label>
                                 <asp:Label ID="mLINCNumber" runat="server" ></asp:Label><br />
                                 <%--securityDDL--%>
                                 <asp:Label ID="Label7" runat="server" Text="Security ID:"
                                     AssociatedControlID="mSecurityID"></asp:Label>
                                 <asp:DropDownList ID="mSecurityID"
                                     runat="server"
                                     DataSourceID="SecurityClassODS"
                                     DataTextField="securityClassificationName"
                                     DataValueField="securityClassificationID">
                                 </asp:DropDownList><br />
                                 <%--FileStatus--%>
                                  <asp:Label ID="Label9" runat="server" Text="File Status:"
                                     AssociatedControlID="mFileStatus"></asp:Label>
                                 <asp:DropDownList ID="mFileStatus" runat="server">
                                     <asp:ListItem>Open</asp:ListItem>
                                     <asp:ListItem>Close</asp:ListItem>
                                 </asp:DropDownList><br />

                                  <asp:Label ID="Label10" runat="server" Text="Closed Date:"
                                     AssociatedControlID="mClosedDate"></asp:Label>
                                 <asp:Label ID="mClosedDate" runat="server" ></asp:Label><br />

                                 </fieldset>
                                 

                             <br/>
                               
                                <asp:Button cssclass="btn btn-success" ID="AddAlbum" runat="server" OnClick="AddFile_Click" Text="Add"></asp:Button>
                                <asp:Button cssclass="btn btn-info" ID="UpdateAlbum" runat="server" OnClick="UpdateFile_Click" Text="Update"></asp:Button>
                                <asp:Button cssclass="btn btn-danger" ID="DeleteAlbum" runat="server" OnClick="DeleteFile_Click" Text="Delete" CausesValidation="false"></asp:Button>
                                <asp:Button cssclass="btn" ID="Clear" runat="server" OnClick="Clear_Click" Text="Clear" CausesValidation="false"></asp:Button>
                                <button type="button"  class="btn" onclick="nextButton('#FileLookup')" >Back</button><br />
                            <br/>


                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
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

