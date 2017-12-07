<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UploadPDF.aspx.cs" Inherits="AutomatedApprovalSystem_UploadPDF" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <br />
    <br />
    <asp:Button CssClass="btn" ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
    <br />
    <br />

    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>Select File</asp:TableCell>

            <asp:TableCell>
                <asp:FileUpload ID="FileUpload" runat="server" ToolTip="Select Only PDF File" />
            </asp:TableCell>

            <asp:TableCell>
                <asp:Button ID="Upload" runat="server" Text="Upload" OnClick="Upload_Click" />
            </asp:TableCell>

            <asp:TableCell>
                <asp:Button ID="View" runat="server" Text="View Files" OnClick="View_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <p>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </p>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:GridView ID="Gridview1" runat="server" Caption="PDF Files" CaptionAlign="Top" HorizontalAlign="Justify" DataKeyNames="id" OnSelectedIndexChanged="Gridview1_SelectedIndexChanged" ToolTip="PDF File Download Tool" CellPadding="4" ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Download" ControlStyle-ForeColor="Blue" />
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />  
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />  
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />  
        <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />  
        <EditRowStyle BackColor="#7C6F57" />  
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>


</asp:Content>

