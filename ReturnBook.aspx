<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReturnBook.aspx.cs" Inherits="Kaiser_Library_Management_System.ReturnBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Return Book</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            height: 28px;
        }
        .auto-style2 {
            text-align: center;
            height: 50px;
        }
        .auto-style3 {
            height: 42px;
        }
        .auto-style4 {
            width: 1315px;
            height: 30px;
        }
        .auto-style5 {
            text-align: right;
            width: 80px;
            height: 30px;
        }
        .auto-style10 {
            width: 215px;
            height: 30px;
        }
        .auto-style11 {
            width: 215px;
            height: 30px;
            text-align: left;
        }
        .auto-style12 {
            text-align: left;
            width: 80px;
            height: 30px;
        }
        .auto-style13 {
            text-align: right;
            height: 30px;
        }
        .auto-style14 {
            margin-left: 547;
        }
        .auto-style15 {
            color: #0066FF;
        }
        .auto-style16 {
            float: left;
            height: 50px;
            padding: 15px 15px;
            font-size: x-large;
            line-height: 20px;
            color: #FF0000;
        }
    </style>
</head>
<script src="Scripts/jquery-1.9.1.js"></script>
<script src="Scripts/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body style="background-color:#CB4335">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top" style="background-color:black">
            <div class="container">
                <div class="navbar-header" style="background-color:black">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <span class="auto-style15">
                    <a class="auto-style16" runat="server" href="HomePage.aspx">Save Life Bloodbank Management System&nbsp;</a></span><a class="navbar-brand" runat="server" href="HomePage.aspx">&nbsp;&nbsp;
                    </a>&nbsp;<%--                    <asp:HyperLink ID="hpregister" runat="server" NavigateUrl="Register.aspx" Visible="False">Register New Librarian</asp:HyperLink>
                    --%></div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="Book.aspx">Book</a></li>
                        <li><a runat="server" href="Author.aspx">Author</a></li>--%>
                        <li><a runat="server" href="Member.aspx">Member</a></li>
                        <li><a runat="server" href="IssueBook.aspx">Issue Book</a></li>

                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <li><a runat="server" id="Mylink" href="Register.aspx" visible="False">Register a new Librarian!</a></li>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a runat="server" id="welcome">Welcome,<%-- <%: Session["new"].ToString() %>--%>!</a></li>
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
         <div class="container-fluid page-header">
            <br />
            <table class="nav-justified" style="margin-top:2%">
                <tr>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddIssueList" runat="server" Height="92%" Width="49%" DataSourceID="IssueDataSource" DataTextField="IssueID" DataValueField="IssueID" CssClass="auto-style14">
                            <asp:ListItem>Select Issue Id</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="IssueDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [IssueTable] where ReturnID='Not Returned Yet'"></asp:SqlDataSource>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style3">
                        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-sm btn-primary center-block" Text="Select Issue Id" OnClick="btnSearch_Click" style="color: #000000; background-color: #6699FF" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="text-align: center">
                        <asp:RequiredFieldValidator ID="valTxtSearch" CssClass="label label-danger center-block" runat="server" ErrorMessage="These Fields Are Required!!" ControlToValidate="ddIssueList" Height="17px" Style="font-size: large; color: #000000; background-color: #3366FF;" Width="311px"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblbook" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
              </table>
            <br />
        </div>
        <div class="jumbotron" style="background-color:#CB4335">
        <table class="auto-style4">
            <tr>
                <td class="auto-style5">Issue Id</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtIssueId" runat="server" Enabled="False" Height="80%" Width="80%"></asp:TextBox>
                </td>
                <td class="auto-style5">Issue Date</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtIssueDate" runat="server" Height="80%" Width="80%" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Member Id</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtMemberId" runat="server" Enabled="False" Height="80%" Width="80%"></asp:TextBox>
                </td>
                <td class="auto-style5">Due Date</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtDueDate" runat="server" Enabled="False" Height="80%" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Book Id</td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtBookId" runat="server" Enabled="False" Height="80%" Width="80%"></asp:TextBox>
                </td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Return Date</td>
                <td class="auto-style10">
                    <asp:Calendar ID="calReturn" runat="server"  SelectedDate="<%# DateTime.Today %>" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="60%" NextPrevFormat="FullMonth" TitleFormat="Month" Width="80%">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                        <DayStyle Width="14%" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                        <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar>
                </td>
                <td class="auto-style5">Due Fine</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtDueFine" runat="server" Enabled="False" Height="15%" Width="80%"></asp:TextBox>
                    <asp:Button ID="btnCalculateDue" runat="server" Text="Calculate Due Fine" CssClass="btn btn-sm btn-warning" OnClick="btnCalculateDue_Click" style="background-color: #996633" />
                </td>
            </tr>
            <tr>
                <td class="auto-style13" colspan="4">
                        <asp:Button ID="btnReturn" runat="server" Text="Return  Book" CssClass="btn btn-sm btn-success center-block" OnClick="btnAdd_Click" OnClientClick="return confirm('Issue New Book?')" style="background-color: #996633" />
                    </td>
            </tr>
        </table>
        </div>
        <div class="jumbotron" style="background-color:#CB4335">

            <asp:GridView ID="GridView1" CssClass="table table-responsive  table-condensed table-inverse table-hover"  runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ReturnId" DataSourceID="Return">
                <Columns>
                    <asp:BoundField DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId" />
                    <asp:BoundField DataField="MemberName" HeaderText="MemberName" SortExpression="MemberName" />
                    <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                    <asp:BoundField DataField="ReturnId" HeaderText="ReturnId" ReadOnly="True" SortExpression="ReturnId" />
                    <asp:BoundField DataField="IssueId" HeaderText="IssueId" SortExpression="IssueId" />
                    <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" SortExpression="ReturnDate" />
                    <asp:BoundField DataField="Due Fine " HeaderText="Due Fine " SortExpression="Due Fine " />
                    <asp:BoundField DataField="Book_Level" HeaderText="Book_Level" SortExpression="Book_Level" />
                    <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                    <asp:BoundField DataField="IssueDate" HeaderText="IssueDate" SortExpression="IssueDate" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>

            <asp:SqlDataSource ID="Return" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT IssueTable.MemberId, Member.MemberName, Book.BookName, ReturnTable.ReturnId, ReturnTable.IssueId, ReturnTable.ReturnDate, ReturnTable.[Due Fine ], Book.Book_Level, IssueTable.DueDate, IssueTable.IssueDate FROM IssueTable INNER JOIN Book ON IssueTable.BookId = Book.BookID INNER JOIN Member ON IssueTable.MemberId = Member.MemberId INNER JOIN ReturnTable ON IssueTable.IssueID = ReturnTable.IssueId"></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
