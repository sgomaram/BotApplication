<%@ Page Title="" Language="C#" MasterPageFile="~/CompleteCSM.master" AutoEventWireup="true" CodeFile="OnboardingStep4.aspx.cs" Inherits="OnboardingStep4" %>

<asp:content id="Content2" contentplaceholderid="Step4Pict" runat="server">
  <h1 >Step 4</h1>
   Ask a Question

</asp:content>

<asp:Content ID="Content10" ContentPlaceHolderID="Step4" Runat="Server">
<h5>
    Show me some support links that are important and especially what keywords can be used to find them.  <br />
    If you setup the Service Cloud on Step 2 I'll also make sure to search your Knowledge Base and Articles<br />
    </h5>
    <br />
    <br />

      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SupportlinkId"
           DataSourceID="SupportDS" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="SupportlinkName" HeaderText="Name" SortExpression="SupportlinkName" />
            <asp:BoundField DataField="Supportlink" HeaderText="Support Link" SortExpression="Supportlink" />
            <asp:BoundField DataField="SupportlinkImage" HeaderText="Image" SortExpression="SupportlinkImage" />
            <asp:BoundField DataField="SearchKeywords" HeaderText="Keywords" SortExpression="SearchKeywords" />
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

    <br />
    <br />
     <asp:Button ID="NewSupportLink" Text="Add new Support links" runat="server" CommandName="NewSupportLink" OnClick="NewSupportLink_Click" />

    <asp:SqlDataSource ID="SupportDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [SupportLinks] WHERE [SupportlinkId] = @SupportlinkId" InsertCommand="INSERT INTO [SupportLinks] ([SupportlinkName], [Supportlink], [SupportlinkImage], [CompanyId], [SearchKeywords]) VALUES (@SupportlinkName, @Supportlink, @SupportlinkImage, @CompanyId, @SearchKeywords)" SelectCommand="SELECT * FROM [SupportLinks] where CompanyId = @CompanyId" UpdateCommand="UPDATE [SupportLinks] SET [SupportlinkName] = @SupportlinkName, [Supportlink] = @Supportlink, [SupportlinkImage] = @SupportlinkImage, [CompanyId] = @CompanyId, [SearchKeywords] = @SearchKeywords WHERE [SupportlinkId] = @SupportlinkId">
        <DeleteParameters>
            <asp:Parameter Name="SupportlinkId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SupportlinkName" Type="String" />
            <asp:Parameter Name="Supportlink" Type="String" />
            <asp:Parameter Name="SupportlinkImage" Type="String" />
             <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
            <asp:Parameter Name="SearchKeywords" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SupportlinkName" Type="String" />
            <asp:Parameter Name="Supportlink" Type="String" />
            <asp:Parameter Name="SupportlinkImage" Type="String" />
             <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
            <asp:Parameter Name="SearchKeywords" Type="String" />
            <asp:Parameter Name="SupportlinkId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <asp:DetailsView ID="SupportLinkDetail" runat="server" AutoGenerateRows="False" CellPadding="4" OnItemInserted="SupportLinkDetail_ItemInserted"
        DataKeyNames="SupportlinkId" DataSourceID="SupportDS" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="SupportlinkName" HeaderText="Name" SortExpression="SupportlinkName" />
            <asp:BoundField DataField="Supportlink" HeaderText="Support Link" SortExpression="Supportlink" />
            <asp:BoundField DataField="SupportlinkImage" HeaderText="Image" SortExpression="SupportlinkImage" />
            <asp:BoundField DataField="SearchKeywords" HeaderText="Keywords to Search" SortExpression="SearchKeywords" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>




</asp:Content>
