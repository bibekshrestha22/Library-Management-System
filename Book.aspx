<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="Kaiser_Library_Management_System.Book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Books Page</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 520px;
        }

        .auto-style8 {
            text-align: right;
            height: 40px;
            width: 191px;
        }

        .auto-style9 {
            width: 447px;
            height: 40px;
        }

        .auto-style10 {
            text-align: right;
            height: 46px;
            width: 191px;
        }

        .auto-style11 {
            height: 46px;
            width: 447px;
        }

        .auto-style12 {
            text-align: right;
            height: 39px;
            width: 191px;
        }

        .auto-style13 {
            width: 447px;
            height: 39px;
        }
        .auto-style14 {
            color: #FFFFFF;
            font-size: large;
        }
        .auto-style15 {
            text-align: right;
            height: 40px;
            width: 191px;
            color: #FF9900;
        }
        .auto-style16 {
            color: #FF9900;
        }
        .auto-style17 {
            color: #FFFFFF;
        }
        .auto-style18 {
            float: left;
            height: 50px;
            padding: 15px 15px;
            font-size: x-large;
            line-height: 20px;
            width: 148px;
            color: #FF0000;
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
        <div class="navbar navbar-inverse navbar-fixed-top" style="left: 0; right: 0; top: 0; height: 137px;">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="auto-style18" runat="server" href="HomePage.aspx">SAVE LIFE
                    </a>&nbsp;<%--                    <asp:HyperLink ID="hpregister" runat="server" NavigateUrl="Register.aspx" Visible="False">Register New Librarian</asp:HyperLink>
                    --%></div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="HomePage.aspx">Home</a></li>
                            <%--<li><a runat="server" href="About.aspx">About</a></li>
                        <li><a runat="server" href="Contact.aspx">Contact</a></li>--%>
                    </ul>
                    <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a runat="server" id="welcome">Welcome,<%: Session["new"].ToString() %>!</a></li>
                            </ul>
                        </AnonymousTemplate>
                    </asp:LoginView>
                </div>
                <div class="pull-right ">
                </div>
            </div>
        </div>
        <div class="jumbotron container-fluid center-block" style="margin-top: 10%; width:100%; background-color:#CB4335 ;">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style15"><span class="auto-style17">Book Name&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtBookName" runat="server" Width="65%" Height="30px"></asp:TextBox>
                    </td>
                    <td rowspan="7">
                        <asp:Label ID="lblwarning" runat="server" Text="Label" CssClass=" label label-info" style="font-size: medium"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style17"> </span> <span class="auto-style14">&nbsp; Book Year of Publish&nbsp;</span><asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="433px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="562px">
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
                    <td class="auto-style8"><span class="auto-style17">Book Stock</span><span class="auto-style16">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtBookStock" runat="server" Width="65%" Height="30px" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"><span class="auto-style17">Author Info</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="ddAuthor" runat="server" DataSourceID="AuthorDataSource" DataTextField="AuthorName" DataValueField="AuthorId" Height="30px" Width="65%">
                        </asp:DropDownList>
                        <asp:Button ID="btnNewAuthor" runat="server" Text="New Author" CssClass="btn btn-primary" OnClick="btnNewAuthor_Click" />
                        <asp:SqlDataSource ID="AuthorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Author]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"><span class="auto-style17">Supplier Info&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="ddSupplier" runat="server" DataSourceID="SupplierDataSource" DataTextField="SupplierName" DataValueField="SupplierId" Height="30px" Width="65%">
                        </asp:DropDownList>
                        <asp:Button ID="btnNewSupplier" runat="server" Text="New Supplier" CssClass="btn btn-primary" OnClick="btnNewSupplier_Click" />
                        <asp:SqlDataSource ID="SupplierDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM [Supplier] WHERE [SupplierId] = @SupplierId" InsertCommand="INSERT INTO [Supplier] ([SupplierId], [SupplierName], [SupplierAddress], [SupplierContact]) VALUES (@SupplierId, @SupplierName, @SupplierAddress, @SupplierContact)" SelectCommand="SELECT * FROM [Supplier]" UpdateCommand="UPDATE [Supplier] SET [SupplierName] = @SupplierName, [SupplierAddress] = @SupplierAddress, [SupplierContact] = @SupplierContact WHERE [SupplierId] = @SupplierId" OnSelecting="SupplierDataSource_Selecting">
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
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"><span class="auto-style17">Book Level&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="ddlBookLevel" runat="server" Width="65%" Height="30px" OnSelectedIndexChanged="ddlBookLevel_SelectedIndexChanged">
                            <asp:ListItem Selected="True">Gold</asp:ListItem>
                            <asp:ListItem>Sliver</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style11">
                        <asp:Button ID="Button1" runat="server" Text="Add New Book" CssClass="btn btn-sm btn-success center-block" OnClick="btnAdd_Click" OnClientClick="return confirm('Add New Book?')" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td class="auto-style13">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
        <div class="container jumbotron container-fluid"  style="background-color:#2874A6"; "width="100%">
            <asp:Label ID="lblSelect" runat="server" Text="Label" CssClass="pull-right text-capitalize text-info text-uppercase"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Selected Book's Id:" CssClass="pull-right text-capitalize text-info"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" OnRowCommand="dataGrid_RowCommand" AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="BookDataSource" CssClass="table table-responsive table-hover" data-toggle="table" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="BookID" HeaderText="BookID" ReadOnly="True" SortExpression="BookID" />
                    <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                    <asp:BoundField DataField="Book_Stock" HeaderText="Book_Stock" SortExpression="Book_Stock" />
                    <asp:BoundField DataField="Book_Level" HeaderText="Book_Level" SortExpression="Book_Level" />
                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                    <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" SortExpression="AuthorID" />
                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                    <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" SortExpression="SupplierID" Visible="False" />
                    <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" SortExpression="SupplierName" />
                    <asp:CommandField ButtonType="Button" HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle CssClass="bnt btn-sm btn-info" />
                    </asp:CommandField>

                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="BookDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT Book.BookID, Book.BookName, Book.Book_Stock, Book.Book_Level, Book.Year, Book.AuthorID, Book.SupplierID, Author.AuthorName, Supplier.SupplierName FROM Book INNER JOIN Author ON Book.AuthorID = Author.AuthorId INNER JOIN Supplier ON Book.SupplierID = Supplier.SupplierId order by Book.Year asc" DeleteCommand="DELETE FROM [Book] WHERE [BookID] = @BookID" InsertCommand="INSERT INTO [Book] ([BookID], [BookName], [Book_Stock], [Book_Level], [Year]) VALUES (@BookID, @BookName, @Book_Stock, @Book_Level, @Year)" UpdateCommand="UPDATE [Book] SET [BookName] = @BookName, [Book_Stock] = @Book_Stock, [Book_Level] = @Book_Level, [Year] = @Year WHERE [BookID] = @BookID">
                <DeleteParameters>
                    <asp:Parameter Name="BookID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="BookID" Type="String" />
                    <asp:Parameter Name="BookName" Type="String" />
                    <asp:Parameter Name="Book_Stock" Type="Int32" />
                    <asp:Parameter Name="Book_Level" Type="String" />
                    <asp:Parameter DbType="Date" Name="Year" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BookName" Type="String" />
                    <asp:Parameter Name="Book_Stock" Type="Int32" />
                    <asp:Parameter Name="Book_Level" Type="String" />
                    <asp:Parameter DbType="Date" Name="Year" />
                    <asp:Parameter Name="BookID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
           </div>
        <div class="jumbotron">
            <h3 class="text-center"> Books Which are 365 days old and are not on loan!</h3>
            <asp:GridView ID="GridView2" CssClass="table table-hover table-responsive table-striped" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="NOloan">
                <Columns>
                    <asp:BoundField DataField="BookID" HeaderText="BookID" ReadOnly="True" SortExpression="BookID" />
                    <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                    <asp:BoundField DataField="Book_Stock" HeaderText="Book_Stock" SortExpression="Book_Stock" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                    <ControlStyle CssClass="btn btn-info" />
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

            <asp:SqlDataSource ID="NOloan" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM Book WHERE (BookID = @BookID)" SelectCommand="select Book.BookID,Book.BookName, Book.[Year], Book.Book_Stock from Book  left join IssueTable on Book.BookID = IssueTable.BookId where Book.[Year]&lt;getdate()-365 and Book.Book_Stock=MaxStock
" UpdateCommand="UPDATE [Book] SET [BookName] = @BookName, [Book_Stock] = @Book_Stock, [Book_Level] = @Book_Level, [Year] = @Year, [AuthorID] = @AuthorID, [SupplierID] = @SupplierID, [MaxStock] = @MaxStock WHERE [BookID] = @BookID">
                <DeleteParameters>
                    <asp:Parameter Name="BookID" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BookName" Type="String" />
                    <asp:Parameter Name="Book_Stock" Type="Int32" />
                    <asp:Parameter Name="Book_Level" Type="String" />
                    <asp:Parameter DbType="Date" Name="Year" />
                    <asp:Parameter Name="AuthorID" Type="String" />
                    <asp:Parameter Name="SupplierID" Type="String" />
                    <asp:Parameter Name="MaxStock" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
