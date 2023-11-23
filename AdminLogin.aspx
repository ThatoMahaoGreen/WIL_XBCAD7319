<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WIL.AdminLogin" %>

<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <title>Login Page</title>
    <style>
        body {
            background-color: #FF0000; /* Red background color */
            font-family: Arial, sans-serif;
            text-align: center;
        }

        .login-container {
            background-color: #FFFF00; /* Yellow container background color */
            border: 1px solid #FF0000; /* Red border */
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        .login-image {
            margin-bottom: 20px;
        }

        .login-button {
            background-color: #FF0000; /* Red button color */
            color: #FFFF00; /* Yellow text color */
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .login-button:hover {
            background-color: #FFFF00; /* Yellow button color on hover */
            color: #FF0000; /* Red text color on hover */
        }
        
    </style>
</head>
<body>
    <form id="loginForm" runat="server">
        <div class="container">
            <div class="row justify-content-center align-items-center" style="height:100vh;">
                <div class="col-md-4">
                    <div class="text-center">
                        <img src="Images/VitaStartLogo.jpg" alt="Company Logo" class="login-image img-fluid" width="150" height="150" />
                        <h1>Login</h1>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="UsernameTextBox" runat="server" placeholder="Username" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control" />
                    </div>
                    <div class="text-center">
                        <asp:Button ID="LoginButton" runat="server" Text="Log In" OnClick="LoginButton_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>

</html>

