<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Kaiser_Library_Management_System.frmContact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF9900;
        }
    </style>
</head>
    <script src="Scripts/jquery-1.9.1.js"></script>
<script src="Scripts/bootstrap.js"></script>
<link href="Content/bootstrap.css" rel="stylesheet" />
<body style="background-color:black">
    <form id="form1" runat="server">
    <div class="navbar navbar-inverse navbar-fixed-top" style="background-color:black; left: 5px; right: -5px; top: 2px; height: 101px;" >
            <div class="container" style="background-color:black">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="Default.aspx">Kaiser Library&nbsp;&nbsp;&nbsp; <asp:Image ID="Image1" runat="server" Height="87px" ImageUrl="~/ResourceImages/bibek.PNG" Width="282px" />
                    </a>&nbsp;</div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="~/">Home</a></li>--%>
                        <li><a runat="server" href="About.aspx">About</a></li>
                        <li><a runat="server" href="Contact.aspx">Contact</a></li>
                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <ul class="nav navbar-nav navbar-right">
                                
                                <li><a runat="server" href="Register.aspx">Register</a></li>
                                <li><a runat="server" href="Login.aspx">Log in</a></li>
                            </ul>
                        </AnonymousTemplate>
                      
                    </asp:LoginView>
                </div>
            </div>
        </div>
    <div class="jumbotron" style="background-color:black">
        
    <h2>&nbsp;</h2>
    <h3 class="auto-style1">Kaiser Library Management System is a systematic Web Application which was built in ASP.NET framework using Visual Studio 2013</h3>
    <p><span class="auto-style1">The developers of the System are :</p>
    <p>1. <span class="auto-style1">Bibek Shrestha</span>,</p>
    <p>2. <span class="auto-style1">Sabin Bhandari</span>,</p>
    <p>3. Abinash Manandhar,</p>
    <p>4.Ujjwal Subedi.</span></p>


    </div>
    </form>
</body>
</html>
