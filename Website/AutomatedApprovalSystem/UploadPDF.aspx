<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UploadPDF.aspx.cs" Inherits="AutomatedApprovalSystem_UploadPDF" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <br />
    <br />
    <asp:Button CssClass="btn" ID="Back" runat="server" Text="Back to File Page" OnClick="Back_Click" />
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
    <%--Caption="PDF Files" --%>
    <asp:GridView ID="Gridview1" runat="server" CaptionAlign="Top" HorizontalAlign="Justify" DataKeyNames="id" OnSelectedIndexChanged="Gridview1_SelectedIndexChanged" ToolTip="PDF File Download Tool" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" AutoGenerateColumns="false">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Download" ControlStyle-ForeColor="Blue" />
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="GV_FileID" Width="100px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("PDF_Name") %>' runat="server" ID="GV_FileID" Width="200px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Type">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("PDF_Type") %>' runat="server" ID="GV_FileID" Width="200px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Data">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("PDF_Data") %>' runat="server" ID="GV_FileID" Width="200px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Organization ID">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Organization_ID") %>' runat="server" ID="GV_FileID" Width="100px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE"></RowStyle>

        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#848384"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#EAEAD3"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#575357"></SortedDescendingHeaderStyle>
        <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />  
        <EditRowStyle BackColor="#7C6F57" />  
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>

    


</asp:Content>

