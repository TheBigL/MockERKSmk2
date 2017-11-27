<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ClientInforForm.aspx.cs" Inherits="AutomatedApprovalSystem_ClientForm" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Client Information</h1>
    
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <!-- User message control for this panel -->
            <uc1:MessageUserControl runat="server" ID="MessageUserControl" />

            <!-- Validation controls on Insert tab panel -->
            <asp:ValidationSummary ID="ContrestValidationSummary" runat="server"
                HeaderText="Please correct the folowing parts of the form brfore submitting:<br />" />
            
            <asp:RequiredFieldValidator ID="RequiredFieldClientName" runat="server" ForeColor="#a94442"
                ErrorMessage="Client Name Required" Display="None" ControlToValidate="ClientName" SetFocusOnError="true">
            </asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldClientPhone" runat="server" ForeColor="#a94442"
                ErrorMessage="Client Phone Number Required" Display="None" ControlToValidate="ClientPhone" SetFocusOnError="true">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionClientPhone" runat="server" Display="None"
                ControlToValidate="ClientPhone" ValidationExpression="^([\+]?[0-9]{1,3}[\s.-][0-9]{1,12})([\s.-]?[0-9]{1,4}?)$"
                SetFocusOnError="true" ForeColor="#a94442" ErrorMessage="Invalid phone number. Phone number should be 10 digit number.">
            </asp:RegularExpressionValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldClientEmail" runat="server" ForeColor="#a94442"
                ErrorMessage="Client Email Required" Display="None" ControlToValidate="ClientEmail" SetFocusOnError="true">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionClientEmail" runat="server" Display="None"
                ControlToValidate="ClientEmail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                SetFocusOnError="true" ForeColor="#a94442" ErrorMessage="Invalid email format. Example: someone@example.com">
            </asp:RegularExpressionValidator>

            <!-- Form -->
            <fieldset class="form-horizontal">
                <asp:Label runat="server" Text="Client ID:" AssociatedControlID="OrgID"></asp:Label>
                <asp:Label ID="OrgID" runat="server"></asp:Label><br />

                <asp:Label runat="server" Text="Client Name:" AssociatedControlID="ClientName"></asp:Label>
                <asp:TextBox ID="ClientName" runat="server"></asp:TextBox><br />

                <asp:Label  runat="server" Text="Description:" AssociatedControlID="ClientDescription"></asp:Label>
                <asp:DropDownList ID="ClientDescription" runat="server"></asp:DropDownList><br />

                <asp:Label  runat="server" Text="Phone:" AssociatedControlID="ClientPhone"></asp:Label>
                <asp:TextBox ID="ClientPhone" runat="server"></asp:TextBox><br />

                <asp:Label  runat="server" Text="Email:" AssociatedControlID="ClientEmail"></asp:Label>
                <asp:TextBox ID="ClientEmail" runat="server"></asp:TextBox><br />

                <asp:Button CssClass="btn" ID="Button1" runat="server" Text="Save" />
                <asp:Button CssClass="btn" ID="Button2" runat="server" OnClick="ResetForm_Click" Text="Reset" />
                <asp:Button CssClass="btn" ID="Button3" runat="server" Text="Cancel" />
                <asp:Button CssClass="btn" ID="Button4" runat="server" Text="Add Client" OnClick="AddClient_Click" />
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListClientDescription" TypeName="MockERKS.Framework.BLL.ClientController"></asp:ObjectDataSource>
            </fieldset>

        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

