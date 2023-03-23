<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Kaiser_Library_Management_System.frmChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password
           </title>
    <style type="text/css">
        .auto-style1 {
            height: 71px;
        }
        .auto-style2 {
            height: 44px;
        }
        .auto-style3 {
            height: 44px;
            text-align: right;
            width: 241px;
        }
        .auto-style4 {
            height: 71px;
            text-align: right;
            width: 241px;
        }
        .auto-style5 {
            text-align: right;
            width: 241px;
            height: 59px;
        }
        .auto-style6 {
            width: 241px;
        }
        .auto-style7 {
            height: 71px;
            width: 279px;
        }
        .auto-style8 {
            width: 279px;
            text-align: center;
        }
        .auto-style9 {
            height: 44px;
            width: 279px;
        }
        .auto-style10 {
            width: 279px;
            height: 59px;
        }
        .auto-style11 {
            height: 59px;
        }
        .auto-style12 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <form id="form1" runat="server">
          <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="HomePage.aspx">Gandaki Library Management System</a>
                    <%--                    <asp:HyperLink ID="hpregister" runat="server" NavigateUrl="Register.aspx" Visible="False">Register New Librarian</asp:HyperLink>
                    --%>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="HomePage.apsx">Home Page</a></li>
                       
                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                                <ul class="nav navbar-nav navbar-right">
                                <li><a runat="server" id="welcome">Welcome, <%: Session["new"].ToString() %>!</a></li>
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
                        <asp:Button ID="btnyes" runat="server" Text="Yes" CssClass="btn btn-info btn-sm"  OnClick="btnyes_Click"/>
                        <asp:Button ID="btnNo" runat="server" Text="No" CssClass="btn btn-info btn-sm" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="page-header">
            <h1 class="text-center">Change Your Password!</h1>
        </div>
        <div class="jumbotron">


            <table class="nav-justified">
                <tr>
                    <td class="auto-style4">Current Password</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtCurrentPass" runat="server" Enabled="False" Height="35px" Width="80%"></asp:TextBox>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style5">New Password</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtNewPass" runat="server" Height="35px" Width="80%" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style11">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="label label-danger" ErrorMessage="Should Enter Password" style="font-size: medium" ControlToValidate="txtNewPass"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Confirm Password</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtConfirmPass" runat="server" Height="35px" Width="80%" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" CssClass="label label-danger" ErrorMessage="Passwords Must Match" style="font-size: medium"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Change Password" OnClick="Button1_Click" OnClientClick="return Confirm('Update Current Password?')" Width="190px" />
                        <br />
                        <strong><em>
                        <asp:Label ID="lblMessage" runat="server" CssClass="auto-style12" Text="Label"></asp:Label>
                        </em></strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>


        </div>
    </form>
</body>
</html>
