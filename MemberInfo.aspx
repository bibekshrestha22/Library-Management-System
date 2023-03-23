<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberInfo.aspx.cs" Inherits="Kaiser_Library_Management_System.MemberInfoaspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member and Book Info</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            height: 46px;
        }
        .auto-style2 {
            text-align: center;
            height: 80px;
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
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="HomePage.aspx">Kaiser Library
                    <asp:Image ID="Image1" runat="server" Height="61px" ImageUrl="~/ResourceImages/bibek.PNG" Width="210px" />
                    </a>&nbsp;<%--                    <asp:HyperLink ID="hpregister" runat="server" NavigateUrl="Register.aspx" Visible="False">Register New Librarian</asp:HyperLink>
                    --%></div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="Member.aspx">Member</a></li>
                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a runat="server" id="welcome"><%--Welcome, <%: Session["new"].ToString() %>!--%></a></li>
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
         <div class="container-fluid page-header" style="margin-top: 10% background-color:">
            <br />
            <table class="nav-justified">
                <tr>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlMember" runat="server" DataSourceID="MemberName" DataTextField="MemberName" DataValueField="MemberId" Height="70%" Width="45%">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="MemberName" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="text-align: center">
                        <br />
                        <asp:Label ID="lblMember" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-sm btn-primary center-block" Text="Search" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
            <br />
        </div>
        <div class="jumbotron">
            <h3 class="text-center"> Members Who have Loaned Book in last 31 Days</h3>

            <asp:GridView ID="GridView1"  CssClass="table table-hover table-responsive" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="IssueID" HeaderText="Issue Id" />
                    <asp:BoundField DataField="MemberId" HeaderText="Member Id" />
                    <asp:BoundField DataField="IssueDate" HeaderText="Issued Date" />
                    <asp:BoundField DataField="BookId" HeaderText="BookId" />
                    <asp:BoundField DataField="DueDate" HeaderText="DueDate" />
                    <asp:BoundField DataField="ReturnID" HeaderText="Return Status" />
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
        </div>
        <div class="jumbotron">
            <h3 class="text-center"> Members Who havenot Loaned Book in last 31 Days</h3>
            <asp:GridView ID="GridView2" CssClass="table table-responsive table-hover table-striped" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IssueID" DataSourceID="MemberNotLoan">
                <Columns>
                    <asp:BoundField DataField="MemberName" HeaderText="MemberName" SortExpression="MemberName" />
                    <asp:BoundField DataField="IssueID" HeaderText="IssueID" ReadOnly="True" SortExpression="IssueID" />
                    <asp:BoundField DataField="Last Loand Date" HeaderText="Last Loand Date" SortExpression="Last Loand Date" />
                    <asp:BoundField DataField="Last Loaned Book" HeaderText="Last Loaned Book" SortExpression="Last Loaned Book" />
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

            <asp:SqlDataSource ID="MemberNotLoan" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="select distinct IssueTable.IssueID, IssueTable.IssueDate as [Last Loand Date], Book.BookName as [Last Loaned Book],Member.MemberName, Member.MemberAddress from IssueTable inner join Member on IssueTable.MemberId = Member.MemberId inner join Book on IssueTable.BookId = Book.BookID where IssueDate &lt; getdate() -30 order by IssueDate asc ;
"></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
