<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kaiser_Library_Management_System.frmLogin1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-1.9.1.js"></script>

    <style type="text/css">
        body {
            background-color: black;
        }

        #Button1 {
            text-align: center;
            margin-bottom: 6px;
        }

        .jumbotron {
            max-width: 40%;
            margin-top: 5%;
            max-height: 500%;
        }

        .l {
            height: 92px;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style4 {
            text-align: right;
            font-weight: 700;
            height: 40px;
        }

        .auto-style5 {
            height: 40px;
        }

        .auto-style6 {
            text-align: right;
            font-weight: 700;
            height: 36px;
            color: #FF0000;
        }

        .auto-style7 {
            height: 36px;
        }

        .auto-style8 {
            height: 40px;
            width: 217px;
        }

        .auto-style9 {
            height: 36px;
            width: 217px;
        }

        #form1 {
            text-align: center;
            font-weight: 700;
            width: 100%;
            height: 100%;
        }

        .auto-style14 {
            font-weight: normal;
            font-size: x-large;
            color: #FF0000;
        }

        .auto-style15 {
            text-align: right;
            font-weight: 700;
            height: 72px;
        }

        .auto-style16 {
            width: 217px;
            height: 40px;
        }

        .auto-style17 {
            height: 72px;
        }

        .auto-style18 {
            width: 217px;
            height: 72px;
        }

        .auto-style21 {
            float: left;
            height: 21px;
            padding: 15px 15px;
            font-size: large;
            line-height: 20px;
            color: #FF9933;
            width: 1303px;
        }

        .auto-style22 {
            float: left;
            text-align: left;
            width: 1345px;
            height: 73px;
        }

        .auto-style23 {
            color: #FF0000;
        }
    </style>
</head>
<body class="l" style="height: 228px">
    <div class="navbar navbar-inverse navbar-fixed-top" style="background-color: #000000; left: 0; right: 0; top: 0; height: 26px;">
        <div class="container">
            <div class="auto-style22">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                </button>
                <a class="auto-style21" runat="server" href="Default.aspx" style="font-family: 'Times New Roman', Times, serif; color: #FF0000"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Save Life</strong></a><br />
                &nbsp;
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <%--<li><a runat="server" href="~/">Home</a></li>--%>
                    <li><a runat="server" href="About.aspx">About</a></li>
                    <li><a runat="server" href="Contact.aspx">Contact</a></li>
                </ul>

            </div>
        </div>
    </div>
    <br />
    <div class="jumbotron center-block" style="text-align: left; background-color: #000000">
        <asp:Image ID="Image1" runat="server" Height="388px" Width="993px" ImageUrl="http://www.bloodondemand.com/img/02.jpg" />
        <form id="form1" runat="server" style="width: 100%; height: 100%">
            <p class="auto-style14" style="font-family: 'Bell MT';">Enter Email and Password to continue!!</p>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style4" style="font-family: 'Bell MT', Times, serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style23">&nbsp; Email</span></td>
                    <td class="auto-style8" style="font-family: 'Bell MT', Times, serif">
                        <asp:TextBox ID="txtUname" runat="server" Height="80%" Width="90%"></asp:TextBox>
                    </td>
                    <td class="auto-style5" style="font-family: 'Bell MT', Times, serif; text-align: left;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUname" ErrorMessage="This field is Required!" Font-Bold="True" ForeColor="red" CssClass="auto-style23"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" style="font-family: 'Bell MT', Times, serif">Password</td>
                    <td class="auto-style9" style="font-family: 'Bell MT', Times, serif">
                        <asp:TextBox ID="txtPass" runat="server" CssClass="" Height="80%" Width="90%" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style7" style="font-family: 'Bell MT', Times, serif; text-align: left;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="This field is Required!" Font-Bold="True" ForeColor="red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15" style="font-family: 'Times New Roman', Times, serif"></td>
                    <td class="auto-style18" style="font-family: 'Times New Roman', Times, serif">
                        <br />
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-sm btn-primary" Width="107px" Height="42px" Style="color: #FF0000; background-color: #FFFFFF; font-size: large;" />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    </td>
                    <td class="auto-style17" style="font-family: 'Times New Roman', Times, serif"></td>
                </tr>
                <tr>
                    <td class="auto-style15" style="font-family: 'Times New Roman', Times, serif">&nbsp;</td>
                    <td class="auto-style16" style="font-family: 'Times New Roman', Times, serif">&nbsp;</td>
                    <td class="auto-style17" style="font-family: 'Times New Roman', Times, serif">&nbsp;</td>
                </tr>
            </table>
            <table class="auto-style2">
                <tr>
                    <td>
                        <asp:Label ID="labelwarn" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red" Text="Warning" Visible="False"></asp:Label>
                    </td>

                </tr>
            </table>
        </form>
    </div>
</body>
</html>
