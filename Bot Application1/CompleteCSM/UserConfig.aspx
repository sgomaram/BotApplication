<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="UserConfig.aspx.cs" Inherits="UserConfig" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="linkId" DataSourceID="LinksforTraining" style="margin-right: 233px">
            <Columns>
                <asp:BoundField DataField="linkId" HeaderText="linkId" ReadOnly="True" SortExpression="linkId" />
                <asp:BoundField DataField="linkName" HeaderText="linkName" SortExpression="linkName" />
                <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
                <asp:BoundField DataField="linkImage" HeaderText="linkImage" SortExpression="linkImage" />
                <asp:BoundField DataField="linkTypeId" HeaderText="linkTypeId" SortExpression="linkTypeId" />
                <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" SortExpression="CompanyId" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="LinksforTraining" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select * from links where CompanyID = 1 and LinkTypeId=2"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="companyNameLabel" runat="server" Text='<%# Eval("companyName") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="companyNameTextBox" runat="server" Text='<%# Bind("companyName") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="companyNameTextBox" runat="server" Text='<%# Bind("companyName") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="companyNameLabel" runat="server" Text='<%# Eval("companyName") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">Id</th>
                                    <th runat="server">companyName</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="companyNameLabel" runat="server" Text='<%# Eval("companyName") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:MultiView ID="MultiView1" runat="server">
        </asp:MultiView>
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        <asp:TreeView ID="TreeView1" runat="server" ImageSet="Arrows">
            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
            <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
            <ParentNodeStyle Font-Bold="False" />
            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
        </asp:TreeView>
        <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#7C6F57" StaticSubMenuIndent="10px">
            <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#F7F6F3" />
            <DynamicSelectedStyle BackColor="#5D7B9D" />
            <Items>
                <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="New Item" Value="New Item">
                    <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#5D7B9D" />
            <StaticItemTemplate>
                <%# Eval("Text") %>
            </StaticItemTemplate>
        </asp:Menu>
        <asp:SiteMapPath ID="SiteMapPath1" runat="server">
        </asp:SiteMapPath>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        </asp:UpdatePanel>
        <div style="height: 134px; margin-top: 0px">
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Company]"></asp:SqlDataSource>
    </form>
</body>
</html>
