<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FileForm.aspx.cs" Inherits="WebPages_FileForm" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>File Form</h1>

    <fieldset class="form-horizaontal">
        <asp:Label ID="Label" runat="server" Text="File Type:" AssociatedControlID="FileType"></asp:Label>
        <asp:DropDownList ID="FileType" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label1" runat="server" Text="Category:" AssociatedControlID="Category"></asp:Label>
        <asp:DropDownList ID="Category" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label2" runat="server" Text="Security Classification:" AssociatedControlID="SecurityClassification"></asp:Label>
        <asp:DropDownList ID="SecurityClassification" runat="server"></asp:DropDownList><br />
        <br />
        <br />

        <asp:Label ID="Label3" runat="server" Text="File ID:" AssociatedControlID="FileID"></asp:Label>
        <asp:Label ID="FileID" runat="server"></asp:Label><br />

        <asp:Label ID="Label4" runat="server" Text="Operation Name:" AssociatedControlID="OperationName"></asp:Label>
        <asp:TextBox ID="OperationName" runat="server"></asp:TextBox><br />

        <asp:Label ID="Label5" runat="server" Text="Operation ID:" AssociatedControlID="OperationID"></asp:Label>
        <asp:TextBox ID="OperationID" runat="server"></asp:TextBox><br />
        <br />
        <br />

        <asp:Label ID="Label6" runat="server" Text="Site Location"></asp:Label><br />
        
        <br />
        <br />
        
        <asp:Label ID="Label7" runat="server" Text="Legal Land Description (LLD) ATS"></asp:Label><br />

        <br />
        <br />

        <asp:Label ID="Label8" runat="server" Text="Legal Land Description (LLD) PBL"></asp:Label><br />

        <br />
        <br />

        <asp:Label ID="Label9" runat="server" Text="LINC:" AssociatedControlID="LINC"></asp:Label>
        <asp:TextBox ID="LINC" runat="server"></asp:TextBox><br />

        <asp:Label ID="Label10" runat="server" Text="File Status:" AssociatedControlID="FileStatus"></asp:Label>
        <asp:DropDownList ID="FileStatus" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label11" runat="server" Text="Closed Date:" AssociatedControlID="ClosedDate"></asp:Label>
        <asp:Calendar ID="ClosedDate" runat="server"></asp:Calendar><br />
        <br />
        <br />

        <asp:Button CssClass="btn" ID="SaveForm" runat="server" Text="Save"></asp:Button>
        <asp:Button CssClass="btn" ID="ResetForm" runat="server" Text="Reset"></asp:Button>
        <asp:Button CssClass="btn" ID="CancleActivity" runat="server" Text="Cancel"></asp:Button>
    </fieldset>
</asp:Content>

