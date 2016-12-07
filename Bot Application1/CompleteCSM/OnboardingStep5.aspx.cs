using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OnboardingStep5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["CompanyId"] = 1;

        //post back?
        if (!this.IsPostBack)
        {
            //put back button
            //NewServiceOffering.Visible = true;
            ServiceOfferingDetail.Visible = false;
            solabel.Visible = false;

            //put back button
            //NewExpertSession.Visible = true;
            ExpertSessionDetail.Visible = false;
            exlabel.Visible = false;
        }
        else
        {

        }
    }
    protected void NewServiceOffering_Click(object sender, EventArgs e)
    {
        ServiceOfferingDetail.Visible = true;
        solabel.Visible = true;
        ServiceOfferingDetail.ChangeMode(DetailsViewMode.Insert);
        //NewServiceOffering.Visible = false;//hide button
    }
    protected void ServiceOfferingDetail_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        ServiceOfferingDetail.Visible = false;
       // NewServiceOffering.Visible = true;
    }
    protected void NewExpertSession_Click(object sender, EventArgs e)
    {
        exlabel.Visible = true;
        ExpertSessionDetail.Visible = true;
        ExpertSessionDetail.ChangeMode(DetailsViewMode.Insert);
       // NewExpertSession.Visible = false;//hide button
    }
    protected void ExpertSessionDetail_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        ServiceOfferingDetail.Visible = false;
       // NewServiceOffering.Visible = true;
    }
       
}