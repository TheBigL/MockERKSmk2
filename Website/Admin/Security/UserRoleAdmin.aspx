<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserRoleAdmin.aspx.cs" Inherits="Admin_Security_UserRoleAdmin" %>
<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Admin Controls</h1>
    <asp:UpdatePanel ID="UpdatePanelMessage" runat="server">
        <ContentTemplate>
            <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="row">
        <ul class="nav nav-tabs">
                <li ><a href="#FileLookUp" data-toggle="tab">File Look Up</a></li>
                <li class="active"><a href="#user" data-toggle="tab">Users</a></li>
                <li ><a href="#role" data-toggle="tab">Role</a></li>
            </ul>
       
    </div>
</asp:Content>

