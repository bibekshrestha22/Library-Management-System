<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="okay.aspx.cs" Inherits="Kaiser_Library_Management_System.okay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AuthorId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="AuthorId" HeaderText="AuthorId" ReadOnly="True" SortExpression="AuthorId" />
                <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="btn_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Author]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
