<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>Mock ERKS Prototype </h2>
      
        <div style="margin-left:auto;margin-right:auto;margin-top:auto;margin-bottom:auto;">
            <a href="Account/Login.aspx" class="btn btn-primary btn-lg">Log In &raquo;</a>
            <a href="Account/Register.aspx" class="btn btn-primary btn-lg">New Client &raquo;</a>
        </div>
       
    </div>

    <div class="jumbotron">
        <div style="color:cadetblue;">
            <h3>Introduction</h3>
        </div>

        <div style="color:cadetblue;">
            <asp:Image ID="img" runat="server" ImageAlign="Right" ImageUrl="Images/Alberta_Government.jpg" />
            <p>Alberta Environmental Parks (AEP) is a ministry of Government of Alberta. Their vision is to offer a healthy and clean province for citizens to enjoy a sustainable quality of life and other recreational activities. The project requested by AEP is for their Electronic Record Keeping System (ERKS) to have a portal that can automatically upload files to ERKS and to the Environmental Site Assessment Repository (ESAR).</p>
            <br />
            <p>Currently, the ERKS has a manual approval process for the file: the administrators or an IT specialist would manually have to review and possibly request the client to alter or add to the information submitted. This process would take hours to perform. Also, ERKS is supposed to automatically upload files that fall under the ‘unprotected’ security classification to ESAR for public access. Otherwise, the submitted file will stay inside ERKS for record keeping purposes.</p>
            <br />
            <asp:Image ID="img1" runat="server" ImageAlign="Left" ImageUrl="Images/img1.png" />
            <p>So we decided to provide an external submission portal that automatically files reports to the file repository system (ERKS) while setting a security classification. The system will streamline user input into ERKS by creating a web form submission based on the requirements of submission for ERKS and adding the status of approved or un-approved for upload with a proof of concept demonstration dut to AEP policy.</p>
            <br />
        </div>

    </div>

    <div>
        <footer>
            <asp:Image ID="footer" runat="server" ImageAlign="Middle" Width="100%" ImageUrl="Images/footer.png"  />
        </footer>
    </div>

   
</asp:Content>
