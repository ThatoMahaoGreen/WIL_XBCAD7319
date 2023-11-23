
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobApplication.aspx.cs" Inherits="WIL.JobApplication" %>
<!DOCTYPE html>
<html>
<head>
    <title>Jobs</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
    <form id="Form1" runat="server" class="job-form-block container">
        <div class="form-group">
            <label for="name_txt">Name</label>
            <asp:TextBox ID="name_txt" runat="server" CssClass="form-control" MaxLength="256" placeholder="Enter your full name." required="required"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="email_txt">Email Address</label>
            <asp:TextBox ID="email_txt" runat="server" CssClass="form-control" MaxLength="256" placeholder="Enter your email address." required="required"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="CV_upload" class="text-block-3">CV/Resume</label>
            <div id="File_Upload" class="w-embed w-script">
                <asp:FileUpload ID="CV_upload" runat="server" CssClass="form-control-file" />  <!-- Your file upload script goes here -->
            </div>
        </div>
    </form>
</body>
</html>

