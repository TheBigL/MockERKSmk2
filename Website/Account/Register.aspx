<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4><span style="background-color: #FFFFFF">Create a new account.</span></h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <%--This is the Client Registration Form
        Author : Sayed Quadri--%>

        <div class="form-group">
            <asp:Label ID="Label" runat="server" AssociatedControlID="OrganizationName" CssClass="col-md-2 control-label" style="background-color: #FFFFFF">Client/Organization Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="OrganizationName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="OrganizationName"
                    CssClass="text-danger" ErrorMessage="The user name field is required." style="background-color: #FFFFFF" />
            </div>
        </div>



        <div class="form-group">
            <asp:Label ID="Label1" runat="server" AssociatedControlID="Description" CssClass="col-md-2 control-label" style="background-color: #FFFFFF">Description</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="Description" runat="server" CssClass="form-control" DataSourceID="ObjectDataSource1" DataTextField="Description" DataValueField="Description_ID">
                </asp:DropDownList><br style="background-color: #FFFFFF" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" AssociatedControlID="Phone" CssClass="col-md-2 control-label" style="background-color: #FFFFFF">Phone</asp:Label>

            <div class="col-md-10">
                <asp:TextBox ID="Phone" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone"
                    CssClass="text-danger" ErrorMessage="A Phone Number is required." style="background-color: #FFFFFF"></asp:RequiredFieldValidator>
            </div>
        </div>


        <div class="form-group">

            <asp:Label ID="Label3" runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label" style="background-color: #FFFFFF">Email</asp:Label>

            <div class="col-md-10">
                <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="An Email is required." style="background-color: #FFFFFF"></asp:RequiredFieldValidator>
            </div>
        </div>


        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label" style="background-color: #FFFFFF">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="The user name field is required." style="background-color: #FFFFFF" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label" style="background-color: #FFFFFF">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." style="background-color: #FFFFFF" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label" style="background-color: #FFFFFF">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." style="background-color: #FFFFFF" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." style="background-color: #FFFFFF" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" BorderColor="#33CC33" />
            </div>
        </div>

        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="DescriptionList" TypeName="MockERKS.Framework.BLL.ClientController"></asp:ObjectDataSource>
       
    </div>
   
</asp:Content>

