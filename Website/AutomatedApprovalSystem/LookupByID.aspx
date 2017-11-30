<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupByID.aspx.cs" Inherits="AutomatedApprovalSystem_LookupByID" MasterPageFile="~/Site.master" %>

<asp:content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <div id="row">
        <h2>Look up By ID</h2>

        <ul class="nav nav-tabs">
            <li ><a href="#Organizations" data-toggle="tab">Organizations</a></li>
            <li ><a href="#File" data-toggle="tab">Files</a></li>
            <li ><a href="#Officers" data-toggle="tab">Officers</a></li>
        </ul>


        <div id="Organizations" class="tab-pane fade">

        </div>

        <div id="Files" class="tab-pane fade">

            <asp:DropDownList ID="FilesDropdown" runat="server">
            </asp:DropDownList>

        </div>

        <div id="Officers" class="tab-pane fade">

            <asp:DropDownList ID="OfficersDropdown" runat="server">
            </asp:DropDownList>

        </div>



    </div>
</asp:content>
