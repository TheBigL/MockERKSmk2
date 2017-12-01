<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Admin_File_Management.aspx.cs" Inherits="Admin_Admin_File_Management" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

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
<%--                                <asp:Button ID="seacrchAllFiles" runat="server" Text="Search All Files" OnClick="Button1_Click" />--%>
                                <br />
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Search By Type"></asp:Label><br />
                                <asp:DropDownList ID="FileTypeDDL" runat="server"
                                    DataSourceID="FileTypeODS"
                                    DataTextField="Type_Description"
                                    DataValueField="Type_ID">
                                </asp:DropDownList>
                                <asp:Button ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" />

                                <br />
                                <br />

                            </div>

                            <div class="col-sm-10">
                                <asp:GridView ID="GridView1" runat="server" DataSourceID="FileTypeGridview" AllowPaging="True"></asp:GridView>
                            </div>



                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:ObjectDataSource ID="FileTypeODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="FileTypeDescriptionList" TypeName="MockERKS.Framework.BLL.AdminController" UpdateMethod="UpdateFile">
                        <UpdateParameters>
                            <asp:Parameter Name="file" Type="Object"></asp:Parameter>
                            <asp:Parameter Name="rDetails" Type="Object"></asp:Parameter>
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="FileTypeGridview" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFiletype" TypeName="MockERKS.Framework.BLL.AdminController" UpdateMethod="UpdateFile">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="FileTypeDDL" PropertyName="SelectedValue" Name="typeId" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="file" Type="Object"></asp:Parameter>
                            <asp:Parameter Name="rDetails" Type="Object"></asp:Parameter>
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </div>
                <br />

                <%-- //Client Management--%>
                <div class="tab-pane" id="Client">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="SearchClients" runat="server" Text="Search All Clients" />
                            <br />
                            <br />

                            <asp:Button ID="SeacrhClientByID" runat="server" Text="Search Client By ID" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%-- //Employee Management--%>
                <div class="tab-pane" id="Employee">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>


                            <asp:Button ID="SearchAllEmployees" runat="server" Text="Search All Employees" />
                            <br />
                            <br />
                            <asp:Button ID="SearchEmployeeByID" runat="server" Text="Search Employee By ID" />


                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>

        </div>

    </div>




</asp:Content>

