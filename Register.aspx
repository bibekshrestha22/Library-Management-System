<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Kaiser_Library_Management_System.frmRegister" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<link href="Content/bootstrap.css" rel="stylesheet" />
<script src="Scripts/jquery-1.9.1.js"></script>

<body style="background-color:#C0392B">

    <p>
        .</p>

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="auto-style33" runat="server" href="AdminHomePage.aspx">Save Life Blood-Bank Management System</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a runat="server" href="Book.aspx">Book</a></li>
                    <li><a runat="server" href="Author.aspx">Author</a></li>
                    <li><a runat="server" href="Member.aspx">Member</a></li>
                    <li><a runat="server" href="IssueBook.aspx">Issue Book</a></li>
                  <%--  <li><a runat="server" href="Librarianlist.aspx">View Current Librarians</a></li>
                   --%> <%--li><a runat="server" href="Contact.aspx">Contact</a></li>--%>
                </ul>
                <asp:LoginView runat="server" ViewStateMode="Disabled">
                    <AnonymousTemplate>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a runat="server" href="AdminHomePage.aspx">HomePage!</a></li>
                            <li><a runat="server" href="#">Hi!,<%: Session["new"].ToString() %>!</a></li>
                            
                        </ul>
                    </AnonymousTemplate>

                </asp:LoginView>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">
        <%--<div id ="title " style="height: 40px;  text-align:center; color:White; vertical-align:central; width: 100%;" >  
        <h1 style="height: 68px; ">Registrarion Form</h1>
    </div>  --%>
        <style>
            body {
                background-color: lightgray;
            }

            /*.jumbotron {
            max-width: 50%;
            margin-top: 5%;
            max-height: 500%;
        }*/
            .auto-style1 {
                width: 100%;
                height: 239px;
            }

            .auto-style2 {
                color: #808080;
                text-align: left;
                width: 517px;
                height: 56px;
            }

            .auto-style16 {
                height: 56px;
            }

            .auto-style17 {
                height: 56px;
                text-align: center;
                width: 136px;
            }

            .auto-style21 {
                color: #000000;
                text-align: right;
                width: 517px;
                height: 62px;
            }

            .auto-style22 {
                height: 62px;
                width: 136px;
            }

            .auto-style23 {
                height: 62px;
            }

            .auto-style24 {
                color: #000000;
                text-align: right;
                width: 517px;
                height: 34px;
            }

            .auto-style25 {
                height: 34px;
                width: 136px;
            }

            .auto-style26 {
                height: 34px;
            }

            .auto-style27 {
                color: #000000;
                text-align: right;
                width: 517px;
                height: 63px;
            }

            .auto-style28 {
                height: 63px;
                width: 136px;
            }

            .auto-style29 {
                height: 63px;
            }

            .auto-style30 {
                color: #000000;
                text-align: right;
                width: 517px;
                height: 53px;
            }

            .auto-style31 {
                height: 53px;
                width: 136px;
            }

            .auto-style32 {
                height: 53px;
            }
            .auto-style33 {
                float: left;
                height: 50px;
                padding: 15px 15px;
                font-size: x-large;
                line-height: 20px;
                color: #FF0000;
            }
            .auto-style34 {
                color: #000000;
            }
        </style>
        <br />
        <br />
        <div class="jumbotron">
            <div id="title1" style="height: 40px; text-align: center; color: black; vertical-align: central; width: 100%;">
                <h1 style="height: 68px;">Fill the following details to Register!</h1>
            </div>
            <table class="auto-style1 table-hover table table-responsive table-striped" style="padding-top: 20px; margin-top: 30px">
                <tr>
                    <td class="auto-style21" style="font-family: 'Times New Roman', Times, serif">Username&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style22">
                        <asp:TextBox ID="txtUsername" runat="server" Height="28px" Width="248px"></asp:TextBox>
                    </td>
                    <td class="auto-style23">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="User name is required!" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24" style="font-family: 'Times New Roman', Times, serif">Email&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style25">
                        <asp:TextBox ID="txtEmail" runat="server" Height="28px" Width="248px"></asp:TextBox>
                    </td>
                    <td class="auto-style26">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required!" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email Address!" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style27" style="font-family: 'Times New Roman', Times, serif">Password&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style28">
                        <asp:TextBox ID="txtPass" runat="server" Height="28px" Width="248px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style29">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Password is required!" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30" style="font-family: 'Times New Roman', Times, serif">Confirm Password&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style31">
                        <asp:TextBox ID="txtCpass" runat="server" Height="28px" Width="248px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style32" style="font-family: 'Times New Roman', Times, serif">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCpass" ErrorMessage="Password Should be Confirmed!" Font-Bold="True" ForeColor="Red" CssClass="auto-style34"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtCpass" ErrorMessage="Passwords Must Match!" Font-Bold="True" ForeColor="Red" CssClass="auto-style34"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30" style="font-family: 'Times New Roman', Times, serif">User level&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                        (Level 2 : Add/Update Book/Member Info,&nbsp;&nbsp;&nbsp;
                        <br />
                        Level 3: Add/Update Member Info only&nbsp; )&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style31">
                        <asp:DropDownList ID="DDUserlevel" runat="server" Height="35px" Width="248px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style32" style="font-family: 'Times New Roman', Times, serif">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDUserlevel" ErrorMessage="Userlevel Must  be Selected" Font-Bold="True" ForeColor="Red" CssClass="auto-style34"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" CssClass="btn btn-primary btn-sm center-block" Text="Register" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<br />
                        <asp:Label ID="lblwarning" runat="server" Text="Label" Visible="False" CssClass="alert-danger"></asp:Label>
                    </td>
                    <td class="auto-style16"></td>
                </tr>
            </table>
        </div>
        <div class="jumbotron">

        <asp:GridView CssClass="table table-hover table-responsive table-striped " ID="dglist" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="LibrarianDataSource" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username"></asp:BoundField>
                <asp:BoundField DataField="userlevel" HeaderText="userlevel" SortExpression="userlevel"></asp:BoundField>
                <asp:CommandField ButtonType="Button" HeaderText="Actions" ShowDeleteButton="True" ShowEditButton="True">
                <ControlStyle CssClass="btn btn-info" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <sortedascendingcellstyle backcolor="#FEFCEB" />
            <sortedascendingheaderstyle backcolor="#AF0101" />
            <sorteddescendingcellstyle backcolor="#F6F0C0" />
            <sorteddescendingheaderstyle backcolor="#7E0000" />
        </asp:GridView>
        &nbsp;<asp:SqlDataSource ID="LibrarianDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM [Librarian] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Librarian] ([Id], [Email], [Password], [username], [userlevel]) VALUES (@Id, @Email, @Password, @username, @userlevel)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Librarian]" UpdateCommand="UPDATE [Librarian] SET [Email] = @Email, [Password] = @Password, [username] = @username, [userlevel] = @userlevel WHERE [Id] = @original_Id">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="String" />
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
            </UpdateParameters>
        </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
