<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMenu.aspx.cs" Inherits="WIL.AdminMenu" Async="true" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>File Upload and Details</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <h1>File Upload and Details</h1>
        
        <!-- File Upload Control -->
        <div>
            <asp:FileUpload ID="fileUpload" runat="server" />
            <asp:Button ID="uploadButton" runat="server" Text="Upload File" OnClick="UploadFile" />
        </div>

        <!-- Table to Display Details -->
        <div>
            <asp:GridView ID="detailsGridView" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
                    <asp:BoundField DataField="FileName" HeaderText="File Name" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="acceptButton" OnClientClick="return false;" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("Name") + "|" + Eval("Email") %>' />
                            <asp:Button ID="rejectButton" OnClientClick="return false;" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("Name") + "|" + Eval("Email") %>' />
                            <asp:Button ID="downloadButton" OnClientClick="return false;" runat="server" Text="Download" CommandName="Download" CommandArgument='<%# Eval("Name") + "|" + Eval("Email") + "|" + Eval("File Name")%>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <style>
        /* Global Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 960px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    font-size: 24px;
    color: #333;
}

/* File Upload Styles */
#fileUpload {
    margin: 20px 0;
}

#uploadButton {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

/* Table Styles */
#detailsGridView {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

#detailsGridView th, #detailsGridView td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
}

#detailsGridView th {
    background-color: #007bff;
    color: #fff;
}

/* Button Styles */
#detailsGridView .btn {
    padding: 5px 10px;
    margin-right: 5px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .container {
        padding: 10px;
    }

    h1 {
        font-size: 20px;
    }

    #fileUpload {
        margin: 10px 0;
    }

    #uploadButton {
        padding: 8px 16px;
    }

    #detailsGridView th, #detailsGridView td {
        padding: 8px;
    }

    #detailsGridView .btn {
        padding: 4px 8px;
    }
}

    </style>
</body>
</html>

