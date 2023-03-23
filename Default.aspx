<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Kaiser_Library_Management_System.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
            height: 25px;
        }
        .auto-style2 {
            text-align: left;
            height: 125px;
        }
        .auto-style3 {
            display: block;
            margin-right: 0px;
            margin-left: 0px;
            margin-bottom: 0px;
        }
        .auto-style4 {
            text-decoration: underline;
            margin-left: 233;
            margin-right: 2px;
        }
        .auto-style5 {
            text-align: center;
            width: 1451px;
        }
        .auto-style6 {
            float: left;
            height: 50px;
            padding: 15px 15px;
            font-size: x-large;
            line-height: 20px;
        }
        .auto-style7 {
            width: 100%;
            height: 226px;
        }
        .auto-style8 {
            color: #FF9900;
        }
        .auto-style9 {
            float: left;
            height: 99px;
            padding: 15px 15px;
            font-size: x-large;
            line-height: 20px;
        }
        .auto-style11 {
            color: inherit;
            margin-bottom: 30px;
            padding-top: 48px;
            padding-bottom: 48px;
            background-color: #000000;
        }
        .auto-style12 {
            color: #FF0000;
        }
    </style>
</head>
<script src="Scripts/jquery-1.9.1.js"></script>
<script src="Scripts/bootstrap.js"></script>
<link href="Content/bootstrap.css" rel="stylesheet" />
<script src="Scripts/jquery-1.9.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<body style="height: 609px; background-color:#34495E  ">
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top" style="left: -15px; right: 9px; top: 0; height: 124px; background-color:#34495E  ; margin-right: 6px;">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                    </button>
                    <a class="auto-style6" runat="server" href="Default.aspx">&nbsp;</a><span class="auto-style8"><a class="auto-style9" runat="server" href="Default.aspx"><div>
                        <span class="auto-style12" style="font-family: Algerian">Blood-Bank Management System</span>&nbsp;
                    </div>
                    </a></span>
                &nbsp;</div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="~/">Home</a></li>--%>
                        <li><a runat="server" href="About.aspx">About</a></li>
                        <li><a runat="server" href="Contact.aspx">Contact</a></li>
                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <ul class="nav navbar-nav navbar-right">
                                <%--<li><a runat="server"  href="#" >Register</a></li>--%>
                                <li><a runat="server" href="Login.aspx">Log in</a></li>
                            </ul>
                        </AnonymousTemplate>
                    </asp:LoginView>
                </div>
            </div>
        </div>
   
        <div class="container-fluid page-header" style="margin-top: 10%; background-color: #34495E  ;">
            <br />
            <table class="auto-style7">
                <tr>
                    <td class="auto-style2">
                        <div class="text-left">
                            <div class="auto-style5">
                        <asp:TextBox ID="txtSearch" runat="server" Width="18%" placeholder="Select Searching Method" CssClass="auto-style3" Height="44px"></asp:TextBox>
                            </div>
                            <br />
                        </div>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="59px" Width="17%" CssClass="auto-style4" DataSourceID="SqlDataSource1" DataTextField="GROUP" DataValueField="GROUP">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="errdisplay" CssClass="label label-danger center-block" runat="server" ErrorMessage="Enter a character!!" ControlToValidate="txtSearch" Height="32px" Style="font-size: large; margin-left: 0px; margin-right: 0px;" Width="425px"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblbook" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-left">
                        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-sm btn-primary center-block" Text="Search" OnClick="btnSearch_Click" Height="34px" style="margin-left: 0px; background-color: #FF0000;" Width="119px" />
                    </td>
                </tr>
            </table>
            <br />
        </div>
        <div class="auto-style11" id="gridview" style="background-color:#34495E">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BLOOD %>" SelectCommand="SELECT * FROM [BLOODTYPE]" ProviderName="<%$ ConnectionStrings:BLOOD.ProviderName %>"></asp:SqlDataSource>

            <asp:GridView ID="GridView1" CssClass="table table-hover table-responsive" runat="server" CellPadding="4" ForeColor="#333333" OnRowDataBound="OnRowDataBound" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="DONORID" HeaderText="DONOR ID" />
                    <asp:BoundField DataField="DONARNAME" HeaderText="NAME" />
                    <asp:BoundField DataField="DONORADDRESS" HeaderText="ADDRESS" />
                    <asp:BoundField DataField="DONORCONTACT" HeaderText="CONTACT" />
                    <asp:BoundField DataField="BLOODGROUP" HeaderText="BLOOD GROUP" />
                </Columns>
                <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>

        </div>
    </form>
</body>
</html>
