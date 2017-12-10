<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FileForm.aspx.cs" Inherits="WebPages_FileForm" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <br />
    <br />
    <asp:Button CssClass="btn" ID="Back" runat="server" Text="Back to File Page" OnClick="CancelActivity_Click" CausesValidation="false" />
    <br />
    <br />

    <h1>File Form</h1>

    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <!-- User message control for this panel -->
            <uc1:MessageUserControl runat="server" ID="MessageUserControl" />

            <!-- Validation controls on Insert tab panel -->
            <asp:ValidationSummary ID="ContrestValidationSummary" runat="server"
                HeaderText="Please correct the folowing parts of the form before submitting:<br />" />
            <asp:RequiredFieldValidator ID="RequiredPlanNumber" runat="server" ErrorMessage="Plan Number is Required."
                ControlToValidate="Plan" SetFocusOnError="true" Display="None">
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredOperationName" runat="server" ErrorMessage="Operation Name is Required."
                ControlToValidate="OperationName" SetFocusOnError="true" Display="None">
            </asp:RequiredFieldValidator>
            <asp:CustomValidator ID="Custom" CssClass="errorTop" OnServerValidate="CheckBoxValidation"
                runat="server" ErrorMessage="You must check this box to proceed">
            </asp:CustomValidator>
            <%--<asp:RegularExpressionValidator ID="RegularExpressionPlanNumber" runat="server" Display="None"
                ControlToValidate="Plan" ValidationExpression="^[A-Z\d]{7}$"
                SetFocusOnError="true" ForeColor="#a94442" ErrorMessage="Invalid Plan Number. Plan number can be alpha numeric (2477KS) or numeric (9624282) - maximum 7 digits, no spaces.">
            </asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionBlockNumber" runat="server" Display="None"
                ControlToValidate="Block" ValidationExpression="^[A-Z\d]{4}$"
                SetFocusOnError="true" ForeColor="#a94442" ErrorMessage="Invalid Block Number. Block number can be alpha (U), numeric(3), or alpha numberic (17A) - maximum 4 characters, no spaces.">
            </asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionLotNumber" runat="server" Display="None"
                ControlToValidate="Lot" ValidationExpression="^[A-Z\d]{6}$"
                SetFocusOnError="true" ForeColor="#a94442" ErrorMessage="Invalid Lot Number. Lot number can be alpha (X), numeric (7), or alpha numeric (21B) - maximum 6 characters, no spaces.">
            </asp:RegularExpressionValidator>--%>
            <%--<asp:RegularExpressionValidator ID="RegularExpressionLINC" runat="server" Display="None"
                ControlToValidate="LINC" ValidationExpression="^\d{10}$"
                SetFocusOnError="true" ForeColor="#a94442" ErrorMessage="Invalid LINC. LINC is 10 digit number.">
            </asp:RegularExpressionValidator>--%>


            <!-- Form -->
            <fieldset class="form-horizontal">
                <asp:Label ID="Label" runat="server" Text="File Type:" AssociatedControlID="FileType"></asp:Label>
                <asp:DropDownList ID="FileType" runat="server" DataSourceID="FileTypeODS" DataTextField="typeDescription" DataValueField="typeID"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="FileTypeODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownFileType" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>
                <br />

                <asp:Label ID="Label1" runat="server" Text="Category:" AssociatedControlID="Category"></asp:Label>
                <asp:DropDownList ID="Category" runat="server" DataSourceID="CategoryListODS" DataTextField="categoryName" DataValueField="categoryID"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="CategoryListODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownCategory" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>
                <br />

                <asp:Label ID="Label2" runat="server" Text="Security Classification:" AssociatedControlID="SecurityClassification"></asp:Label>
                <asp:DropDownList ID="SecurityClassification" runat="server" DataSourceID="SecurityClassificationODS" DataTextField="securityClassificationName" DataValueField="securityClassificationID"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="SecurityClassificationODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownSecurityClassification" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>
                <br />
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

                <%--<asp:DropDownList ID="Location" runat="server" DataSourceID="LocationODS" DataTextField="location" DataValueField="locationCode"></asp:DropDownList>--%>
                <%--<asp:ObjectDataSource runat="server" ID="LocationODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownLocation" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>--%>
                <asp:Label ID="Label12" runat="server" Text="Location:" AssociatedControlID="Location"></asp:Label>
                <asp:DropDownList ID="Location" runat="server">
                    <asp:ListItem Text="<None>" Value="None"></asp:ListItem>
                    <asp:ListItem Text="Edmonton" Value="Edmonton"></asp:ListItem>
                    <asp:ListItem Text="Swan Hill" Value="Swan Hill"></asp:ListItem>
                    <asp:ListItem Text="Fort Saskatchewan" Value="Fort Saskatchewan"></asp:ListItem>
                    <asp:ListItem Text="Spruce Grove" Value="Spruce Grove"></asp:ListItem>
                    <asp:ListItem Text="Slave Lake" Value="Slave Lake"></asp:ListItem>
                    <asp:ListItem Text="Rocky Mountain House" Value="Rocky Mountain House"></asp:ListItem>
                    <asp:ListItem Text="Camorse" Value="Camorse"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                </asp:DropDownList>
                <br />

                <asp:Label ID="Label13" runat="server" Text="Address:" AssociatedControlID="Address"></asp:Label>
                <asp:TextBox ID="Address" runat="server"></asp:TextBox><br />
                <br />
                <br />
        
                <!-- <asp:Label ID="Label7" runat="server" Text="Legal Land Description (LLD) ATS"></asp:Label><br /> -->
                <h5>Legal Land Description (LLD) ATS</h5>

                <asp:Label ID="Label14" runat="server" Text="Meridian #:" AssociatedControlID="Meridian"></asp:Label>
                <asp:DropDownList ID="Meridian" runat="server" DataSourceID="MeridianODS" DataTextField="meridian" DataValueField="ATSID"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="MeridianODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownMeridian" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>
                <br />

                <asp:Label ID="Label15" runat="server" Text="Range #:" AssociatedControlID="Range"></asp:Label>
                <asp:DropDownList ID="Range" runat="server" DataSourceID="RangeODS" DataTextField="range" DataValueField="ATSID"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="RangeODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownRange" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>
                <br />

                <asp:Label ID="Label16" runat="server" Text="Township #:" AssociatedControlID="Township"></asp:Label>
                <asp:DropDownList ID="Township" runat="server" DataSourceID="TownshipODS" DataTextField="township" DataValueField="ATSID"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="TownshipODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownTownship" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>
                <br />

                <asp:Label ID="Label17" runat="server" Text="Section #:" AssociatedControlID="Section"></asp:Label>
                <asp:DropDownList ID="Section" runat="server" DataSourceID="SectionODS" DataTextField="section" DataValueField="ATSID"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="SectionODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownSection" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>
                <br />

                <%--<asp:Label ID="Label18" runat="server" Text="Quarter Section #:" AssociatedControlID="QuarterSection"></asp:Label>--%>
                <%--<asp:DropDownList ID="QuarterSection" runat="server" DataSourceID="QuarterSectionODS" DataTextField="quarterSection" DataValueField="ATSID"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="QuarterSectionODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownQuarterSection" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>--%>
                <asp:Label ID="QuarterS" runat="server" Text="Quarter Section #:" AssociatedControlID="QuarterSection"></asp:Label>
                <asp:DropDownList ID="QuarterSection" runat="server">
                    <asp:ListItem Value="None"><None></asp:ListItem>
                    <asp:ListItem Value="NW">NW</asp:ListItem>
                    <asp:ListItem Value="NE">NE</asp:ListItem>
                    <asp:ListItem Value="SW">SW</asp:ListItem>
                    <asp:ListItem Value="SE">SE</asp:ListItem>
                </asp:DropDownList>
                <br />

                <asp:Label ID="Label19" runat="server" Text="LSD:" AssociatedControlID="LSD"></asp:Label>
                <asp:DropDownList ID="LSD" runat="server" DataSourceID="LsdODS" DataTextField="lsd" DataValueField="ATSID"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="LsdODS" OldValuesParameterFormatString="original_{0}" SelectMethod="DropDownLSD" TypeName="MockERKS.Framework.BLL.FileController"></asp:ObjectDataSource>
                <br />
                <br />
                <br />

                <!-- <asp:Label ID="Label8" runat="server" Text="Legal Land Description (LLD) PBL"></asp:Label><br /> -->
                <h5>Legal Land Description (LLD) PBL</h5>

                <asp:Label ID="Label20" runat="server" Text="Plan #:" AssociatedControlID="Plan"></asp:Label>
                <asp:TextBox ID="Plan" runat="server"> </asp:TextBox><br />

                <asp:Label ID="Label21" runat="server" Text="Block #:" AssociatedControlID="Block"></asp:Label>
                <asp:TextBox ID="Block" runat="server"> </asp:TextBox><br />

                <asp:Label ID="Label22" runat="server" Text="Lot #:" AssociatedControlID="Lot"></asp:Label>
                <asp:TextBox ID="Lot" runat="server"> </asp:TextBox><br />
                <br />
                <br />

                <asp:Label ID="Label9" runat="server" Text="LINC:" AssociatedControlID="LINC"></asp:Label>
                <asp:TextBox ID="LINC" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label10" runat="server" Text="File Status:" AssociatedControlID="FileStatus"></asp:Label>
                <asp:DropDownList ID="FileStatus" runat="server">
                    <asp:ListItem Text="Open" Value="Closed"></asp:ListItem>
                    <asp:ListItem Text="Close" Value="Open"></asp:ListItem>
                </asp:DropDownList>
                <br />

                <asp:Label ID="Label11" runat="server" Text="Closed Date:" AssociatedControlID="ClosedDate"></asp:Label>
                <asp:Calendar ID="ClosedDate" runat="server"></asp:Calendar><br />
                <br />
                <br />

                <asp:CheckBox ID="Check" runat="server" Text="I hereby certify that the information above is true and accurate" />
                <br />
                <br />

                <asp:Button CssClass="btn" ID="SaveForm" runat="server" Text="Save" OnClick="AddFile_Click" />
                <asp:Button CssClass="btn" ID="ResetForm" runat="server" Text="Reset" OnClick="ResetForm_Click" CausesValidation="false" />
                <%--<button class="btn" id="cancel" onclick="window.history.back()">Cancel</button>--%>
                <%--<asp:Button CssClass="btn" ID="Update" runat="server" Text="Update" OnClick="Update_Click" />--%>
                <asp:Button CssClass="btn" ID="CancelActivity" runat="server" Text="Cancel" OnClick="CancelActivity_Click" CausesValidation="false" />
                <%--<asp:Button ID="AddFile" runat="server" CssClass="btn" Text="Add File" OnClick="AddFile_Click" />--%>


            </fieldset>
        </ContentTemplate>
        
    </asp:UpdatePanel>
    
</asp:Content>

