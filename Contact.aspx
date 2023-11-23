<%@ Page Title="Contact" Language="C#"  AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WIL.Contact"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contactForm">
            <h1>Contact Us</h1>
            <div>
                <label for="name">Name:</label>
                <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Email Address:</label>
                <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="message">Message:</label>
                <asp:TextBox ID="messageTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:RadioButton ID="signupRadioButton" runat="server" Text="Sign up for promotions" />
            </div>
            <div>
                <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="UploadDetails" style="height: 26px" />
            </div>
        </div>
    </form>
    <style>
       .contactForm{

       } 
    </style>
</body>
</html>