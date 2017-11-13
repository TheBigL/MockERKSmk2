<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FileForm.aspx.cs" Inherits="WebPages_FileForm" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>File Form</h1>

    <fieldset class="form-horizontal">
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

        <!-- <asp:Label ID="Label6" runat="server" Text="Site Location"></asp:Label><br /> -->
        <h5>Site Location</h5>

        <asp:Label ID="Label12" runat="server" Text="Location:" AssociatedControlID="Location"></asp:Label>
        <asp:DropDownList ID="Location" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label13" runat="server" Text="Address:" AssociatedControlID="Address"></asp:Label>
        <asp:TextBox ID="Address" runat="server"></asp:TextBox><br />
        <br />
        <br />
        
        <!-- <asp:Label ID="Label7" runat="server" Text="Legal Land Description (LLD) ATS"></asp:Label><br /> -->
        <h5>Legal Land Description (LLD) ATS</h5>

        <asp:Label ID="Label14" runat="server" Text="Meridian #:" AssociatedControlID="Meridian"></asp:Label>
        <asp:DropDownList ID="Meridian" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label15" runat="server" Text="Range #:" AssociatedControlID="Range"></asp:Label>
        <asp:DropDownList ID="Range" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label16" runat="server" Text="Township #:" AssociatedControlID="Township"></asp:Label>
        <asp:DropDownList ID="Township" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label17" runat="server" Text="Section #:" AssociatedControlID="Section"></asp:Label>
        <asp:DropDownList ID="Section" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label18" runat="server" Text="Quarter Section #:" AssociatedControlID="QuarterSection"></asp:Label>
        <asp:DropDownList ID="QuarterSection" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label19" runat="server" Text="LSD:" AssociatedControlID="LSD"></asp:Label>
        <asp:DropDownList ID="LSD" runat="server"></asp:DropDownList><br />
        <br />
        <br />

        <!-- <asp:Label ID="Label8" runat="server" Text="Legal Land Description (LLD) PBL"></asp:Label><br /> -->
        <h5>Legal Land Description (LLD) PBL</h5>

        <asp:Label ID="Label20" runat="server" Text="Plan #:" AssociatedControlID="Plan"></asp:Label>
        <asp:TextBox ID="Plan" runat="server"></asp:TextBox><br />

        <asp:Label ID="Label21" runat="server" Text="Block #:" AssociatedControlID="Block"></asp:Label>
        <asp:TextBox ID="Block" runat="server"></asp:TextBox><br />

        <asp:Label ID="Label22" runat="server" Text="Lot #:" AssociatedControlID="Lot"></asp:Label>
        <asp:TextBox ID="Lot" runat="server"></asp:TextBox><br />
        <br />
        <br />

        <asp:Label ID="Label9" runat="server" Text="LINC:" AssociatedControlID="LINC"></asp:Label>
        <asp:TextBox ID="LINC" runat="server"></asp:TextBox><br />

        <asp:Label ID="Label10" runat="server" Text="File Status:" AssociatedControlID="FileStatus"></asp:Label>
        <asp:DropDownList ID="FileStatus" runat="server"></asp:DropDownList><br />

        <asp:Label ID="Label11" runat="server" Text="Closed Date:" AssociatedControlID="ClosedDate"></asp:Label>
        <asp:Calendar ID="ClosedDate" runat="server"></asp:Calendar><br />
    </fieldset>
</asp:Content>

