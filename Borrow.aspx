<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Borrow.aspx.cs" Inherits="Kaiser_Library_Management_System.frmIssueBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issue Book</title>
    <style type="text/css">
        .auto-style2 {
            width: 1326px;
            height: 344px;
        }

        .auto-style4 {
            text-align: right;
            height: 17px;
            width: 414px;
        }

        .auto-style5 {
            height: 17px;
            text-align: left;
            width: 554px;
        }

        .auto-style7 {
            height: 17px;
            width: 500px;
            text-align: center;
        }

        .auto-style10 {
            text-align: right;
            width: 414px;
            height: 67px;
        }

        .auto-style11 {
            width: 500px;
            height: 67px;
            text-align: center;
        }

        .auto-style12 {
            height: 67px;
            text-align: left;
            width: 554px;
        }

        .auto-style14 {
            height: 20px;
            text-align: right;
            width: 63px;
        }

        .auto-style15 {
            text-align: center;
            font-size: medium;
        }

        .auto-style16 {
            height: 20px;
            text-align: right;
            width: 554px;
        }

        .auto-style19 {
            width: 1326px;
            height: 99px;
            margin-bottom: 0px;
        }

        .auto-style21 {
            text-align: center;
            font-size: medium;
            height: 18px;
        }

        .auto-style22 {
            height: 16px;
            color: #FF9900;
        }

        .auto-style23 {
            height: 20px;
            text-align: right;
            width: 514px;
        }

        .auto-style24 {
            text-align: right;
            height: 40px;
        }

        .auto-style25 {
            width: 82%;
        }
        .auto-style26 {
            color: #FF9933;
        }
        .auto-style27 {
            color: #FF9900;
        }
        .auto-style28 {
            text-align: right;
            color: #FF9900;
        }
        .auto-style29 {
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
<body style="background-color:#34495E">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="auto-style29" runat="server" href="HomePage.aspx">Save Life Blood-Bank Management System </a>&nbsp;<%-- <asp:HyperLink ID="hpregister" runat="server" NavigateUrl="Register.aspx" Visible="False">Register New Librarian</asp:HyperLink>
                    --%></div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="Book.aspx">Book</a></li>
                        <li><a runat="server" href="Author.aspx">Author</a></li>--%>
                        <li><a runat="server" href="Member.aspx">Member</a></li>
                        <li><a runat="server" href="Borrow.aspx">Borrow</a></li>
                        <li><a runat="server" href="ReturnBook.aspx">Return Book</a></li>
                    </ul>

                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <li><a runat="server" id="Mylink" href="Register.aspx" visible="False">Register a new Librarian!</a></li>

                            <ul class="nav navbar-nav navbar-right">

                                <li><a runat="server" id="register" href="Register.aspx">Register</a></li>
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
                        <asp:Button ID="btnyes" runat="server" Text="Yes" CssClass="btn btn-info btn-sm" OnClick="btnyes_Click" />
                        <asp:Button ID="btnNo" runat="server" Text="No" CssClass="btn btn-info btn-sm" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <div class="jumbotron" style="background-color:#34495E  ">

            <table class="auto-style19" cssclass="table table-bordered table-hover table-responsive">
                <tr>
                    <td class="auto-style4">&nbsp;&nbsp;<span class="auto-style26">&nbsp;&nbsp; Book Name<br />
                        (Book&#39;s ID is automatically Selected)</span>&nbsp; </td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlBook" runat="server" DataSourceID="BookDataSource" DataTextField="BookName" DataValueField="BookID" Height="70%" Width="80%">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5">&nbsp;<asp:Button ID="btnShowMemberName" runat="server" Text="Show Member Name" CssClass="btn btn-info" OnClick="btnShowMemberName_Click" Width="50%" style="background-color: #6699FF" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10"><span class="auto-style27">Member Id<br />
                        </span>
                        <br />
                    </td>
                    <td class="auto-style11">
                        <asp:DropDownList ID="ddlMember" runat="server" Height="45%" Width="80%" DataSourceID="MemberDataSource" DataTextField="MemberId" DataValueField="MemberId">
                        </asp:DropDownList>
                        <br />
                    </td>
                    <td class="auto-style12">
                        <asp:TextBox ID="txtMemberName" runat="server" Enabled="False" Height="45%" Width="50%"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
            <table class="auto-style25">
                <tr>
                    <td class="auto-style28">No of Previously Taken Books</td>
                    <td>
                        <asp:TextBox ID="txtBookCount" runat="server" CssClass="col-xs-offset-0" Width="80%" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <table class="auto-style2" cssclass="table table-bordered table-hover table-responsive">
                <tr>
                    <td class="auto-style23">
                        <h4 class="auto-style21"><strong><span class="auto-style27">Issue Date</span><br />
                        </strong></h4>
                        <asp:Calendar CssClass="pull-right" ID="calIssue" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="67%">
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
                    <td class="auto-style14"></td>
                    <td class="auto-style16">
                        <div class="auto-style15">
                            <h4 class="auto-style22"><strong>Due Date</strong></h4>
                        </div>
                        <asp:Calendar ID="calDue" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="67%">
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
                </tr>
                <tr>
                    <td class="auto-style24" colspan="3">
                        <asp:Button ID="btnIssue" runat="server" Text="Issue New Book" CssClass="btn btn-sm btn-success center-block" OnClick="btnAdd_Click" OnClientClick="return confirm('Issue New Book?')" style="background-color: #6699FF" />
                    </td>
                </tr>
                <tr>
                    <td class="text-right" colspan="3">
                        <div class="text-center">
                            <asp:Label ID="lblInfo" runat="server" Text="Info" CssClass="label label-info" Style="font-size: medium; background-color: #6699FF;"></asp:Label>
                            <asp:Label ID="lblMoreInfo" runat="server" Text="Label" CssClass="label label-info" Style="font-size: medium; background-color: #6699FF;"></asp:Label>
                        </div>
                    </td>
                </tr>
            </table>

        </div>
        <div class="jumbotron">

            <asp:SqlDataSource ID="BookDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Book]"></asp:SqlDataSource>

            <asp:GridView ID="GridView1" CssClass="table table-hover table-responsive table-striped" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IssueID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IssueID" HeaderText="IssueID" ReadOnly="True" SortExpression="IssueID" />
                    <asp:BoundField DataField="IssueDate" HeaderText="IssueDate" SortExpression="IssueDate" />
                    <asp:BoundField DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId" />
                    <asp:BoundField DataField="MemberName" HeaderText="MemberName" SortExpression="MemberName" />
                    <asp:BoundField DataField="MemberPhone" HeaderText="MemberPhone" SortExpression="MemberPhone" />
                    <asp:BoundField DataField="Member_Type" HeaderText="Member_Type" SortExpression="Member_Type" />
                    <asp:BoundField DataField="BookId" HeaderText="BookId" SortExpression="BookId" />
                    <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                    <asp:BoundField DataField="Book_Level" HeaderText="Book_Level" SortExpression="Book_Level" />
                    <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                    <asp:BoundField DataField="ReturnID" HeaderText="ReturnID" SortExpression="ReturnID" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM [IssueTable] WHERE [IssueID] = @IssueID" InsertCommand="INSERT INTO [IssueTable] ([IssueID], [MemberId], [IssueDate], [BookId]) VALUES (@IssueID, @MemberId, @IssueDate, @BookId)" SelectCommand="SELECT IssueTable.IssueID, IssueTable.MemberId, IssueTable.IssueDate, IssueTable.BookId, Book.BookName, Book.Book_Level, Member.MemberName, Member.MemberPhone, Member.Member_Type, IssueTable.DueDate, IssueTable.ReturnID FROM IssueTable INNER JOIN Book ON IssueTable.BookId = Book.BookID INNER JOIN Member ON IssueTable.MemberId = Member.MemberId" UpdateCommand="UPDATE [IssueTable] SET [MemberId] = @MemberId, [IssueDate] = @IssueDate, [BookId] = @BookId WHERE [IssueID] = @IssueID">
                <DeleteParameters>
                    <asp:Parameter Name="IssueID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="IssueID" Type="String" />
                    <asp:Parameter Name="MemberId" Type="String" />
                    <asp:Parameter Name="IssueDate" Type="DateTime" />
                    <asp:Parameter Name="BookId" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MemberId" Type="String" />
                    <asp:Parameter Name="IssueDate" Type="DateTime" />
                    <asp:Parameter Name="BookId" Type="String" />
                    <asp:Parameter Name="IssueID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="MemberDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
