<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lookup.aspx.cs" Inherits="AutomatedApprovalSystem_LookupFile" MasterPageFile="~/Site.master" Debug="true" EnableEventValidation="false" %>


<asp:Content ID="Content1" contentplaceholderid="MainContent" runat="server">
    <h2>Look up Organization & File</h2>
    


    <div class="row">
    <ul class="nav nav-tabs">
                <li><a href="#organization" data-toggle="tab">Organizations</a></li>
                <li ><a href="#filelookup" data-toggle="tab">Files</a></li>
                <li><a href="#staff" data-toggle="tab">Officers</a></li>
                <li><a href="#managers" data-toggle="tab">Managers</a></li>
                <li><a href="#pdf" data-toggle="tab">PDF</a></li>
                
                
    </ul>
     
    <div id="organization" class="tab-pane fade" role="tabpanel">
        <asp:GridView ID="OrganizationGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="OrganizationData" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Organization_Name" HeaderText="Organization_Name" SortExpression="Organization_Name" />
                <asp:BoundField DataField="Organization_Description" HeaderText="Organization_Description" SortExpression="Organization_Description" />
                <asp:BoundField DataField="Organization_ID" HeaderText="Organization_ID" SortExpression="Organization_ID" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        

            

        <asp:LinkButton ID="OrganizationLinkReport" runat="server" OnClick="OrganizationLinkReport_Click">Organization Report</asp:LinkButton>

        <asp:LinkButton ID="PDFOrganization" runat="server" OnClick="PDFOrganization_Click" Text="Export Data to PDF"></asp:LinkButton>

    </div>
          

           



    


        <div id="filelookup" class="tab-pane fade" role="tabpanel">

            <asp:GridView ID="FileGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="FilesDataSource" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="fileID" HeaderText="fileID" SortExpression="fileID" />
                    <asp:BoundField DataField="categoryName" HeaderText="categoryName" SortExpression="categoryName" />
                    <asp:BoundField DataField="docTypeDescription" HeaderText="docTypeDescription" SortExpression="docTypeDescription" />
                    <asp:BoundField DataField="securityClassificationTypeName" HeaderText="securityClassificationTypeName" SortExpression="securityClassificationTypeName" />
                    <asp:BoundField DataField="organizationName" HeaderText="organizationName" SortExpression="organizationName" />
                    <asp:BoundField DataField="operationName" HeaderText="operationName" SortExpression="operationName" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:LinkButton ID="ReportLink" runat="server" OnClick="ReportLink_Click">To the File Report</asp:LinkButton>

            <asp:LinkButton ID="PDFFileReportLink" runat="server" OnClick="PDFFileReportLink_Click" Text="Export Data to PDF"></asp:LinkButton>

            </div>
           

        <div id="staff" class="tab-pane fade">
            <asp:GridView ID="StaffGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="OfficerDataSource" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Officer_ID" HeaderText="Officer_ID" SortExpression="Officer_ID" />
                    <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
                    <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

            <asp:LinkButton ID="ToOfficerReport" runat="server" OnClick="ToOfficerReport_Click">To Officer Report Page</asp:LinkButton>

            <asp:LinkButton ID="OfficerPDFLink" runat="server" OnClick="OfficerPDF_Click" Text="Export to PDF"></asp:LinkButton>


        </div>

        <div id="managers" class="tab-pane fade">
            <asp:GridView ID="ManagerGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ManagerDataSource" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="managerID" HeaderText="managerID" SortExpression="managerID" />
                    <asp:BoundField DataField="fullName" HeaderText="fullName" SortExpression="fullName" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

            <asp:LinkButton ID="ManagerReportLink" runat="server" OnClick="ManagerReportLink_Click">To Manager Report Page</asp:LinkButton>

            <asp:LinkButton ID="ManagerPDF" runat="server" OnClick="ManagerPDF_Click" Text="Export Data to PDF"></asp:LinkButton>
        </div>


        <div id="pdf" class="tab-pane fade">




            <asp:GridView ID="PDFGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="PDFDataSource" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="pdfID" HeaderText="pdfID" SortExpression="pdfID" />
                    <asp:BoundField DataField="pdfName" HeaderText="pdfName" SortExpression="pdfName" />
                    <asp:BoundField DataField="pdfType" HeaderText="pdfType" SortExpression="pdfType" />
                    <asp:BoundField DataField="organizationID" HeaderText="organizationID" SortExpression="organizationID" />
                    <asp:BoundField DataField="organizationName" HeaderText="organizationName" SortExpression="organizationName" />
                    <asp:BoundField DataField="ogranizationDescription" HeaderText="ogranizationDescription" SortExpression="ogranizationDescription"></asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

            <asp:LinkButton ID="LinktoPDFReport" runat="server" Text="PDF Report" OnClick="LinktoPDFReport_Click"></asp:LinkButton>


        </div>



     <asp:ObjectDataSource ID="OrganizationData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupRegisteredOrganizations" TypeName="MockERKS.Framework.BLL.StaffController" DataObjectTypeName="MockERKS.Framework.Entities.Organization" UpdateMethod="updateOrganization"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="FilesDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupFiles" TypeName="MockERKS.Framework.BLL.StaffController" DataObjectTypeName="MockERKS.Framework.Entities.Site_File" UpdateMethod="File_Update"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="OfficerDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupOfficers" TypeName="MockERKS.Framework.BLL.StaffController" DataObjectTypeName="MockERKS.Framework.Entities.Officer" UpdateMethod="updateOfficer"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ManagerDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupManager" TypeName="MockERKS.Framework.BLL.StaffController" DataObjectTypeName="MockERKS.Framework.Entities.Manager" UpdateMethod="updateManager"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="PDFDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="lookupPDFs" TypeName="MockERKS.Framework.BLL.StaffController"></asp:ObjectDataSource>

    </div>

     </asp:Content>

