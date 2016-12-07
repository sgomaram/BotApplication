<%@ Page Title="" Language="C#" MasterPageFile="~/CompleteCSM.master" AutoEventWireup="true" CodeFile="OnboardingStep5.aspx.cs" Inherits="OnboardingStep5" %>



<asp:content id="Content2" contentplaceholderid="Step5Pict" runat="server">
    <h1 >Step 5</h1>
   Meet with an Expert

</asp:content>
<asp:Content ID="Content6" ContentPlaceHolderID="Step5" Runat="Server">

    <table><tr><td>
    <h5>
    Tell me about your Service Offerings, what they cost, and where is the glossy link.   <br />
    Use the Search KeyWords so that I can understand what the user ask and give them the relevant offering. <br />
    </h5>
    <br />
    <br />

      <asp:GridView ID="ServiceOfferingGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
           DataSourceID="ServiceDS" ForeColor="#333333" GridLines="None" DataKeyNames="ServiceOffId">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />           
            <asp:BoundField DataField="ServiceOffName" HeaderText="Name" SortExpression="ServiceOffName" />
            <asp:BoundField DataField="ServiceOffDesc" HeaderText="Description" SortExpression="ServiceOffDesc" />
            <asp:BoundField DataField="SearchKeywords" HeaderText="Keywords" SortExpression="SearchKeywords" />
            <asp:BoundField DataField="ServiceOffCost" HeaderText="Cost" SortExpression="ServiceOffCost" />
            <asp:BoundField DataField="ServiceOffLink" HeaderText="Offering Link" SortExpression="ServiceOffLink" />
            <asp:BoundField DataField="ServiceOffImage" HeaderText="Image" SortExpression="ServiceOffImage" />
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
     <asp:Button ID="NewServiceOffering" Text="Add new Service Offering" runat="server" CommandName="NewServiceOffering" OnClick="NewServiceOffering_Click" />

    <asp:SqlDataSource ID="ServiceDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [ServiceOfferings] WHERE [ServiceOffId] = @ServiceOffId" 
        InsertCommand="INSERT INTO [ServiceOfferings] ([ServiceOffName], [ServiceOffDesc], [SearchKeywords],[ServiceOffCost], [ServiceOffLink], [CompanyId], [ServiceOffImage]) VALUES (@ServiceOffName, @ServiceOffDesc, @SearchKeywords, @ServiceOffCost, @ServiceOffLink, @CompanyId, @ServiceOffImage)" 
        SelectCommand="SELECT [ServiceOffId],[ServiceOffName], [ServiceOffDesc], [SearchKeywords],[ServiceOffCost], [ServiceOffLink], [CompanyId], [ServiceOffImage] FROM [ServiceOfferings] where CompanyId = @CompanyId" 
        UpdateCommand="UPDATE [ServiceOfferings] SET [ServiceOffName] = @ServiceOffName, [ServiceOffDesc] = @ServiceOffDesc, [SearchKeywords] = @SearchKeywords, [ServiceOffCost] = @ServiceOffCost, [ServiceOffLink] = @ServiceOffLink, [ServiceOffImage] = @ServiceOffImage WHERE [ServiceOffId] = @ServiceOffId">
        <DeleteParameters>
            <asp:Parameter Name="ServiceOffId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ServiceOffName" Type="String" />
            <asp:Parameter Name="ServiceOffDesc" Type="String" />
            <asp:Parameter Name="SearchKeywords" Type="String" />
            <asp:Parameter Name="ServiceOffCost" Type="String" />
            <asp:Parameter Name="ServiceOffLink" Type="String" />
             <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
            <asp:Parameter Name="ServiceOffImage" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ServiceOffName" Type="String" />
             <asp:Parameter Name="ServiceOffDesc" Type="String" />
            <asp:Parameter Name="SearchKeywords" Type="String" />
            <asp:Parameter Name="ServiceOffCost" Type="String" />
            <asp:Parameter Name="ServiceOffLink" Type="String" />
            <asp:Parameter Name="ServiceOffImage" Type="String" />
            <asp:Parameter Name="ServiceOffId" Type="Int32" />
             <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
        </UpdateParameters>
    </asp:SqlDataSource>

 </td><td>
    <asp:Label ID="solabel" runat="server" Text="Please tell me about a new Service Offering."></asp:Label>
    <asp:DetailsView ID="ServiceOfferingDetail" runat="server" AutoGenerateRows="False" CellPadding="4" 
        OnItemInserted="ServiceOfferingDetail_ItemInserted" DataSourceID="ServiceDS" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="ServiceOffName" HeaderText="Name" SortExpression="ServiceOffName" />
            <asp:BoundField DataField="ServiceOffDesc" HeaderText="Description" SortExpression="ServiceOffDesc" />
            <asp:BoundField DataField="SearchKeywords" HeaderText="Keywords" SortExpression="SearchKeywords" />
            <asp:BoundField DataField="ServiceOffCost" HeaderText="Cost" SortExpression="ServiceOffCost" />
            <asp:BoundField DataField="ServiceOffLink" HeaderText="Offering Link" SortExpression="ServiceOffLink" />
            <asp:BoundField DataField="ServiceOffImage" HeaderText="Image" SortExpression="ServiceOffImage" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>

   
        </td></tr>
        <tr><td>

    <br /><br /><br />

        <h5> What are the upcoming Expert Sessions, Webinars, or Training Courses that I can tell users about? <br />
    </h5>
    <br />
    <br />

      <asp:GridView ID="ExpertSessionGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
           DataSourceID="ExpertSessionDS" ForeColor="#333333" GridLines="None" DataKeyNames="ExpertTimeSlotId">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ExpertTimeSlotName" HeaderText="Expert Time Slot Name" SortExpression="ExpertTimeSlotName" />
            <asp:BoundField DataField="ExpertTimeSlotDesc" HeaderText="Desc" SortExpression="ExpertTimeSlotDesc" />
            <asp:BoundField DataField="SearchKeywords" HeaderText="Keywords" SortExpression="SearchKeywords" />
            <asp:BoundField DataField="ExpertTimeSlotDate" HeaderText="Date" SortExpression="ExpertTimeSlotDate" />
            <asp:TemplateField HeaderText="Type of Session" SortExpression="ExpertTimeSlotType">
                <EditItemTemplate>
                      <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind ("ExpertTimeSlotType") %>'>
                        <asp:ListItem Value="0">Other</asp:ListItem>
                        <asp:ListItem Value="1">Webinar</asp:ListItem>
                        <asp:ListItem Value="2">Training Course</asp:ListItem>
                        <asp:ListItem Value="3">Expert Session</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                     <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Enabled="false" SelectedValue='<%# Bind ("ExpertTimeSlotType") %>'>
                        <asp:ListItem Value="0">Other</asp:ListItem>
                        <asp:ListItem Value="1">Webinar</asp:ListItem>
                        <asp:ListItem Value="2">Training Course</asp:ListItem>
                        <asp:ListItem Value="3">Expert Session</asp:ListItem>
                    </asp:DropDownList>
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
     <asp:Button ID="NewExpertSession" Text="Add new Expert Session" runat="server" CommandName="NewExpertSession" OnClick="NewExpertSession_Click" />


            </td><td>
   
<asp:Label ID="exlabel" runat="server" Text="Please tell me about a new Session for your user and what is the forum?"></asp:Label>
                
    <asp:DetailsView ID="ExpertSessionDetail" runat="server" AutoGenerateRows="False" CellPadding="4" 
        OnItemInserted="ExpertSessionDetail_ItemInserted" DataSourceID="ExpertSessionDS" ForeColor="#333333" 
        GridLines="None" Height="50px" Width="125px" DataKeyNames="ExpertTimeSlotId">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="ExpertTimeSlotName" HeaderText="Name" SortExpression="ExpertTimeSlotName" />
            <asp:BoundField DataField="ExpertTimeSlotDesc" HeaderText="Description" SortExpression="ExpertTimeSlotDesc" />
            <asp:BoundField DataField="SearchKeywords" HeaderText="Keywords" SortExpression="SearchKeywords" />
            <asp:BoundField DataField="ExpertTimeSlotDate" HeaderText="Date" SortExpression="ExpertTimeSlotDate" />
            <asp:TemplateField HeaderText="Type of Session" SortExpression="ExpertTimeSlotType">
                 <InsertItemTemplate>
                   <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind ("ExpertTimeSlotType") %>'>
                        <asp:ListItem Value="0">Other</asp:ListItem>
                        <asp:ListItem Value="1">Webinar</asp:ListItem>
                        <asp:ListItem Value="2">Training Course</asp:ListItem>
                        <asp:ListItem Value="3">Expert Session</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExpertTimeSlotType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
             </td></tr></table>



        <asp:SqlDataSource ID="ExpertSessionDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [ExpertTimeSlots] WHERE [ExpertTimeSlotId] = @ExpertTimeSlotId" 
        InsertCommand="INSERT INTO [ExpertTimeSlots] ([ExpertTimeSlotDesc], [ExpertTimeSlotName], [SearchKeywords], [ExpertTimeSlotDate], [CompanyId], [ExpertTimeSlotType]) VALUES (@ExpertTimeSlotDesc, @ExpertTimeSlotName, @SearchKeywords, @ExpertTimeSlotDate, @CompanyId, @ExpertTimeSlotType)" 
        SelectCommand="SELECT [ExpertTimeSlotId], [ExpertTimeSlotDesc], [ExpertTimeSlotName], [SearchKeywords], [ExpertTimeSlotDate], [CompanyId], [ExpertTimeSlotType] FROM [ExpertTimeSlots] where CompanyId = @CompanyId" 
        UpdateCommand="UPDATE [ExpertTimeSlots] SET [ExpertTimeSlotDesc] = @ExpertTimeSlotDesc, [ExpertTimeSlotName] = @ExpertTimeSlotName, [SearchKeywords] = @SearchKeywords, [ExpertTimeSlotDate] = @ExpertTimeSlotDate,  [ExpertTimeSlotType] = @ExpertTimeSlotType WHERE [ExpertTimeSlotId] = @ExpertTimeSlotId">
        <DeleteParameters>
            <asp:Parameter Name="ExpertTimeSlotId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ExpertTimeSlotDesc" Type="String" />
            <asp:Parameter Name="ExpertTimeSlotName" Type="String" />
            <asp:Parameter Name="SearchKeywords" Type="String" />
            <asp:Parameter Name="ExpertTimeSlotDate" Type="DateTime" />
           <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
            <asp:Parameter Name="ExpertTimeSlotType" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ExpertTimeSlotDesc" Type="String" />
             <asp:Parameter Name="ExpertTimeSlotName" Type="String" />
            <asp:Parameter Name="SearchKeywords" Type="String" />
            <asp:Parameter Name="ExpertTimeSlotDate" Type="DateTime" />
            <asp:Parameter Name="ExpertTimeSlotType" Type="Int32" />
            <asp:Parameter Name="ExpertTimeSlotId" Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>