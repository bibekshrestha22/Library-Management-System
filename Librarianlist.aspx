<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Librarianlist.aspx.cs" Inherits="Kaiser_Library_Management_System.Librarianlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> List of Librarians</title>
</head>
    <link href="Content/bootstrap.css" rel="stylesheet" />
<script src="Scripts/jquery-1.9.1.js"></script>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="HomePage.aspx">Gandaki Library Management System</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="Librarianlist.aspx">View Current Librarians</a></li>--%>
                        <li><a runat="server" href="frmRegister.aspx">Registration Page</a></li>
                        <%--<li><a runat="server" href="frmContact.aspx">Contact</a></li>--%>
                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a runat="server" href="AdminHomePage.aspx">HomePage!</a></li>
                               <%-- <li><a runat="server" href="#">Hi!,<%: Session["new"].ToString() %>!</a></li>--%>
                                <li><a runat="server" data-toggle="modal" data-target="#logoff">Signout?</a></li>
                            </ul>
                        </AnonymousTemplate>
                      
                    </asp:LoginView>
                </div>
            </div>
        </div>
  <%--  <div class="modal" id="logoff" tabindex="-1">
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
                                </div>--%>
    <form id="form1" runat="server">
    <div class="jumbotron" style="margin-top: 10%">
        <asp:GridView CssClass="table table-hover table-responsive table-striped " ID="dglist" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="LibrarianDataSource" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="User Name" SortExpression="username"></asp:BoundField>
                <asp:BoundField DataField="userlevel" HeaderText="User Level" SortExpression="userlevel"></asp:BoundField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" HeaderText="Edit/Delete Record">
                <ControlStyle CssClass="btn btn-sm btn-primary" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <sortedascendingcellstyle backcolor="#F5F7FB" />
            <sortedascendingheaderstyle backcolor="#6D95E1" />
            <sorteddescendingcellstyle backcolor="#E9EBEF" />
            <sorteddescendingheaderstyle backcolor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="LibrarianDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM [Librarian] WHERE [Id] = @original_Id AND [Email] = @original_Email AND [Password] = @original_Password AND [username] = @original_username AND [userlevel] = @original_userlevel" InsertCommand="INSERT INTO [Librarian] ([Id], [Email], [Password], [username], [userlevel]) VALUES (@Id, @Email, @Password, @username, @userlevel)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Librarian]" UpdateCommand="UPDATE [Librarian] SET [Email] = @Email, [Password] = @Password, [username] = @username, [userlevel] = @userlevel WHERE [Id] = @original_Id AND [Email] = @original_Email AND [Password] = @original_Password AND [username] = @original_username AND [userlevel] = @original_userlevel">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_userlevel" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="userlevel" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="userlevel" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_userlevel" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
