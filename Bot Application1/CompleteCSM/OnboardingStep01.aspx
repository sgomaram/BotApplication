<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OnboardingStep01.aspx.cs" Inherits="OnboardingStep01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       




    </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetUsers" TypeName="TemplatesTableAdapters.UsersTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_UserId" Type="Int32" />
                <asp:Parameter Name="Original_UserName" Type="String" />
                <asp:Parameter Name="Original_Email" Type="String" />
                <asp:Parameter Name="Original_TextPhone" Type="String" />
                <asp:Parameter Name="Original_OfficePhone" Type="String" />
                <asp:Parameter Name="Original_CompanyId" Type="Int32" />
                <asp:Parameter Name="Original_BusinessName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TextPhone" Type="String" />
                <asp:Parameter Name="OfficePhone" Type="String" />
                <asp:Parameter Name="CompanyId" Type="Int32" />
                <asp:Parameter Name="BusinessName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TextPhone" Type="String" />
                <asp:Parameter Name="OfficePhone" Type="String" />
                <asp:Parameter Name="CompanyId" Type="Int32" />
                <asp:Parameter Name="BusinessName" Type="String" />
                <asp:Parameter Name="Original_UserId" Type="Int32" />
                <asp:Parameter Name="Original_UserName" Type="String" />
                <asp:Parameter Name="Original_Email" Type="String" />
                <asp:Parameter Name="Original_TextPhone" Type="String" />
                <asp:Parameter Name="Original_OfficePhone" Type="String" />
                <asp:Parameter Name="Original_CompanyId" Type="Int32" />
                <asp:Parameter Name="Original_BusinessName" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserId" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" ReadOnly="True" SortExpression="UserId" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="TextPhone" HeaderText="TextPhone" SortExpression="TextPhone" />
                <asp:BoundField DataField="OfficePhone" HeaderText="OfficePhone" SortExpression="OfficePhone" />
                <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" SortExpression="CompanyId" />
                <asp:BoundField DataField="BusinessName" HeaderText="BusinessName" SortExpression="BusinessName" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="UserId" DataSourceID="ObjectDataSource1" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" ReadOnly="True" SortExpression="UserId" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="TextPhone" HeaderText="TextPhone" SortExpression="TextPhone" />
                <asp:BoundField DataField="OfficePhone" HeaderText="OfficePhone" SortExpression="OfficePhone" />
                <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" SortExpression="CompanyId" />
                <asp:BoundField DataField="BusinessName" HeaderText="BusinessName" SortExpression="BusinessName" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </form>
</body>
</html>
