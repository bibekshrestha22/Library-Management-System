<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="Kaiser_Library_Management_System.frmSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: inherit;
            text-align: right;
            margin-bottom: 30px;
            padding-top: 48px;
            padding-bottom: 48px;
            background-color: #eee;
        }
        .auto-style2 {
            margin-right: 9px;
            margin-top: 42px;
            margin-bottom: 0px;
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
                    <a class="navbar-brand" runat="server" href="#">Kaiser Library&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image1" runat="server" Height="58px" ImageUrl="~/ResourceImages/bibek.PNG" Width="184px" />
                    </a>&nbsp;<%--                    <asp:HyperLink ID="hpregister" runat="server" NavigateUrl="Register.aspx" Visible="False">Register New Librarian</asp:HyperLink>
                    --%></div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="Book.aspx">Book</a></li>
                        <li><a runat="server" href="Author.aspx">Author</a></li>--%>
                        <li><a runat="server" href="Member.aspx">Member</a></li>
                        <li><a runat="server" href="IssueBook.aspx">Issue Book</a></li>
                        <li><a runat="server" href="ReturnBook">Return Book</a></li>
                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <li><a runat="server" id="Mylink" href="Register.aspx" visible="False">Register a new Librarian!</a></li>
                            <ul class="nav navbar-nav navbar-right">
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
        <br />
        <br />
        <br />
        <br />
        <div class="auto-style1 pull-right" style="background-color:#2E86C1;">

            <asp:DetailsView ID="DetailsView1"  runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="SupplierId" DataSourceID="Supplier" ForeColor="Black" GridLines="Horizontal" Height="191px" Width="501px" CssClass="auto-style2">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="Black" />
                <Fields>
                    <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" ReadOnly="True" SortExpression="SupplierId" />
                    <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" SortExpression="SupplierName" />
                    <asp:BoundField DataField="SupplierAddress" HeaderText="SupplierAddress" SortExpression="SupplierAddress" />
                    <asp:BoundField DataField="SupplierContact" HeaderText="SupplierContact" SortExpression="SupplierContact" />
                    <asp:CommandField ButtonType="Button" NewText="Add Supplier" ShowInsertButton="True">
                    <ControlStyle CssClass="btn btn-success" />
                    </asp:CommandField>
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>

        </div>
        <div class="jumbotron"style="background-color:#2E86C1">

            <asp:GridView ID="gvSupplierInfo" CssClass="table table-hover table-responsive" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SupplierId" DataSourceID="Supplier">
                <Columns>
                    <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" ReadOnly="True" SortExpression="SupplierId" />
                    <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" SortExpression="SupplierName" />
                    <asp:BoundField DataField="SupplierAddress" HeaderText="SupplierAddress" SortExpression="SupplierAddress" />
                    <asp:BoundField DataField="SupplierContact" HeaderText="SupplierContact" SortExpression="SupplierContact" />
                    <asp:CommandField ButtonType="Button" HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-warning" />
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

            <asp:SqlDataSource ID="Supplier" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM [Supplier] WHERE [SupplierId] = @SupplierId" InsertCommand="INSERT INTO [Supplier] ([SupplierId], [SupplierName], [SupplierAddress], [SupplierContact]) VALUES (@SupplierId, @SupplierName, @SupplierAddress, @SupplierContact)" SelectCommand="SELECT * FROM [Supplier]" UpdateCommand="UPDATE [Supplier] SET [SupplierName] = @SupplierName, [SupplierAddress] = @SupplierAddress, [SupplierContact] = @SupplierContact WHERE [SupplierId] = @SupplierId">
                <DeleteParameters>
                    <asp:Parameter Name="SupplierId" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SupplierId" Type="String" />
                    <asp:Parameter Name="SupplierName" Type="String" />
                    <asp:Parameter Name="SupplierAddress" Type="String" />
                    <asp:Parameter Name="SupplierContact" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SupplierName" Type="String" />
                    <asp:Parameter Name="SupplierAddress" Type="String" />
                    <asp:Parameter Name="SupplierContact" Type="String" />
                    <asp:Parameter Name="SupplierId" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
