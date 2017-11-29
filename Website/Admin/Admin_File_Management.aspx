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
                <li class="active"><a href="#user" data-toggle="tab">User</a></li>
                <li ><a href="#role" data-toggle="tab">Role</a></li>
            </ul>

            <div class="tab-content">
                 <div class="tab-pane fade in active" id="File Lookup">
                     </div>
                 <div class="tab-pane fade in active" id="Client">
                     </div>
                      <div class="tab-pane fade in active" id="Employee">
                          </div>
                
                </div>




            </div>

    </div>

     
     

</asp:Content>

