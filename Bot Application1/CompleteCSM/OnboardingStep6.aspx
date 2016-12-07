<%@ Page Title="" Language="C#" MasterPageFile="~/CompleteCSM.master" AutoEventWireup="true" CodeFile="OnboardingStep6.aspx.cs" Inherits="OnboardingStep6" %>

<asp:content id="Content2" contentplaceholderid="Step6Pict" runat="server">
    <h1 >Step 6</h1>
   Proactive Campaigns

</asp:content>
<asp:Content ID="Content11" ContentPlaceHolderID="Step6" Runat="Server">

  <asp:GridView ID="CampaignGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
      CellPadding="4" DataKeyNames="CampaignId" DataSourceID="CampaignsDS" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="CampaignId" HeaderText="CampaignId" SortExpression="CampaignId" InsertVisible="True" ReadOnly="True" />
            <asp:BoundField DataField="CampaignName" HeaderText="CampaignName" SortExpression="CampaignName" />
            <asp:BoundField DataField="StartingMonthOfSubscr" HeaderText="StartingMonthOfSubscr" SortExpression="StartingMonthOfSubscr" />
            <asp:BoundField DataField="XNumDays" HeaderText="XNumDays" SortExpression="XNumDays" />
            <asp:BoundField DataField="ProactiveMessage" HeaderText="ProactiveMessage" SortExpression="ProactiveMessage" />
            <asp:BoundField DataField="ShareSuppLink" HeaderText="ShareSuppLink" SortExpression="ShareSuppLink" />
            <asp:BoundField DataField="ShareTrainingLink" HeaderText="ShareTrainingLink" SortExpression="ShareTrainingLink" />
            <asp:BoundField DataField="ShareExpertLink" HeaderText="ShareExpertLink" SortExpression="ShareExpertLink" />
            <asp:BoundField DataField="TargetSegment" HeaderText="TargetSegment" SortExpression="TargetSegment" />
            <asp:BoundField DataField="ContactApproach1" HeaderText="ContactApproach1" SortExpression="ContactApproach1" />
            <asp:BoundField DataField="ContactApproach2" HeaderText="ContactApproach2" SortExpression="ContactApproach2" />
            <asp:BoundField DataField="ContactApproach3" HeaderText="ContactApproach3" SortExpression="ContactApproach3" />
            <asp:BoundField DataField="YDaysBetweenApproaches" HeaderText="YDaysBetweenApproaches" SortExpression="YDaysBetweenApproaches" />
            <asp:BoundField DataField="CampaignStartHour" HeaderText="CampaignStartHour" SortExpression="CampaignStartHour" />
                        <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
            <asp:BoundField DataField="CampaignTriggerId" HeaderText="CampaignTriggerId" SortExpression="CampaignTriggerId" />
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
     <asp:Button ID="NewCampaign" Text="Add new Campaign" runat="server" CommandName="NewCampaign" OnClick="NewCampaign_Click" />

    <asp:SqlDataSource ID="CampaignsDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Campaigns] WHERE [CampaignId] = @CampaignId" 
        InsertCommand="INSERT INTO [Campaigns] ([CampaignName], [StartingMonthOfSubscr], [XNumDays], [ProactiveMessage], [ShareSuppLink], [ShareTrainingLink], [ShareExpertLink], [TargetSegment], [ContactApproach1], [ContactApproach2], [ContactApproach3], [YDaysBetweenApproaches], [CampaignStartHour], [CompanyId], [StartDate], [CampaignTriggerId]) VALUES (@CampaignName, @StartingMonthOfSubscr, @XNumDays, @ProactiveMessage, @ShareSuppLink, @ShareTrainingLink, @ShareExpertLink, @TargetSegment, @ContactApproach1, @ContactApproach2, @ContactApproach3, @YDaysBetweenApproaches, @CampaignStartHour, @CompanyId, @StartDate, @CampaignTriggerId)" 
        SelectCommand="SELECT [CampaignId], [CampaignName], [StartingMonthOfSubscr], [XNumDays], [ProactiveMessage], [ShareSuppLink], [ShareTrainingLink], [ShareExpertLink], [TargetSegment], [ContactApproach1], [ContactApproach2], [ContactApproach3], [YDaysBetweenApproaches], [CampaignStartHour], [CompanyId], [StartDate], [CampaignTriggerId] FROM [Campaigns] where CompanyId = @CompanyId" 
        UpdateCommand="UPDATE [Campaigns] SET [CampaignName] = @CampaignName, [StartingMonthOfSubscr] = @StartingMonthOfSubscr, [XNumDays] = @XNumDays, [ProactiveMessage] = @ProactiveMessage, [ShareSuppLink] = @ShareSuppLink, [ShareTrainingLink] = @ShareTrainingLink, [ShareExpertLink] = @ShareExpertLink, [TargetSegment] = @TargetSegment, [ContactApproach1] = @ContactApproach1, [ContactApproach2] = @ContactApproach2, [ContactApproach3] = @ContactApproach3, [YDaysBetweenApproaches] = @YDaysBetweenApproaches, [CampaignStartHour] = @CampaignStartHour, [CompanyId] = @CompanyId, [StartDate] = @StartDate, [CampaignTriggerId] = @CampaignTriggerId WHERE [CampaignId] = @CampaignId">
        <DeleteParameters>
            <asp:Parameter Name="CampaignId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CampaignName" Type="String" />
            <asp:Parameter Name="StartingMonthOfSubscr" Type="Int32" />
            <asp:Parameter Name="XNumDays" Type="Int32" />
            <asp:Parameter Name="ProactiveMessage" Type="String" />
            <asp:Parameter Name="ShareSuppLink" Type="Int32" />
            <asp:Parameter Name="ShareTrainingLink" Type="Int32" />
            <asp:Parameter Name="ShareExpertLink" Type="Int32" />
            <asp:Parameter Name="TargetSegment" Type="String" />
            <asp:Parameter Name="ContactApproach1" Type="Int32" />
            <asp:Parameter Name="ContactApproach2" Type="Int32" />
            <asp:Parameter Name="ContactApproach3" Type="Int32" />
            <asp:Parameter Name="YDaysBetweenApproaches" Type="Int32" />
            <asp:Parameter Name="CampaignStartHour" Type="Int32" />
           <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="CampaignTriggerId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CampaignName" Type="String" />
            <asp:Parameter Name="StartingMonthOfSubscr" Type="Int32" />
            <asp:Parameter Name="XNumDays" Type="Int32" />
            <asp:Parameter Name="ProactiveMessage" Type="String" />
            <asp:Parameter Name="ShareSuppLink" Type="Int32" />
            <asp:Parameter Name="ShareTrainingLink" Type="Int32" />
            <asp:Parameter Name="ShareExpertLink" Type="Int32" />
            <asp:Parameter Name="TargetSegment" Type="String" />
            <asp:Parameter Name="ContactApproach1" Type="Int32" />
            <asp:Parameter Name="ContactApproach2" Type="Int32" />
            <asp:Parameter Name="ContactApproach3" Type="Int32" />
            <asp:Parameter Name="YDaysBetweenApproaches" Type="Int32" />
            <asp:Parameter Name="CampaignStartHour" Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="CampaignTriggerId" Type="Int32" />
            <asp:Parameter Name="CampaignId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="CampaignId" DataSourceID="CampaignDS" ForeColor="#333333">
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            <table><tr><td colspan="4"> <h3>Enter a New Campaign</h3></td></tr>
           <tr><td> Name:</td><td> <asp:TextBox ID="CampaignNameTextBox" runat="server" Text='<%# Bind("CampaignName") %>' /></td><td></td></tr>
            <tr><td>Start Date:</td><td> <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' /></td>
                <td>at 
                     <asp:DropDownList ID="DropDownList5" runat="server" Enabled="true" AutoPostBack="True" SelectedValue='<%# Bind ("CampaignStartHour") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                         <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                         <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                          </asp:DropDownList>
                    </td><td>in Pacific Time Zone</td></tr>
            <tr><td>Nudge when </td><td>                 
                  <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind ("CampaignTriggerId") %>'>
                        <asp:ListItem Value="1">First Login was X days ago</asp:ListItem>
                        <asp:ListItem Value="2">Not seen for X days</asp:ListItem>
                        <asp:ListItem Value="3">Used Feature 1 X days ago</asp:ListItem>
                        <asp:ListItem Value="4">Used Feature 2 X days ago</asp:ListItem>
                        <asp:ListItem Value="5">Used Feature 3 X days ago</asp:ListItem>
                        <asp:ListItem Value="6">Used Feature 4 X days ago</asp:ListItem>
                        <asp:ListItem Value="7">Used Feature 5 X days ago</asp:ListItem>
                        <asp:ListItem Value="8">Invited Users X days ago</asp:ListItem>
                        <asp:ListItem Value="9">Renewal is in X days</asp:ListItem>
                    </asp:DropDownList>
                </td><td>
                     <asp:DropDownList ID="DropDownList2" runat="server" Enabled="true" AutoPostBack="True" SelectedValue='<%# Bind ("XNumDays") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                         <asp:ListItem Value="30">30</asp:ListItem>
                        <asp:ListItem Value="45">45</asp:ListItem>
                        <asp:ListItem Value="60">60</asp:ListItem>
                        <asp:ListItem Value="90">90</asp:ListItem>
                          </asp:DropDownList>
                     days</td></tr>
                <tr><td colspan="4"></td></tr>
                <tr><td>Starting at Subscription Month </td><td> 
                    <asp:DropDownList ID="DropDownList3" runat="server" Enabled="true" AutoPostBack="True" SelectedValue='<%# Bind ("StartingMonthOfSubscr") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                         <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                          </asp:DropDownList></td>
                    <td colspan="2">Land (0-3 months) </td></tr>
                <tr><td></td><td></td><td>Adopt (4-6 months)</td></tr>
                 <tr><td></td><td></td><td>Expand (7-9 Months)</td></tr>
                 <tr><td></td><td></td><td>Renew (10-12 Months)</td></tr>
                <tr><td>Proactive Message to send:</td><td>Support Link</td><td>Training Link</td><td>Expert Link</td></tr>
                <tr><td> <asp:TextBox ID="ProactiveMessageTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("ProactiveMessage") %>' /></td>
                    <td>
                         <asp:DropDownList ID="SLDDL" runat="server" datavaluefield="SupportlinkId" 
        datatextfield="SupportlinkName" DataSourceID="SupportLinksDS"  
        SelectedValue="<%# Bind('ShareSuppLink') %>" /></td>
                   
                     <td> <asp:DropDownList ID="TLDDL" runat="server" datavaluefield="TraininglinkId" 
        datatextfield="TraininglinkName" DataSourceID="TrainingLinksDS"  
        SelectedValue="<%# Bind('ShareTrainingLink') %>" />   </td>

                    <td> <asp:DropDownList ID="SEDDL" runat="server" datavaluefield="ExpertTimeSlotId" 
        datatextfield="ExpertTimeSlotName" DataSourceID="ExpertSessionsDS"  
        SelectedValue="<%# Bind('ShareExpertLink') %>" />   </td>

                </tr>
                   <tr><td> Target Segment:</td><td><asp:TextBox ID="TargetSegmentTextBox" runat="server" Text='<%# Bind("TargetSegment") %>' /></td></tr>
                <tr><td colspan="4"></td></tr>


                   <tr><td>Content Approach 1</td><td>
                        <asp:DropDownList ID="CADDL" runat="server" datavaluefield="ContactApproachId" 
        datatextfield="ContactApproachName" DataSourceID="ContactApproachDS"  
        SelectedValue="<%# Bind('ContactApproach1') %>" />
                       
                       </td>
                    <td>Days between Approaches</td>
                    <td><asp:DropDownList ID="DropDownList4" runat="server" Enabled="true" AutoPostBack="True" SelectedValue='<%# Bind ("YDaysBetweenApproaches") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                      </asp:DropDownList>
                   </td></tr>
                <tr><td>Content Approach 2</td><td>  <asp:DropDownList ID="DropDownList6" runat="server" datavaluefield="ContactApproachId" 
        datatextfield="ContactApproachName" DataSourceID="ContactApproachDS"  
        SelectedValue="<%# Bind('ContactApproach2') %>" />

                                               </td><td> if no response</td><td></td></tr>
                <tr><td>Content Approach 3</td><td>  <asp:DropDownList ID="DropDownList7" runat="server" datavaluefield="ContactApproachId" 
        datatextfield="ContactApproachName" DataSourceID="ContactApproachDS"  
        SelectedValue="<%# Bind('ContactApproach3') %>" /></td></td><td></td></tr>
                   
                </table>
            
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>


        <ItemTemplate>
            <table><tr><td colspan="4"> <h3>Review your Campaign</h3></td></tr>
           <tr><td> Name:</td><td> <asp:TextBox ID="CampaignNameTextBox" runat="server" Enabled="false" Text='<%# Bind("CampaignName") %>' /></td><td></td></tr>
            <tr><td>Start Date:</td><td> <asp:TextBox ID="StartDateTextBox"  Enabled="false" runat="server" Text='<%# Bind("StartDate") %>' /></td>
                <td>at 
                     <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" Enabled="false"  SelectedValue='<%# Bind ("CampaignStartHour") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                         <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                         <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                          </asp:DropDownList>
                    </td><td>in Pacific Time Zone</td></tr>
            <tr><td>Nudge when </td><td>                 
                  <asp:DropDownList ID="DropDownList1" runat="server" Enabled="false"  AutoPostBack="True" SelectedValue='<%# Bind ("CampaignTriggerId") %>'>
                        <asp:ListItem Value="1">First Login was X days ago</asp:ListItem>
                        <asp:ListItem Value="2">Not seen for X days</asp:ListItem>
                        <asp:ListItem Value="3">Used Feature 1 X days ago</asp:ListItem>
                        <asp:ListItem Value="4">Used Feature 2 X days ago</asp:ListItem>
                        <asp:ListItem Value="5">Used Feature 3 X days ago</asp:ListItem>
                        <asp:ListItem Value="6">Used Feature 4 X days ago</asp:ListItem>
                        <asp:ListItem Value="7">Used Feature 5 X days ago</asp:ListItem>
                        <asp:ListItem Value="8">Invited Users X days ago</asp:ListItem>
                        <asp:ListItem Value="9">Renewal is in X days</asp:ListItem>
                    </asp:DropDownList>
                </td><td>
                     <asp:DropDownList ID="DropDownList2" runat="server"  Enabled="false"  AutoPostBack="True" SelectedValue='<%# Bind ("XNumDays") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                         <asp:ListItem Value="30">30</asp:ListItem>
                        <asp:ListItem Value="45">45</asp:ListItem>
                        <asp:ListItem Value="60">60</asp:ListItem>
                        <asp:ListItem Value="90">90</asp:ListItem>
                          </asp:DropDownList>
                     days</td></tr>
                <tr><td colspan="4"></td></tr>
                <tr><td>Starting at Subscription Month </td><td> 
                    <asp:DropDownList ID="DropDownList3" runat="server"  Enabled="false"  AutoPostBack="True" SelectedValue='<%# Bind ("StartingMonthOfSubscr") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                         <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                          </asp:DropDownList></td>
                    <td colspan="2">Land (0-3 months) </td></tr>
                <tr><td></td><td></td><td>Adopt (4-6 months)</td></tr>
                 <tr><td></td><td></td><td>Expand (7-9 Months)</td></tr>
                 <tr><td></td><td></td><td>Renew (10-12 Months)</td></tr>
                <tr><td>Proactive Message to send:</td><td>Support Link</td><td>Training Link</td><td>Expert Link</td></tr>
                <tr><td> <asp:TextBox ID="ProactiveMessageTextBox" Enabled="false"  runat="server" TextMode="MultiLine" Text='<%# Bind("ProactiveMessage") %>' /></td>
                    <td>
                         <asp:DropDownList ID="SLDDL" runat="server"  Enabled="false" datavaluefield="SupportlinkId" 
        datatextfield="SupportlinkName" DataSourceID="SupportLinksDS"  
        SelectedValue="<%# Bind('ShareSuppLink') %>" /></td>
                   
                     <td> <asp:DropDownList ID="TLDDL" runat="server"  Enabled="false" datavaluefield="TraininglinkId" 
        datatextfield="TraininglinkName" DataSourceID="TrainingLinksDS"  
        SelectedValue="<%# Bind('ShareTrainingLink') %>" />   </td>

                    <td> <asp:DropDownList ID="SEDDL" runat="server"  Enabled="false" datavaluefield="ExpertTimeSlotId" 
        datatextfield="ExpertTimeSlotName" DataSourceID="ExpertSessionsDS"  
        SelectedValue="<%# Bind('ShareExpertLink') %>" />   </td>

                </tr>
                   <tr><td> Target Segment:</td><td><asp:TextBox ID="TargetSegmentTextBox"  Enabled="false" runat="server" Text='<%# Bind("TargetSegment") %>' /></td></tr>
                <tr><td colspan="4"></td></tr>


                   <tr><td>Content Approach 1</td><td>
                        <asp:DropDownList ID="CADDL" runat="server"  Enabled="false" datavaluefield="ContactApproachId" 
        datatextfield="ContactApproachName" DataSourceID="ContactApproachDS"  
        SelectedValue="<%# Bind('ContactApproach1') %>" />
                       
                       </td>
                    <td>Days between Approaches</td>
                    <td><asp:DropDownList ID="DropDownList4" runat="server"  Enabled="false"  AutoPostBack="True" SelectedValue='<%# Bind ("YDaysBetweenApproaches") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                      </asp:DropDownList>
                   </td></tr>
                <tr><td>Content Approach 2</td><td>  <asp:DropDownList ID="DropDownList6"  Enabled="false" runat="server" datavaluefield="ContactApproachId" 
        datatextfield="ContactApproachName" DataSourceID="ContactApproachDS"  
        SelectedValue="<%# Bind('ContactApproach2') %>" />

                                               </td><td> if no response</td><td></td></tr>
                <tr><td>Content Approach 3</td><td>  <asp:DropDownList ID="DropDownList7"  Enabled="false" runat="server" datavaluefield="ContactApproachId" 
        datatextfield="ContactApproachName" DataSourceID="ContactApproachDS"  
        SelectedValue="<%# Bind('ContactApproach3') %>" /></td></td><td></td></tr>
                   
                </table>
            
            <asp:LinkButton ID="EditButton"
                                        Text="Edit"
                                        CommandName="Edit"
                                        RunAt="server"/>
        </ItemTemplate>


        <EditItemTemplate>
            <table><tr><td colspan="4"> <h3>Enter a New Campaign</h3></td></tr>
           <tr><td> Name:</td><td> <asp:TextBox ID="CampaignNameTextBox" runat="server" Text='<%# Bind("CampaignName") %>' /></td><td></td></tr>
            <tr><td>Start Date:</td><td> <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' /></td>
                <td>at 
                     <asp:DropDownList ID="DropDownList5" runat="server" Enabled="true" AutoPostBack="True" SelectedValue='<%# Bind ("CampaignStartHour") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                         <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                         <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                          </asp:DropDownList>
                    </td><td>in Pacific Time Zone</td></tr>
            <tr><td>Nudge when </td><td>                 
                  <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind ("CampaignTriggerId") %>'>
                        <asp:ListItem Value="1">First Login was X days ago</asp:ListItem>
                        <asp:ListItem Value="2">Not seen for X days</asp:ListItem>
                        <asp:ListItem Value="3">Used Feature 1 X days ago</asp:ListItem>
                        <asp:ListItem Value="4">Used Feature 2 X days ago</asp:ListItem>
                        <asp:ListItem Value="5">Used Feature 3 X days ago</asp:ListItem>
                        <asp:ListItem Value="6">Used Feature 4 X days ago</asp:ListItem>
                        <asp:ListItem Value="7">Used Feature 5 X days ago</asp:ListItem>
                        <asp:ListItem Value="8">Invited Users X days ago</asp:ListItem>
                        <asp:ListItem Value="9">Renewal is in X days</asp:ListItem>
                    </asp:DropDownList>
                </td><td>
                     <asp:DropDownList ID="DropDownList2" runat="server" Enabled="true" AutoPostBack="True" SelectedValue='<%# Bind ("XNumDays") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                         <asp:ListItem Value="30">30</asp:ListItem>
                        <asp:ListItem Value="45">45</asp:ListItem>
                        <asp:ListItem Value="60">60</asp:ListItem>
                        <asp:ListItem Value="90">90</asp:ListItem>
                          </asp:DropDownList>
                     days</td></tr>
                <tr><td colspan="4"></td></tr>
                <tr><td>Starting at Subscription Month </td><td> 
                    <asp:DropDownList ID="DropDownList3" runat="server" Enabled="true" AutoPostBack="True" SelectedValue='<%# Bind ("StartingMonthOfSubscr") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                         <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                          </asp:DropDownList></td>
                    <td colspan="2">Land (0-3 months) </td></tr>
                <tr><td></td><td></td><td>Adopt (4-6 months)</td></tr>
                 <tr><td></td><td></td><td>Expand (7-9 Months)</td></tr>
                 <tr><td></td><td></td><td>Renew (10-12 Months)</td></tr>
                <tr><td>Proactive Message to send:</td><td>Support Link</td><td>Training Link</td><td>Expert Link</td></tr>
                <tr><td> <asp:TextBox ID="ProactiveMessageTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("ProactiveMessage") %>' /></td>
                    <td>
                         <asp:DropDownList ID="SLDDL" runat="server" datavaluefield="SupportlinkId" 
        datatextfield="SupportlinkName" DataSourceID="SupportLinksDS"  
        SelectedValue="<%# Bind('ShareSuppLink') %>" /></td>
                   
                     <td> <asp:DropDownList ID="TLDDL" runat="server" datavaluefield="TraininglinkId" 
        datatextfield="TraininglinkName" DataSourceID="TrainingLinksDS"  
        SelectedValue="<%# Bind('ShareTrainingLink') %>" />   </td>

                    <td> <asp:DropDownList ID="SEDDL" runat="server" datavaluefield="ExpertTimeSlotId" 
        datatextfield="ExpertTimeSlotName" DataSourceID="ExpertSessionsDS"  
        SelectedValue="<%# Bind('ShareExpertLink') %>" />   </td>

                </tr>
                   <tr><td> Target Segment:</td><td><asp:TextBox ID="TargetSegmentTextBox" runat="server" Text='<%# Bind("TargetSegment") %>' /></td></tr>
                <tr><td colspan="4"></td></tr>


                   <tr><td>Content Approach 1</td><td>
                        <asp:DropDownList ID="CADDL" runat="server" datavaluefield="ContactApproachId" 
        datatextfield="ContactApproachName" DataSourceID="ContactApproachDS"  
        SelectedValue="<%# Bind('ContactApproach1') %>" />
                       
                       </td>
                    <td>Days between Approaches</td>
                    <td><asp:DropDownList ID="DropDownList4" runat="server" Enabled="true" AutoPostBack="True" SelectedValue='<%# Bind ("YDaysBetweenApproaches") %>'>
                         <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                      </asp:DropDownList>
                   </td></tr>
                <tr><td>Content Approach 2</td><td>  <asp:DropDownList ID="DropDownList6" runat="server" datavaluefield="ContactApproachId" 
        datatextfield="ContactApproachName" DataSourceID="ContactApproachDS"  
        SelectedValue="<%# Bind('ContactApproach2') %>" />

                                               </td><td> if no response</td><td></td></tr>
                <tr><td>Content Approach 3</td><td>  <asp:DropDownList ID="DropDownList7" runat="server" datavaluefield="ContactApproachId" 
        datatextfield="ContactApproachName" DataSourceID="ContactApproachDS"  
        SelectedValue="<%# Bind('ContactApproach3') %>" /></td></td><td></td></tr>
                   
                </table>
            
           <asp:LinkButton ID="UpdateButton"
                                        Text="Update"
                                        CommandName="Update"
                                        RunAt="server"/>
                          &nbsp;
                        <asp:LinkButton ID="CancelUpdateButton"
                                        Text="Cancel"
                                        CommandName="Cancel"
                                        RunAt="server"/>
        </EditItemTemplate>
        
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:FormView>




    <br />
    <asp:SqlDataSource ID="SupportLinksDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [SupportlinkId], [SupportlinkName] FROM [SupportLinks] WHERE ([CompanyId] = @CompanyId)   Union select null as SupportlinkId, '' as SupportlinkName">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="TrainingLinksDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [TraininglinkId], [TraininglinkName] FROM [TrainingLinks] WHERE ([CompanyId] = @CompanyId)  Union select null as TraininglinkId, '' as TraininglinkName">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ExpertSessionsDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [ExpertTimeSlotName], [ExpertTimeSlotId] FROM [ExpertTimeSlots] WHERE ([CompanyId] = @CompanyId) Union select null as ExpertTimeSlotName, '' as ExpertTimeSlotId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ContactApproachDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [ContactApproachId], [ContactApproachName] FROM [CampaignContactApproach]"></asp:SqlDataSource>
    
    
    

    <asp:SqlDataSource ID="CampaignDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        InsertCommand="INSERT INTO [Campaigns] ([CampaignName], [StartingMonthOfSubscr], [XNumDays], [ProactiveMessage], [ShareSuppLink], [ShareTrainingLink], [ShareExpertLink], [TargetSegment], [ContactApproach1], [ContactApproach2], [ContactApproach3], [YDaysBetweenApproaches], [CampaignStartHour], [CompanyId], [StartDate], [CampaignTriggerId]) VALUES (@CampaignName, @StartingMonthOfSubscr, @XNumDays, @ProactiveMessage, @ShareSuppLink, @ShareTrainingLink, @ShareExpertLink, @TargetSegment, @ContactApproach1, @ContactApproach2, @ContactApproach3, @YDaysBetweenApproaches, @CampaignStartHour, @CompanyId, @StartDate, @CampaignTriggerId)" 
        SelectCommand="SELECT * FROM [Campaigns] WHERE ([CampaignId] = @CampaignId)"
        UpdateCommand="UPDATE [Campaigns] SET [CampaignName] = @CampaignName, [StartingMonthOfSubscr] = @StartingMonthOfSubscr, [XNumDays] = @XNumDays, [ProactiveMessage] = @ProactiveMessage, [ShareSuppLink] = @ShareSuppLink, [ShareTrainingLink] = @ShareTrainingLink, [ShareExpertLink] = @ShareExpertLink, [TargetSegment] = @TargetSegment, [ContactApproach1] = @ContactApproach1, [ContactApproach2] = @ContactApproach2, [ContactApproach3] = @ContactApproach3, [YDaysBetweenApproaches] = @YDaysBetweenApproaches, [CampaignStartHour] = @CampaignStartHour, [CompanyId] = @CompanyId, [StartDate] = @StartDate, [CampaignTriggerId] = @CampaignTriggerId WHERE [CampaignId] = @CampaignId">
         <InsertParameters>
            <asp:Parameter Name="CampaignName" Type="String" />
            <asp:Parameter Name="StartingMonthOfSubscr" Type="Int32" />
            <asp:Parameter Name="XNumDays" Type="Int32" />
            <asp:Parameter Name="ProactiveMessage" Type="String" />
            <asp:Parameter Name="ShareSuppLink" Type="Int32" />
            <asp:Parameter Name="ShareTrainingLink" Type="Int32" />
            <asp:Parameter Name="ShareExpertLink" Type="Int32" />
            <asp:Parameter Name="TargetSegment" Type="String" />
            <asp:Parameter Name="ContactApproach1" Type="Int32" />
            <asp:Parameter Name="ContactApproach2" Type="Int32" />
            <asp:Parameter Name="ContactApproach3" Type="Int32" />
            <asp:Parameter Name="YDaysBetweenApproaches" Type="Int32" />
            <asp:Parameter Name="CampaignStartHour" Type="Int32" />
           <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="CampaignTriggerId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CampaignGrid" Name="CampaignId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CampaignName" Type="String" />
            <asp:Parameter Name="StartingMonthOfSubscr" Type="Int32" />
            <asp:Parameter Name="XNumDays" Type="Int32" />
            <asp:Parameter Name="ProactiveMessage" Type="String" />
            <asp:Parameter Name="ShareSuppLink" Type="Int32" />
            <asp:Parameter Name="ShareTrainingLink" Type="Int32" />
            <asp:Parameter Name="ShareExpertLink" Type="Int32" />
            <asp:Parameter Name="TargetSegment" Type="String" />
            <asp:Parameter Name="ContactApproach1" Type="Int32" />
            <asp:Parameter Name="ContactApproach2" Type="Int32" />
            <asp:Parameter Name="ContactApproach3" Type="Int32" />
            <asp:Parameter Name="YDaysBetweenApproaches" Type="Int32" />
            <asp:Parameter Name="CampaignStartHour" Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="CompanyId" SessionField="CompanyId" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="CampaignTriggerId" Type="Int32" />
            <asp:Parameter Name="CampaignId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>




</asp:Content>
