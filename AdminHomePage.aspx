<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="Kaiser_Library_Management_System.AdminHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Admin Home Page</title>
    <style type="text/css">
        .auto-style1 {
            float: left;
            padding: 15px 15px;
            font-size: x-large;
            line-height: 20px;
            color: #FF0000;
        }
    </style>
</head>
<body>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top" style="left: 0; right: 0; top: 0; height: 98px">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="auto-style1" runat="server" href="#">SAVE LIFE-Blood Bank Management System</a>&nbsp;<%-- <asp:HyperLink ID="hpregister" runat="server" NavigateUrl="Register.aspx" Visible="False">Register New Librarian</asp:HyperLink>
                    --%></div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="Book.aspx">Doner List</a></li>
                        <li><a runat="server" href="Author.aspx">Details</a></li>
                        <li><a runat="server" href="Member.aspx">Register</a></li>
                        <li><a runat="server" href="Borrow.aspx">Request</a></li>
                        <li><a runat="server" href="ReturnBook.aspx">Return Book</a></li>

                    </ul>
                   
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <li><a runat="server" id="Mylink" href="Register.aspx" visible="False">Register a new Librarian!</a></li>

                            <ul class="nav navbar-nav navbar-right">

                                <li><a runat="server" id="register" href="Register.aspx">Register</a></li>
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
        <asp:Image ID="Image1" runat="server" Height="729px" ImageUrl="http://www.bloodondemand.com/img/02.jpg" Width="100%" />
    </form>
</body>
</html>
