<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Kaiser_Library_Management_System.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
        .auto-style2 {
            float: left;
            height: 102px;
            padding: 15px 15px;
            font-size: 18px;
            line-height: 20px;
            width: 1333px;
        }
        .auto-style3 {
            text-align: center;
            color: #FFFFFF;
        }
        .auto-style4 {
            text-align: center;
            color: #FF9900;
            font-size: xx-large;
        }
        .auto-style5 {
            text-align: center;
            color: #666633;
            font-size: x-large;
        }
    </style>
</head>
<script src="Scripts/jquery-1.9.1.js"></script>
<script src="Scripts/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body style="background-color:black">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top" style="left: 0; right: 0; top: 0; height: 214px">
            <div class="container">
                <div class="navbar-header">
                    <p class="auto-style1">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="auto-style2" runat="server" href="#">Home<asp:Image ID="Image1" runat="server" Height="80px" ImageUrl="~/ResourceImages/bibek.PNG" Width="259px" />
                        </a>&nbsp;<%--                    <asp:HyperLink ID="hpregister" runat="server" NavigateUrl="frmRegister.aspx" Visible="False">Register New Librarian</asp:HyperLink>
                    --%></p>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav" >
                        <li><a runat="server" id="book" href="Book.aspx">Book</a></li>
                        <li><a runat="server" id="author" href="Author.aspx">Author</a></li>
                        <li><a runat="server" href="Member.aspx">Member</a></li>
                        <li><a runat="server" href="IssueBook.aspx">Issue Book</a></li>
                        <li><a runat="server" href="ReturnBook">Return Book</a></li>
                        <li><a runat="server" href="Supplier.aspx"> Supplier</a></li>
                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <li><a runat="server" id="Mylink" href="Register.aspx" visible="False">Register a new Librarian!</a></li>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a runat="server" id="welcome" href="ChangePassword.aspx">Welcome, <%: Session["new"].ToString() %>!</a></li>
                                <li><a runat="server" href="#" data-toggle="modal" data-target="#logoff">Signout?</a></li>


                            </ul>
                        </AnonymousTemplate>

                    </asp:LoginView>
                </div>
                <div class="pull-right ">
                </div>

            </div>
        </div>

        <div class="modal" id="logoff" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: black; color: white">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Sign out?</h4>
                    </div>
                    <div class="modal-body" style="background-color: whitesmoke; color: black">
                        <h4>Do you Want to Signout?</h4>
                        <asp:Button ID="btnyes" runat="server" Text="Yes" CssClass="btn btn-info btn-sm" OnClick="btnyes_Click" />
                        <asp:Button ID="btnNo" runat="server" Text="No" CssClass="btn btn-info btn-sm" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p class="auto-style3" style="font-family: verdana, Geneva, Tahoma, sans-serif; font-size: 80px; text-decoration: blink;">
            <strong>Library Management System</strong></p>
        <p class="auto-style4" style="font-family: verdana, Geneva, Tahoma, sans-serif; text-decoration: blink;">
            Keiser Library</p>
        <p class="auto-style4" style="font-family: verdana, Geneva, Tahoma, sans-serif; text-decoration: blink;">
            &nbsp;</p>
        <p class="auto-style5" style="font-family: verdana, Geneva, Tahoma, sans-serif; text-decoration: blink;">
            Group Project</p>
    </form>
</body>
</html>
