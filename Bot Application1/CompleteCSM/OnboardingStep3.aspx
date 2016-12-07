<%@ Page Title="" Language="C#" MasterPageFile="~/CompleteCSM.master" AutoEventWireup="true" CodeFile="OnboardingStep3.aspx.cs" Inherits="OnboardingStep3" %>

<asp:content id="Content2" contentplaceholderid="Step3Pict" runat="server">
  <h1 >Step 3</h1>
   Product Training

</asp:content>
<asp:Content ID="Content9" ContentPlaceHolderID="Step3" Runat="Server">


    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TraininglinkId" DataSourceID="TrainingDS" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="TraininglinkName" HeaderText="Name" SortExpression="TraininglinkName" />
            <asp:BoundField DataField="Traininglink" HeaderText="Training Link" SortExpression="Traininglink" />
            <asp:BoundField DataField="TraininglinkImage" HeaderText="Image to Display" SortExpression="TraininglinkImage" />
            <asp:BoundField DataField="SearchKeywords" HeaderText="Keywords" SortExpression="SearchKeywords" />
            <asp:TemplateField HeaderText="Initial Order" SortExpression="InitialOrdering">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind ("InitialOrdering") %>'>
                        <asp:ListItem Value="0">Not Prioritized</asp:ListItem>
                        <asp:ListItem Value="1">Show First</asp:ListItem>
                        <asp:ListItem Value="2">Show Second</asp:ListItem>
                        <asp:ListItem Value="3">Show Third</asp:ListItem>
                        <asp:ListItem Value="4">Show fourth</asp:ListItem>
                        <asp:ListItem Value="5">Show Fifth</asp:ListItem>
                        <asp:ListItem Value="6">Show Sixth</asp:ListItem>
                        <asp:ListItem Value="7">Show Seventh</asp:ListItem>
                        <asp:ListItem Value="8">Show Eight</asp:ListItem>
                        <asp:ListItem Value="9">Show Ninth</asp:ListItem>
                        <asp:ListItem Value="10">Show Tenth</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("InitialOrdering") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
     <asp:Button ID="NewTrainingLink" Text="Add new Training links" runat="server" CommandName="NewTrainingLink" OnClick="NewTrainingLink_Click" />

    <asp:SqlDataSource ID="TrainingDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [TrainingLinks] WHERE [TraininglinkId] = @TraininglinkId" InsertCommand="INSERT INTO [TrainingLinks] ([TraininglinkName], [Traininglink], [TraininglinkImage], [CompanyId], [SearchKeywords], [InitialOrdering]) VALUES (@TraininglinkName, @Traininglink, @TraininglinkImage, @CompanyId, @SearchKeywords, @InitialOrdering)" SelectCommand="SELECT [TraininglinkName], [Traininglink], [TraininglinkImage], [CompanyId], [SearchKeywords], [InitialOrdering], [TraininglinkId] FROM [TrainingLinks] where CompanyId = @CompanyId" UpdateCommand="UPDATE [TrainingLinks] SET [TraininglinkName] = @TraininglinkName, [Traininglink] = @Traininglink, [TraininglinkImage] = @TraininglinkImage, [SearchKeywords] = @SearchKeywords, [InitialOrdering] = @InitialOrdering WHERE [TraininglinkId] = @TraininglinkId">
        <DeleteParameters>
            <asp:Parameter Name="TraininglinkId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TraininglinkName" Type="String" />
            <asp:Parameter Name="Traininglink" Type="String" />
            <asp:Parameter Name="TraininglinkImage" Type="String" />
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" />
            <asp:Parameter Name="SearchKeywords" Type="String" />
            <asp:Parameter Name="InitialOrdering" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="TraininglinkName" Type="String" />
            <asp:Parameter Name="Traininglink" Type="String" />
            <asp:Parameter Name="TraininglinkImage" Type="String" />
            <asp:Parameter Name="SearchKeywords" Type="String" />
            <asp:Parameter Name="InitialOrdering" Type="Int32" />
            <asp:Parameter Name="TraininglinkId" Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <asp:DetailsView ID="TrainingLinkDetail" runat="server" AutoGenerateRows="False" CellPadding="4" OnItemInserted="TrainingLinkDetail_ItemInserted"
        DataKeyNames="TraininglinkId" DataSourceID="TrainingDS" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="TraininglinkName" HeaderText="Name" SortExpression="TraininglinkName" />
            <asp:BoundField DataField="Traininglink" HeaderText="Training Link" SortExpression="Traininglink" />
            <asp:BoundField DataField="TraininglinkImage" HeaderText="Image to Show" SortExpression="TraininglinkImage" />
            <asp:BoundField DataField="SearchKeywords" HeaderText="Keywords to Search" SortExpression="SearchKeywords" />
            <asp:TemplateField HeaderText="Initial Order" SortExpression="InitialOrdering">
               
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind ("InitialOrdering") %>'>
                        <asp:ListItem Value="0">Not Prioritized</asp:ListItem>
                        <asp:ListItem Value="1">Show First</asp:ListItem>
                        <asp:ListItem Value="2">Show Second</asp:ListItem>
                        <asp:ListItem Value="3">Show Third</asp:ListItem>
                        <asp:ListItem Value="4">Show fourth</asp:ListItem>
                        <asp:ListItem Value="5">Show Fifth</asp:ListItem>
                        <asp:ListItem Value="6">Show Sixth</asp:ListItem>
                        <asp:ListItem Value="7">Show Seventh</asp:ListItem>
                        <asp:ListItem Value="8">Show Eight</asp:ListItem>
                        <asp:ListItem Value="9">Show Ninth</asp:ListItem>
                        <asp:ListItem Value="10">Show Tenth</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("InitialOrdering") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />           
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>



</asp:Content>
