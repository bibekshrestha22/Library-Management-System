<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookAuthorInfo.aspx.cs" Inherits="Kaiser_Library_Management_System.Book_Author_Info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book & Author Page</title>
</head>
<body style="font-family:'Abel',sans-serif">
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet" />
    <form id="form1" runat="server">
       <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="HomePage.aspx">kaiser Library Management System</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                       <li><a runat="server" href="Book.aspx">Book</a></li>
                        <li><a runat="server" href="Author.aspx">Author</a></li>
                        <li><a runat="server" href="Member.aspx">Member</a></li>
                        <li><a runat="server" href="Borrow.aspx">Borrow</a></li>
                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <ul class="nav navbar-nav navbar-right">
                                <%--<li><a runat="server"  href="#" >Register</a></li>--%>
                                <li><a runat="server" id="welcome">Welcome, <%--<%: Session["new"].ToString() %>!--%></a></li>
                                <li><a runat="server" href="#" data-toggle="modal" data-target="#logoff">Signout</a></li>
                                <div class="modal" id="logoff" tabindex="-1">
                                     <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header" style="background-color: black; color: white ">
                                                    <button class="close"  data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title"> Sign out?</h4>
                                                </div>
                                                <div class="modal-body" style="background-color: whitesmoke; color: black">
                                                    <h4> Do you Want to Signout?</h4>
                                                    <asp:Button ID="btnyes" runat="server" Text="Yes" CssClass="btn btn-info btn-sm" OnClick="btnyes_Click"/>
                                                    <asp:Button  ID="btnNo" runat="server" Text="No" CssClass="btn btn-info btn-sm" data-dismiss="modal" />
                                               </div>
                                            </div>
                                    </div>   
                               </div>    
                            </ul>
                        </AnonymousTemplate>
                    </asp:LoginView>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="jumbotron" style="margin-top:4%">

        </div>
        <div class="jumbotron">

            <asp:GridView ID="GridView1" CssClass="table table-hover table-striped table-responsive" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID,AuthorId,BookID" DataSourceID="BookAuthorInfo" ForeColor="Black" GridLines="Horizontal" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" />
                    <asp:BoundField DataField="AuthorId" HeaderText="AuthorId" ReadOnly="True" SortExpression="AuthorId" />
                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                    <asp:BoundField DataField="BookID" HeaderText="BookID" ReadOnly="True" SortExpression="BookID" />
                    <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                    <asp:CommandField ButtonType="Button" HeaderText="EDIT/DELETE DATA" ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-sm btn-primary" />
                    </asp:CommandField>
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
            <asp:SqlDataSource ID="BookAuthorInfo" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM [BookAuthorInfo] WHERE [ID] = @ID" InsertCommand="INSERT INTO [BookAuthorInfo] ([ID], [AuthorId], [BookId]) VALUES (@ID, @AuthorId, @BookId)" SelectCommand="SELECT Author.AuthorName, Book.BookName, BookAuthorInfo.ID, Author.AuthorId, Book.BookID FROM BookAuthorInfo INNER JOIN Author ON BookAuthorInfo.AuthorId = Author.AuthorId INNER JOIN Book ON BookAuthorInfo.BookId = Book.BookID" UpdateCommand="UPDATE [BookAuthorInfo] SET [AuthorId] = @AuthorId, [BookId] = @BookId WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="AuthorId" Type="String" />
                    <asp:Parameter Name="BookId" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AuthorId" Type="String" />
                    <asp:Parameter Name="BookId" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
