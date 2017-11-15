<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StaffInforForm.aspx.cs" Inherits="AutomatedApprovalSystem_StaffForm" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Staff Information</h1>

    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <!-- User message control for this panel -->
            <uc1:MessageUserControl runat="server" ID="MessageUserControl" />

            <!-- Validation controls on Insert tab panel -->
            <asp:ValidationSummary ID="ContrestValidationSummary" runat="server"
                HeaderText="Please correct the folowing parts of the form brfore submitting:<br />" />
            
            <asp:RequiredFieldValidator ID="RequiredFieldStaffName" runat="server" ForeColor="#a94442"
                ErrorMessage="Staff Name Required" Display="None" ControlToValidate="StaffName" SetFocusOnError="true">
            </asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldStaffPhone" runat="server" ForeColor="#a94442"
                ErrorMessage="Staff Phone Number Required" Display="None" ControlToValidate="StaffPhone" SetFocusOnError="true">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionStaffPhone" runat="server" Display="None"
                ControlToValidate="StaffPhone" ValidationExpression="^([\+]?[0-9]{1,3}[\s.-][0-9]{1,12})([\s.-]?[0-9]{1,4}?)$"
                SetFocusOnError="true" ForeColor="#a94442" ErrorMessage="Invalid phone number. Phone number should be 10 digit number.">
            </asp:RegularExpressionValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldStaffEmail" runat="server" ForeColor="#a94442"
                ErrorMessage="Staff Email Required" Display="None" ControlToValidate="StaffEmail" SetFocusOnError="true">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionStaffEmail" runat="server" Display="None"
                ControlToValidate="StaffEmail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                SetFocusOnError="true" ForeColor="#a94442" ErrorMessage="Invalid email format. Example: someone@example.com">
            </asp:RegularExpressionValidator>

            <!-- Form -->
            <fieldset class="form-horizontal">
                <asp:Label ID="Label" runat="server" Text="Staff ID:" AssociatedControlID="StaffID"></asp:Label>
                <asp:Label ID="StaffID" runat="server"></asp:Label><br />

                <asp:Label ID="Label1" runat="server" Text="Staff Name:" AssociatedControlID="StaffName"></asp:Label>
                <asp:TextBox ID="StaffName" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label3" runat="server" Text="Phone:" AssociatedControlID="StaffPhone"></asp:Label>
                <asp:TextBox ID="StaffPhone" runat="server"></asp:TextBox><br />

                <asp:Label ID="Label4" runat="server" Text="Email:" AssociatedControlID="StaffEmail"></asp:Label>
                <asp:TextBox ID="StaffEmail" runat="server"></asp:TextBox><br />

                <asp:Button CssClass="btn" ID="SaveForm" runat="server" Text="Save" />
                <asp:Button CssClass="btn" ID="ResetForm" runat="server" OnClick="ResetForm_Click" Text="Reset" />
                <asp:Button CssClass="btn" ID="CancelActivity" runat="server" Text="Cancel" />
                <asp:Button CssClass="btn" ID="AddStaff" runat="server" Text="Add Staff Member" />
            </fieldset>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

