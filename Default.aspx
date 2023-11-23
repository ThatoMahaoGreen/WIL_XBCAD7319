<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WIL._Default"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
    <form id="Form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Image at the top -->
                <div class="col-md-12">
                    <img src="Images/VitaStartLogo.jpg" alt="Company Logo" class="img-fluid" />
                </div>
            </div>
            </div>

            <!-- Navigation bar below the image -->
            <div class="row">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <div class="container">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item"><asp:LinkButton ID="LinkButton6" runat="server" Text="Home" OnClick="Home_Btn_Clicked" PostBackUrl="Default.aspx" CssClass="nav-link" /></li>
                            <li class="nav-item"><asp:LinkButton ID="LinkButton5" runat="server" Text="About" OnClick="About_Btn_Clicked" PostBackUrl="About.aspx" CssClass="nav-link" /></li>
                            <li class="nav-item"><asp:LinkButton ID="LinkButton4" runat="server" Text="Maize" OnClick="Maize_Btn_Clicked" PostBackUrl="JobApplication.aspx" CssClass="nav-link" /></li>
                            <li class="nav-item"><asp:LinkButton ID="LinkButton3" runat="server" Text="Sorghum" OnClick="Sorghum_Btn_Clicked" PostBackUrl="JobApplication.aspx" CssClass="nav-link" /></li>
                            <li class="nav-item"><asp:LinkButton ID="LinkButton2" runat="server" Text="Login" OnClick="Login_Btn_Clicked" PostBackUrl="AdminLogin.aspx" CssClass="nav-link" /></li>
                            <li class="nav-item"><asp:LinkButton ID="LinkButton1" runat="server" Text="Contact" OnClick="Contact_Btn_Clicked" PostBackUrl="Contact.aspx" CssClass="nav-link" /></li>
                            <li class="nav-item"><asp:LinkButton ID="buttonLink" runat="server" Text="Job Application" OnClick="JA_Btn_Clicked" PostBackUrl="JobApplication.aspx" CssClass="nav-link" /></li>
                        </ul>
                    </div>
                </nav>
            </div>
    <div id="slideshow-container">
        <div class="text" id="text1"></div>
    </div>

           <div>
   <p>Essential to the structure and function of the skin and mucous membranes in eyes and lungs.</p>
       <p>Maintains a healthy nervous system and is required to release energy from carbohydrates.</p>
       <p>Required for the release of energy from food and functioning of the skin and nervous system.</p>
       <p>Essential for the formation of red blood cells and the metabolism and transport of iron.</p>
       </div>
        <!-- Paragraph text at the bottom -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="footer">
                        <p class="text-center">Contact Email: <u>info@vitastartsa.co.za</u></p>
                        <p class="text-center">Telephone Number: <u>+27 43 831 1066</u></p>
                        <p class="text-center">&copy; <%: DateTime.Now.Year %> by Plaza Products PTY (Ltd)</p>
                    </div>
                </div>
            </div>
        </div>
       
 </form>
    <style>   
        #text1{
           opacity:1; 
           transition: opacity 1s ease-in-out;
        }
    
    </style>
    <script>
        var currentIndex = 0;
        var texts = ['High in Vitamin A',
        'Very High in Vitamin B1',
        'Very High in Vitamin B3',
        'Very High in Vitamin B6'];
        function showNextText() {
            var displayElement = document.getElementById('text1');

            displayElement.style.opacity = 0;

            setTimeout(function () {
                displayElement.innerHTML = texts[currentIndex];
                displayElement.style.opacity = 1;
                currentIndex = (currentIndex + 1) % texts.length;
            }, 1000);

            setTimeout(showNextText, 5000); 
        }
        window.onload = function () {
            showNextText();
        };

    </script>
</body>
</html>

