<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Author.aspx.cs" Inherits="Kaiser_Library_Management_System.Author" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Authors Page</title>
    <style type="text/css">
        .auto-style1 {
            width: 371px;
        }

        .auto-style2 {
            text-align: center;
            width: 364px;
        }

        .auto-style3 {
            width: 371px;
            height: 50px;
        }

        .auto-style4 {
            text-align: center;
            width: 364px;
            height: 50px;
        }

        .auto-style5 {
            text-align: left;
            height: 50px;
        }

        .auto-style6 {
            width: 100%;
            height: 95px;
        }
        .auto-style7 {
            float: left;
            height: 50px;
            padding: 15px 15px;
            font-size: xx-large;
            line-height: 20px;
            width: 228px;
            color: #FF0000;
        }
    </style>
</head>
<body style="background-color:black">
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
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
                    <a class="auto-style7" runat="server" href="HomePage.aspx">SAVE LIFE</a>&nbsp;</div>
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
                                <li><a runat="server" id="welcome">Welcome, <%: Session["new"].ToString() %>!</a></li>
                                <li><a runat="server" href="#" data-toggle="modal" data-target="#logoff">Signout</a></li>
                               
                            </ul>
                        </AnonymousTemplate>
                    </asp:LoginView>
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
        </div>
        <div class="jumbotron" style="background-color:#CB4335">

            <table class="auto-style6">
                <tr>
                    <td class="auto-style3"><strong>Author Name</strong></td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtAuthorname" runat="server" Width="70%"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblWarning" runat="server" Text="Label" CssClass="text-info"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="btnAddAuthor" runat="server" Text="Add New Author" CssClass="btn btn-sm btn-success center-block" OnClick="btnAdd_Click" OnClientClick="return confirm('Add New Author?')" style="background-color: #000000" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
        <div class="jumbotron" style="background-color:#CB4335">
            <asp:Label ID="lblSelect" runat="server" Text="Label" CssClass="pull-right text-capitalize text-info text-uppercase"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Selected Book's Id:" CssClass="pull-right text-capitalize text-info"></asp:Label>
            <asp:GridView ID="GridView1" OnRowCommand="dataGrid_RowCommand" runat="server" CssClass="table table-hover table-responsive table-stripped" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="AuthorId" DataSourceID="AuthorDataSource" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="AuthorId" HeaderText="AuthorId" ReadOnly="True" SortExpression="AuthorId" />
                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-info" HeaderText="Edit?">
                        <ControlStyle CssClass="btn btn-sm btn-info"></ControlStyle>
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="Select/Delete">
                        <ItemTemplate>
                            <asp:Button ID="btnSelect" runat="server" CssClass="btn btn-block btn-danger btn-sm" CommandName="DeleteData" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Select" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" data-toggle="modal" data-target="#confirmdelete" OnClientClick="return false" CssClass="btn btn-block btn-danger btn-sm" />
                            <div class="modal" id="confirmdelete" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: black; color: white">
                                            <button class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Delete?</h4>
                                        </div>
                                        <div class="modal-body" style="background-color: whitesmoke; color: black">
                                            <h4>Do you Want to Delete The Selected Author?</h4>
                                            <asp:Button ID="btnyes" runat="server" Text="Yes" CssClass="btn btn-info btn-sm" OnClick="btnYes_Click" />
                                            <asp:Button ID="btnNo" runat="server" Text="No" CssClass="btn btn-info btn-sm" data-dismiss="modal" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <asp:SqlDataSource ID="AuthorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM [Author] WHERE [AuthorId] = @AuthorId" InsertCommand="INSERT INTO [Author] ([AuthorId], [AuthorName]) VALUES (@AuthorId, @AuthorName)" SelectCommand="SELECT * FROM [Author]" UpdateCommand="UPDATE [Author] SET [AuthorName] = @AuthorName WHERE [AuthorId] = @AuthorId">
                <DeleteParameters>
                    <asp:Parameter Name="AuthorId" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AuthorId" Type="String" />
                    <asp:Parameter Name="AuthorName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AuthorName" Type="String" />
                    <asp:Parameter Name="AuthorId" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
