<%@ Page Title="New Client" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewClient.aspx.cs" Inherits="Account_NewClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="jumbotron">
        <h1><%: Title %></h1>

           <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

       
      <fieldset class="form-horizaontal">
          <asp:Label ID="Label" runat="server" Text="Name:" AssociatedControlID="Name"></asp:Label>
          <asp:TextBox ID="Name" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
          
          <br />

          <asp:Label ID="Label1" runat="server" Text="Description" AssociatedControlID="Description"></asp:Label>
          <asp:DropDownList ID="Description" runat="server"></asp:DropDownList><br />

          <asp:Label ID="Label2" runat="server" Text="Phone" AssociatedControlID="Phone"></asp:Label>
          <asp:TextBox ID="Phone" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone"
                    CssClass="text-danger" ErrorMessage="A Phone Number is required." />
          <br />

          <asp:Label ID="Label3" runat="server" Text="Email" AssociatedControlID="Email"></asp:Label>
          <asp:TextBox ID="Email" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="An Email is required." />
          <br />
          <br />

          <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
          </fieldset>
        </div>

</asp:Content>

 