<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/CompleteCSM.master" CodeFile="OnboardingStep1.aspx.cs" Inherits="OnboardingStep1" %>


<asp:content id="Content2" contentplaceholderid="Step1Pict" runat="server">
    <h1 >Step 1</h1>
   Subscription Info

</asp:content>


<asp:content id="Content1" contentplaceholderid="Step1" runat="server">

  
    <div>
     Step 1:
       
        
       
    <table><tr><td colspan="2">


        <asp:GridView ID="UsersGridView" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="UserId" 
            DataSourceID="UserDS" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="UsersGridView_SelectedIndexChanged" 
            AllowPaging="True" AllowSorting="True" OnRowCommand="UsersGridView_RowCommand">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="true" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" ReadOnly="True" InsertVisible="False" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="TextPhone" HeaderText="TextPhone" SortExpression="TextPhone" />
                <asp:BoundField DataField="OfficePhone" HeaderText="OfficePhone" SortExpression="OfficePhone" />
                <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" SortExpression="CompanyId" />
                <asp:BoundField DataField="BusinessName" HeaderText="BusinessName" SortExpression="BusinessName" />
                <asp:BoundField DataField="ExternalSystemId" HeaderText="ExternalSystemId" SortExpression="ExternalSystemId" />
                <asp:BoundField DataField="TargetSegment" HeaderText="TargetSegment" SortExpression="TargetSegment" />
                <asp:TemplateField HeaderText="SubscStart" SortExpression="SubscStart">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1"  Enabled="false" runat="server" Text='<%# Bind("SubscStart") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubscStart") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SubscEnd" SortExpression="SubscEnd">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2"  Enabled="false" runat="server" Text='<%# Bind("SubscEnd") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubscEnd") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SubscProductsMsg" SortExpression="SubscProductsMsg">
                    <EditItemTemplate>
                        <asp:TextBox Enabled="false" ID="TextBox3" runat="server" Text='<%# Bind("SubscProductsMsg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SubscProductsMsg") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
                Please add a user
            </EmptyDataTemplate>
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
         <asp:SqlDataSource ID="UserDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Users] WHERE [UserId] = @UserId" 
            InsertCommand="INSERT INTO [Users] ([UserName], [Email], [TextPhone], [OfficePhone], [CompanyId], [BusinessName], [ExternalSystemId],[TargetSegment]) VALUES (@UserName, @Email, @TextPhone, @OfficePhone, @CompanyId, @BusinessName, @ExternalSystemId, @TargetSegment)" 
            SelectCommand="SELECT u.UserId, u.UserName, u.Email, u.TextPhone, u.OfficePhone, u.CompanyId, u.BusinessName, u.ExternalSystemId,u.TargetSegment, s.SubscStart, s.SubscEnd, s.SubscProductsMsg FROM Users u LEFT OUTER JOIN Subscriptions s ON u.UserId = s.UserId WHERE (u.CompanyId = @CompanyId)"
             UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [Email] = @Email, [TextPhone] = @TextPhone, [OfficePhone] = @OfficePhone, [CompanyId] = @CompanyId, [BusinessName] = @BusinessName, [ExternalSystemId] = @ExternalSystemId, [TargetSegment] = @TargetSegment WHERE [UserId] = @UserId">
            
            <DeleteParameters>
                <asp:Parameter Name="UserId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TextPhone" Type="String" />
                <asp:Parameter Name="OfficePhone" Type="String" />
                 <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
                <asp:Parameter Name="BusinessName" Type="String" />
                <asp:Parameter Name="ExternalSystemId"  Type="String" />
                <asp:Parameter Name="TargetSegment"  Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TextPhone" Type="String" />
                <asp:Parameter Name="OfficePhone" Type="String" />
                <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
                <asp:Parameter Name="BusinessName" Type="String" />
                <asp:Parameter Name="ExternalSystemId"  Type="String" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="TargetSegment"  Type="String" />
           </UpdateParameters>
             <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
        </SelectParameters>
        </asp:SqlDataSource>
        
      </td></tr>
        
        <tr><td>

           
            <asp:DetailsView ID="UserDetailsView" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="UserId" 
                DataSourceID="UserDetailDS" ForeColor="#333333" GridLines="None" Height="50px" Width="125px" 
                 OnItemInserted="UserDetailsView_ItemInserted" OnPageIndexChanging="UserDetailsView_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="TextPhone" HeaderText="TextPhone" SortExpression="TextPhone" />
                <asp:BoundField DataField="OfficePhone" HeaderText="OfficePhone" SortExpression="OfficePhone" />
                <asp:BoundField DataField="BusinessName" HeaderText="BusinessName" SortExpression="BusinessName" />
                <asp:BoundField DataField="ExternalSystemId" HeaderText="ExternalSystemId" SortExpression="ExternalSystemId" />
                 <asp:BoundField DataField="TargetSegment" HeaderText="TargetSegment" SortExpression="TargetSegment" />
                <asp:CommandField ShowInsertButton="True" NewText="" />

            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>

            </td><td>
               <asp:DetailsView ID="SubscDetailsView" DefaultMode="Edit" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" 
                DataKeyNames="SubscId" DataSourceID="SubscriptionDS" ForeColor="#333333" GridLines="None" 
                OnPageIndexChanging="SubscDetailsView_PageIndexChanging" OnDataBound="SubsrDetailsView_OnDataBound" 
                   OnItemInserted="SubscDetailsView_ItemInserted" OnItemUpdated="SubscDetailsView_ItemUpdated">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                
                   <EmptyDataTemplate>
                       <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create a Subscription" />
                   </EmptyDataTemplate>
                
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="SubscId" HeaderText="SubscId" ReadOnly="True" SortExpression="SubscId" InsertVisible="False" />
                    <asp:BoundField DataField="SubscStart" HeaderText="SubscStart" SortExpression="SubscStart" />
                    <asp:BoundField DataField="SubscEnd" HeaderText="SubscEnd" SortExpression="SubscEnd" />
                    <asp:BoundField DataField="SubscProductsMsg" HeaderText="SubscProductsMsg" SortExpression="SubscProductsMsg" />
                    <asp:BoundField DataField="CurrentStage" HeaderText="CurrentStage" SortExpression="CurrentStage" />
                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" ShowDeleteButton="True" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>

                 </td>
            </tr> 
        <tr><td>

             <asp:Button ID="NewUser" Text="Add a User" runat="server" CommandName="NewUser" OnClick="NewUser_Click" />
            </td><td>

                

                 </td></tr></table>

             <asp:SqlDataSource ID="UserDetailDS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Users] WHERE [UserId] = @UserId " 
            InsertCommand="INSERT INTO Users(UserName, Email, TextPhone, OfficePhone, CompanyId, BusinessName, ExternalSystemId, TargetSegment) VALUES (@UserName, @Email, @TextPhone, @OfficePhone, @CompanyId, @BusinessName, @ExternalSystemId, @TargetSegment)" OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT UserId, UserName, Email, TextPhone, OfficePhone, CompanyId, BusinessName, ExternalSystemId, TargetSegment FROM Users WHERE (UserId = @UserId)" 
            UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [Email] = @Email, [TextPhone] = @TextPhone, [OfficePhone] = @OfficePhone, [CompanyId] = @CompanyId, [BusinessName] = @BusinessName, [ExternalSystemId] = @ExternalSystemId, [TargetSegment] = @TargetSegment WHERE [UserId] = @UserId ">
            <DeleteParameters>
                <asp:Parameter Name="UserId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TextPhone" Type="String" />
                <asp:Parameter Name="OfficePhone" Type="String" />
                 <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
                <asp:Parameter Name="BusinessName" Type="String" />
                <asp:Parameter Name="ExternalSystemId" Type="String" />
                 <asp:Parameter Name="TargetSegment" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="UserId" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TextPhone" Type="String" />
                <asp:Parameter Name="OfficePhone" Type="String" />
                 <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
                <asp:Parameter Name="BusinessName" Type="String" />
                <asp:Parameter Name="UserId" Type="Int32" />
                 <asp:Parameter Name="ExternalSystemId" Type="String" />
                 <asp:Parameter Name="TargetSegment" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SubscriptionDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Subscriptions] WHERE [SubscId] = @SubscId" 
                InsertCommand="INSERT INTO [Subscriptions]  ([SubscStart], [SubscEnd], [SubscProductsMsg], [CurrentStage], [UserId]) VALUES (@SubscStart, @SubscEnd, @SubscProductsMsg, @CurrentStage, @UserId)" 
                SelectCommand="SELECT * FROM [Subscriptions] where UserId = @UserId" 
                UpdateCommand="UPDATE [Subscriptions] SET [SubscStart] = @SubscStart, [SubscEnd] = @SubscEnd, [SubscProductsMsg] = @SubscProductsMsg, [CurrentStage] = @CurrentStage, [UserId] = @UserId WHERE [SubscId] = @SubscId">
                <DeleteParameters>
                    <asp:Parameter Name="SubscId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="SubscStart" />
                    <asp:Parameter DbType="Date" Name="SubscEnd" />
                    <asp:Parameter Name="SubscProductsMsg" Type="String" />
                    <asp:Parameter Name="CurrentStage" Type="String" />
                    <asp:SessionParameter DefaultValue="1" Name="UserId" SessionField="updateSubscUserId" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="UsersGridView" DefaultValue="1" Name="UserId" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="SubscStart" />
                    <asp:Parameter DbType="Date" Name="SubscEnd" />
                    <asp:Parameter Name="SubscProductsMsg" Type="String" />
                    <asp:Parameter Name="CurrentStage" Type="String" />
                    <asp:ControlParameter ControlID="UsersGridView" DefaultValue="1" Name="UserId" PropertyName="SelectedValue" />
                    <asp:Parameter Name="SubscId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

       

     
    </div>
   



    </asp:content>