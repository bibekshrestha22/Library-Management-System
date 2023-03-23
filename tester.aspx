<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tester.aspx.cs" Inherits="Kaiser_Library_Management_System.tester" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Tester</title>
</head>

<body>
   <script src="Scripts/jquery-1.9.1.js"></script>
<script src="Scripts/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="Content/bootstrap.css" rel="stylesheet" />
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="dataGrid" OnRowCommand="dataGrid_RowCommand" CssClass="table table-hover table-inversed table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Width="994px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="dataGrid_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="BookID" HeaderText="BookID" ItemStyle-Width="150px" ReadOnly="True" SortExpression="BookID" >
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="BookName" HeaderText="BookName" ItemStyle-Width="100px" SortExpression="BookName" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Book_Stock" HeaderText="Book_Stock" ItemStyle-Width="100px" SortExpression="Book_Stock" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Book_Level" HeaderText="Book_Level" ItemStyle-Width="100px" SortExpression="Book_Level" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:TemplateField HeaderText="Delete?">
                    <ItemTemplate>
                       
                <asp:Button ID="AddButton" runat="server" CssClass="btn btn-block btn-danger btn-sm" CommandName="DeleteData" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" data-target="#confirmdelete" data-toggle="modal"
                      Text="Select"/> 
                        <asp:Button ID="DeletingButton" runat="server" Text="Delete" data-toggle="modal" OnClientClick="return false" CommandName="DeleteData" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" data-target="#confirmdelete" CssClass="btn btn-block btn-danger btn-sm"/>
                          <div class="modal" id="confirmdelete" tabindex="-1">
                                     <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header" style="background-color: black; color: white ">
                                                    <button class="close"  data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title"> Delete?</h4>
                                                </div>
                                                <div class="modal-body" style="background-color: whitesmoke; color: black">
                                                    <h4> Do you Want to Delete The Selected Book?</h4>
                                                    <asp:Button ID="btnyes" runat="server" Text="Yes" CssClass="btn btn-info btn-sm" OnClick="btnYes_Click" />
                                                    <asp:Button  ID="btnNo" runat="server" Text="No" CssClass="btn btn-info btn-sm" data-dismiss="modal" />
                                               </div>
                                            </div>
                                    </div>   
                               </div>  
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Book]"></asp:SqlDataSource>
    </div>
        <div>

            <asp:Button ID="Button1" runat="server" Text="Delete?" CssClass="btn btn-danger btn-group" OnClick="Button1_Click" />

        </div>    
        <asp:Label ID="Label1" runat="server" Text="Label" data-toggle="modal" data-target="#confirmdelete"></asp:Label>
    </form>
</body>
</html>
