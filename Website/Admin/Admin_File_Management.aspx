<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Admin_File_Management.aspx.cs" Inherits="Admin_Admin_File_Management" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

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
                <li ><a href="#Client" data-toggle="tab">Client Management</a></li>
                <li ><a href="#Employee" data-toggle="tab">Employee Management</a></li>
            </ul>

            <div class="tab-content">




                 <div class="tab-pane fade in active" id="FileLookup">
                     <asp:UpdatePanel ID="UpdatePanelUser" runat="server">
                         <ContentTemplate>
                     
                     <asp:Button ID="ButtonSCD" runat="server" Text="Search SCD Files" />&nbsp;
                     <asp:Button ID="ButtonCSU" runat="server" Text="Search CSU Files" />&nbsp;
                     <asp:Button ID="ButtonPST" runat="server" Text="Search PST Files" />&nbsp;
                     
                         </ContentTemplate>
                         </asp:UpdatePanel>
                     </div>
                <br />


                 <div class="tab-pane fade in active" id="Client">
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                     <asp:Button ID="SearchClients" runat="server" Text="Search All Clients" />
                     <br />
                     <br />

                     <asp:Button ID="SeacrhClientByID" runat="server" Text="Search Client By ID" />
                     </ContentTemplate>
                    </asp:UpdatePanel>
                 </div>


                  <div class="tab-pane fade in active" id="Employee">
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

