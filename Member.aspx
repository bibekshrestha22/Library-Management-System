<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="Kaiser_Library_Management_System.frmMember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Members Page</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 238px;
        }

        .auto-style3 {
            width: 282px;
        }

        .auto-style5 {
            height: 45px;
            width: 500px;
            text-align: center;
        }

        .auto-style6 {
            width: 500px;
            text-align: center;
        }
        .auto-style7 {
            text-align: right;
            font-size: medium;
            width: 282px;
            height: 45px;
            color: #FF9900;
        }
        .auto-style8 {
            width: 669px;
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
        <div style="background-color:black" class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="HomePage.aspx">Kaiser Library&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image1" runat="server" Height="59px" ImageUrl="~/ResourceImages/bibek.PNG" Width="211px" />
                    </a>&nbsp;</div>
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
                                <li><a runat="server"  href="MemberInfo.aspx" >Member Loan Book Info</a></li>
                                <li><a runat="server" id="welcome">Welcome, <%: Session["new"].ToString() %>!</a></li>
                                <li><a runat="server" href="#" data-toggle="modal" data-target="#logoff">Signout</a></li>
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
                            </ul>
                        </AnonymousTemplate>
                    </asp:LoginView>
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
        <div class="jumbotron" style="background-color:black">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style7">Member Name</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtMemberName" runat="server" Height="70%" Width="80%"></asp:TextBox>
                    </td>
                    <td rowspan="4" class="auto-style8">
                        <asp:Label ID="lblInfo" runat="server" Text="Label" CssClass="label label-info" Style="font-size: medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">Member&#39;s Address</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtAddress" runat="server" Height="70%" Width="80%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">Contact</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtContact" runat="server" Height="70%" Width="80%" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">Type</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlType" runat="server" Height="70%" Width="80%">
                            <asp:ListItem>Gold</asp:ListItem>
                            <asp:ListItem>Sliver</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Button ID="btnAddMember" runat="server" Text="Add" CssClass="btn btn-sm btn-success center-block" OnClientClick="return confirm('Add New Member?')" OnClick="btnAddMember_Click" style="background-color: #3366FF" />
                        <%--<asp:Button ID="btnAddMember" runat="server" Text="Add Member" CssClass="btn btn-success" OnClientClick="reurn Confirm('Do You want to add a new Member?')" />--%>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
            </table>
        </div>
        <div class="jumbotron" style="background-color:black">

            <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive table-striped table-hover" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MemberId" DataSourceID="MemberSource" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="MemberId" HeaderText="MemberId" ReadOnly="True" SortExpression="MemberId" />
                    <asp:BoundField DataField="MemberName" HeaderText="MemberName" SortExpression="MemberName" />
                    <asp:BoundField DataField="MemberAddress" HeaderText="MemberAddress" SortExpression="MemberAddress" />
                    <asp:BoundField DataField="MemberPhone" HeaderText="MemberPhone" SortExpression="MemberPhone" />
                    <asp:BoundField DataField="Member_Type" HeaderText="Member_Type" SortExpression="Member_Type" />
                    <asp:CommandField ButtonType="Button" HeaderText="Edit/Delete Action" ShowDeleteButton="True" ShowEditButton="True">
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
            <asp:SqlDataSource ID="MemberSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [MemberId] = @MemberId" InsertCommand="INSERT INTO [Member] ([MemberId], [MemberName], [MemberAddress], [MemberPhone], [Member_Type]) VALUES (@MemberId, @MemberName, @MemberAddress, @MemberPhone, @Member_Type)" SelectCommand="SELECT * FROM [Member]" UpdateCommand="UPDATE [Member] SET [MemberName] = @MemberName, [MemberAddress] = @MemberAddress, [MemberPhone] = @MemberPhone, [Member_Type] = @Member_Type WHERE [MemberId] = @MemberId">
                <DeleteParameters>
                    <asp:Parameter Name="MemberId" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MemberId" Type="String" />
                    <asp:Parameter Name="MemberName" Type="String" />
                    <asp:Parameter Name="MemberAddress" Type="String" />
                    <asp:Parameter Name="MemberPhone" Type="Decimal" />
                    <asp:Parameter Name="Member_Type" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MemberName" Type="String" />
                    <asp:Parameter Name="MemberAddress" Type="String" />
                    <asp:Parameter Name="MemberPhone" Type="Decimal" />
                    <asp:Parameter Name="Member_Type" Type="String" />
                    <asp:Parameter Name="MemberId" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
