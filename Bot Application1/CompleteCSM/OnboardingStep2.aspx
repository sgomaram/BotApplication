<%@ Page Title="" Language="C#" MasterPageFile="~/CompleteCSM.master" AutoEventWireup="true" CodeFile="OnboardingStep2.aspx.cs" Inherits="OnboardingStep2" %>


<asp:content id="Content2" contentplaceholderid="Step2Pict" runat="server">
  <h1 >Step 2</h1>
   Support Sign Up

</asp:content>

<asp:Content ID="Content8" ContentPlaceHolderID="Step2" Runat="Server">

 
    <asp:SqlDataSource ID="IntegrationDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Integrations] WHERE [IntegrationId] = @IntegrationId" 
        InsertCommand="INSERT INTO [Integrations] ( [IntUser], [IntPwd], [IntToken], [IntAssignUser], [GainsightCTAPriority], [GainsightCTAStatus], [GainsightCTA], [GainsightCTAType], [GainsightCTAUserId], [CompanyId], [SupportSignUpLink], [SupportSignUpLinkInstructions], [EmailNotifications]) VALUES (@IntUser, @IntPwd, @IntToken, @IntAssignUser, @GainsightCTAPriority, @GainsightCTAStatus, @GainsightCTA, @GainsightCTAType, @GainsightCTAUserId, @CompanyId, @SupportSignUpLink, @SupportSignUpLinkInstructions, @EmailNotifications)" 
        SelectCommand="SELECT [IntegrationId], [IntUser], [IntPwd], [IntToken], [IntAssignUser], [GainsightCTAPriority], [GainsightCTAStatus], [GainsightCTA], [GainsightCTAType], [GainsightCTAUserId], [CompanyId], [SupportSignUpLink], [SupportSignUpLinkInstructions], [EmailNotifications] FROM [Integrations] WHERE ([CompanyId] = @CompanyId)" 
        UpdateCommand="UPDATE [Integrations] SET [IntUser] = @IntUser, [IntPwd] = @IntPwd, [IntToken] = @IntToken, [IntAssignUser] = @IntAssignUser, [GainsightCTAPriority] = @GainsightCTAPriority, [GainsightCTAStatus] = @GainsightCTAStatus, [GainsightCTA] = @GainsightCTA, [GainsightCTAType] = @GainsightCTAType, [GainsightCTAUserId] = @GainsightCTAUserId, [CompanyId] = @CompanyId, [SupportSignUpLink] = @SupportSignUpLink, [SupportSignUpLinkInstructions] = @SupportSignUpLinkInstructions, [EmailNotifications] = @EmailNotifications WHERE [IntegrationId] = @IntegrationId">
        <DeleteParameters>
            <asp:Parameter Name="IntegrationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IntUser" Type="String" />
            <asp:Parameter Name="IntPwd" Type="String" />
            <asp:Parameter Name="IntToken" Type="String" />
            <asp:Parameter Name="IntAssignUser" Type="String" />
            <asp:Parameter Name="GainsightCTAPriority" Type="String" />
            <asp:Parameter Name="GainsightCTAStatus" Type="String" />
            <asp:Parameter Name="GainsightCTA" Type="String" />
            <asp:Parameter Name="GainsightCTAType" Type="String" />
            <asp:Parameter Name="GainsightCTAUserId" Type="String" />
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" Type="Int32" />
            <asp:Parameter Name="SupportSignUpLink" Type="String" />
            <asp:Parameter Name="SupportSignUpLinkInstructions" Type="String" />
            <asp:Parameter Name="EmailNotifications" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" Type="Int32" DefaultValue="1" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="IntUser" Type="String" />
            <asp:Parameter Name="IntPwd" Type="String" />
            <asp:Parameter Name="IntToken" Type="String" />
            <asp:Parameter Name="IntAssignUser" Type="String" />
            <asp:Parameter Name="GainsightCTAPriority" Type="String" />
            <asp:Parameter Name="GainsightCTAStatus" Type="String" />
            <asp:Parameter Name="GainsightCTA" Type="String" />
            <asp:Parameter Name="GainsightCTAType" Type="String" />
            <asp:Parameter Name="GainsightCTAUserId" Type="String" />
           <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" Type="Int32" />
            <asp:Parameter Name="SupportSignUpLink" Type="String" />
            <asp:Parameter Name="SupportSignUpLinkInstructions" Type="String" />
            <asp:Parameter Name="EmailNotifications" Type="String" />
            <asp:Parameter Name="IntegrationId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="IntegrationId" DataSourceID="IntegrationDS" OnDataBound="FormView1_DataBound">
        <EditItemTemplate>
              <table><tr><td colspan="3"><h3>How do you sign up for Support?</h3></td>
               <td></td></tr>
            <tr><td>Link to the Support Sign Up website<td><asp:TextBox ID="SupportSignUpLinkLabel" runat="server" Text='<%# Bind("SupportSignUpLink") %>' /></td></tr>
                <tr><td>Instructions to give the user before the click</td><td><asp:Textbox TextMode="MultiLine"  ID="SupportSignUpLinkInstructionsLabel" runat="server" Text='<%# Bind("SupportSignUpLinkInstructions") %>' /></td></tr>

            <tr><td></td></tr>
            <tr><td>When the user ask to talk to a real person,</td><td><asp:TextBox ID="EmailNotificationsLabel" runat="server" Text='<%# Bind("EmailNotifications") %>' /> </td></tr>
                <tr><td>Who do you email?</td><td></td></tr>
           

                <tr><td></td></tr>
                <tr><td colspan="3"><h3>How do I log into Salesforce to create a ticket?</h3></td></tr>
               <tr><td>Username</td><td> <asp:TextBox ID="Label1" runat="server" Text='<%# Bind("IntUser") %>' /></td></tr>
                <tr><td>Password</td><td><asp:TextBox ID="IntPwdLabel" runat="server" Text='<%# Bind("IntPwd") %>' /></td></tr>
                <tr><td>Token</td><td> <asp:TextBox ID="IntTokenLabel" runat="server" Text='<%# Bind("IntToken") %>' /></td></tr>
                <tr><td>User to Assign</td><td><asp:TextBox ID="IntAssignUserLabel" runat="server" Text='<%# Bind("IntAssignUser") %>' /></td></tr>
           

                <tr><td></td></tr>
                 <tr><td colspan="3"><h3>What are keys to ask for a CSM in Gainsight?</h3></td></tr>
           

            <tr><td>GainsightCTAPriority:</td><td>
            <asp:TextBox ID="GainsightCTAPriorityLabel" runat="server" Text='<%# Bind("GainsightCTAPriority") %>' />
            </td></tr>

            <tr><td>GainsightCTAStatus:</td><td>
            <asp:TextBox ID="GainsightCTAStatusLabel" runat="server" Text='<%# Bind("GainsightCTAStatus") %>' />
            </td></tr>
            <tr><td>GainsightCTA:</td><td>
            <asp:TextBox ID="GainsightCTALabel" runat="server" Text='<%# Bind("GainsightCTA") %>' />
             </td></tr>
            <tr><td>GainsightCTAType:</td><td>
            <asp:TextBox ID="GainsightCTATypeLabel" runat="server" Text='<%# Bind("GainsightCTAType") %>' />
            </td></tr>
            <tr><td>GainsightCTAUserId:</td><td>
            <asp:TextBox ID="GainsightCTAUserIdLabel" runat="server" Text='<%# Bind("GainsightCTAUserId") %>' />
           </td></tr>
             </table>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        
        <InsertItemTemplate>
        <table><tr><td colspan="3"><h3>How do you sign up for Support?</h3></td>
               <td></td></tr>
            <tr><td>Link to the Support Sign Up website<td><asp:TextBox ID="SupportSignUpLinkLabel" runat="server" Text='<%# Bind("SupportSignUpLink") %>' /></td></tr>
                <tr><td>Instructions to give the user before the click</td><td><asp:Textbox TextMode="MultiLine"  ID="SupportSignUpLinkInstructionsLabel" runat="server" Text='<%# Bind("SupportSignUpLinkInstructions") %>' /></td></tr>

            <tr><td></td></tr>
            <tr><td>When the user ask to talk to a real person,</td><td><asp:TextBox ID="EmailNotificationsLabel" runat="server" Text='<%# Bind("EmailNotifications") %>' /> </td></tr>
                <tr><td>Who do you email?</td><td></td></tr>
           

                <tr><td></td></tr>
                <tr><td colspan="3"><h3>How do I log into Salesforce to create a ticket?</h3></td></tr>
               <tr><td>Username</td><td> <asp:TextBox ID="Label1" runat="server" Text='<%# Bind("IntUser") %>' /></td></tr>
                <tr><td>Password</td><td><asp:TextBox ID="IntPwdLabel" runat="server" Text='<%# Bind("IntPwd") %>' /></td></tr>
                <tr><td>Token</td><td> <asp:TextBox ID="IntTokenLabel" runat="server" Text='<%# Bind("IntToken") %>' /></td></tr>
                <tr><td>User to Assign</td><td><asp:TextBox ID="IntAssignUserLabel" runat="server" Text='<%# Bind("IntAssignUser") %>' /></td></tr>
           

                <tr><td></td></tr>
                 <tr><td colspan="3"><h3>What are keys to ask for a CSM in Gainsight?</h3></td></tr>
           

            <tr><td>GainsightCTAPriority:</td><td>
            <asp:TextBox ID="GainsightCTAPriorityLabel" runat="server" Text='<%# Bind("GainsightCTAPriority") %>' />
            </td></tr>

            <tr><td>GainsightCTAStatus:</td><td>
            <asp:TextBox ID="GainsightCTAStatusLabel" runat="server" Text='<%# Bind("GainsightCTAStatus") %>' />
            </td></tr>
            <tr><td>GainsightCTA:</td><td>
            <asp:TextBox ID="GainsightCTALabel" runat="server" Text='<%# Bind("GainsightCTA") %>' />
             </td></tr>
            <tr><td>GainsightCTAType:</td><td>
            <asp:TextBox ID="GainsightCTATypeLabel" runat="server" Text='<%# Bind("GainsightCTAType") %>' />
            </td></tr>
            <tr><td>GainsightCTAUserId:</td><td>
            <asp:TextBox ID="GainsightCTAUserIdLabel" runat="server" Text='<%# Bind("GainsightCTAUserId") %>' />
           </td></tr>
             </table>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            
           <table><tr><td colspan="3"><h3>How do you sign up for Support?</h3></td>
               <td></td></tr>
            <tr><td>Link to the Support Sign Up website<td><asp:Label ID="SupportSignUpLinkLabel" runat="server" Text='<%# Bind("SupportSignUpLink") %>' /></td></tr>
                <tr><td>Instructions to give the user before the click</td><td><asp:Textbox TextMode="MultiLine"  ID="SupportSignUpLinkInstructionsLabel" runat="server" Text='<%# Bind("SupportSignUpLinkInstructions") %>' /></td></tr>

            <tr><td></td></tr>
            <tr><td>When the user ask to talk to a real person,</td><td><asp:Label ID="EmailNotificationsLabel" runat="server" Text='<%# Bind("EmailNotifications") %>' /> </td></tr>
                <tr><td>When the user ask to talk to a real person,</td><td></td></tr>
           

                <tr><td></td></tr>
                <tr><td colspan="3">How do I log into Salesforce to create a ticket?</td></tr>
               <tr><td>Username</td><td> <asp:Label ID="Label1" runat="server" Text='<%# Bind("IntUser") %>' /></td></tr>
                <tr><td>Password</td><td><asp:Label ID="IntPwdLabel" runat="server" Text='<%# Bind("IntPwd") %>' /></td></tr>
                <tr><td>Token</td><td> <asp:Label ID="IntTokenLabel" runat="server" Text='<%# Bind("IntToken") %>' /></td></tr>
                <tr><td>User to Assign</td><td><asp:Label ID="IntAssignUserLabel" runat="server" Text='<%# Bind("IntAssignUser") %>' /></td></tr>
           

                <tr><td></td></tr>
                 <tr><td colspan="3">What are keys to ask for a CSM in Gainsight?</td></tr>
            <tr><td>Username</td><td> <asp:Label ID="Label2" runat="server" Text='<%# Bind("IntUser") %>' /></td></tr>

            <tr><td>GainsightCTAPriority:</td><td>
            <asp:Label ID="GainsightCTAPriorityLabel" runat="server" Text='<%# Bind("GainsightCTAPriority") %>' />
            </td></tr>

            <tr><td>GainsightCTAStatus:</td><td>
            <asp:Label ID="GainsightCTAStatusLabel" runat="server" Text='<%# Bind("GainsightCTAStatus") %>' />
            </td></tr>
            <tr><td>GainsightCTA:</td><td>
            <asp:Label ID="GainsightCTALabel" runat="server" Text='<%# Bind("GainsightCTA") %>' />
             </td></tr>
            <tr><td>GainsightCTAType:</td><td>
            <asp:Label ID="GainsightCTATypeLabel" runat="server" Text='<%# Bind("GainsightCTAType") %>' />
            </td></tr>
            <tr><td>GainsightCTAUserId:</td><td>
            <asp:Label ID="GainsightCTAUserIdLabel" runat="server" Text='<%# Bind("GainsightCTAUserId") %>' />
           </td></tr>
            <tr><td>CompanyId:</td><td>
            <asp:Label ID="CompanyIdLabel" runat="server" Text='<%# Bind("CompanyId") %>' />
            </td></tr></table>
           
        
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>


</asp:Content>