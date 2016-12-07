using System;
using System.Configuration;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using CCSM.BusinessObjects;
using CCSM.DataAccess;

public partial class Default3 : System.Web.UI.Page
{
    GenericCompany c;
    DataAccess da;
    CUser cuser;
    protected void Page_Load(object sender, EventArgs e)
    {
        c = new GenericCompany("12345");

        da = new DataAccess(c);

        GetUserByEmail();//1
        GetUserById();//2
        GetSubscription();//3
        getSupportSignupLink();//4
        createCase();//12
        
        PrintInitialTrainingLinks();//5
        PrintSearchedTrainingLinks();//6
        SearchFromTop10();//7
        SearchFromSFKB();//8
        ServiceOfferings();//9

        PrintExpertTimeSlots();//10
        PrintTrainingTimeSlots();//11
        


    }
    private void GetUserByEmail()
    {
        cuser = da.getUserByEmail("bryan.plaster@gmail.com");
        Label1.Text = cuser.ToString();
    }
    private void GetUserById()
    {
        cuser = da.getUserById(8);
        Label2.Text = cuser.ToString();
    }
    private void GetSubscription()
    {
        Subscription subs = da.getSubscription();
        if (subs == null) Label3.Text = "We don't know the subscription";

        Label3.Text = subs.ToString();
    }
    private void getSupportSignupLink()
    {
        Label4.Text = da.getLinkToSupportSignup();
    }
    private void PrintInitialTrainingLinks()
    {
        TrainingLink[] links = da.getInitialTrainingLinks();
        StringBuilder sb = new StringBuilder();
        foreach (TrainingLink l in links)
        {
            sb.Append(l.ToString()).Append("<br>");
        }
        Label5.Text = sb.ToString();
    }
    private void PrintSearchedTrainingLinks()
    {
        TrainingLink[] links = da.getUserSearchedTrainingLinks(new string[2] { "bob", "netsuite"} ) ;
        StringBuilder sb = new StringBuilder();
        foreach (TrainingLink l in links)
        {
            sb.Append(l.ToString()).Append("<br>");
        }
        Label6.Text = sb.ToString();
    }
    private void SearchFromTop10()
    {
        
        SupportLink[] links = da.searchFromTop10Issues(new string[2] { "bob", "netsuite" });
        StringBuilder sb = new StringBuilder();
        foreach (SupportLink l in links)
        {
            sb.Append(l.ToString()).Append("<br>");
        }
        Label7.Text = sb.ToString();
                
    }
    private void SearchFromSFKB() {
        Label8.Text = "Still need to do in SF";
        //da.searchFromKB();

    }
    private void ServiceOfferings()
    {
        ServiceOffLink[] links = da.getServiceOfferings();
        StringBuilder sb = new StringBuilder();
        foreach (ServiceOffLink l in links)
        {
            sb.Append(l.ToString()).Append("<br>");
        }
        Label9.Text = sb.ToString();
        
    }


    private void PrintExpertTimeSlots()
    {
        ExpertTimeSlot[] tss = da.getExpertTimeSlots();
        StringBuilder sb = new StringBuilder();
        foreach (ExpertTimeSlot t in tss)
        {
            sb.Append(t.ToString());
            sb.Append("<br>");
        }
        Label10.Text = sb.ToString();
    }
    private void PrintTrainingTimeSlots()
    {
        ExpertTimeSlot[] tss = da.getExpertTimeSlots();
        StringBuilder sb = new StringBuilder();
        foreach (ExpertTimeSlot t in tss)
        {
            sb.Append(t.ToString());
            sb.Append("<br>");
        }
        Label11.Text = sb.ToString();
    }
    private void createCase()
    {
        Label12.Text = da.createCaseForUser("this is the case description2");
    }
        

    /* if (!Page.IsPostBack)
        {
              //setup radio buttons
             RadioButtonList1.Items.Add(new ListItem(getApprovedText(), "2"));
             RadioButtonList1.Items.Add(new ListItem(getApprovedWChangesText(), "3"));
             RadioButtonList1.Items.Add(new ListItem(getNotApprovedText(), "4"));
             RadioButtonList1.Items[0].Selected = true;
        }*/


}