using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OnboardingStep3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["CompanyId"] = 1;

        //post back?
        if (!this.IsPostBack)
        {
            //put back button
            NewTrainingLink.Visible = true;
            TrainingLinkDetail.Visible = false;
        }
        else
        {
            
        }
    }

    protected void NewTrainingLink_Click(object sender, EventArgs e)
    {
        TrainingLinkDetail.Visible = true;
        TrainingLinkDetail.ChangeMode(DetailsViewMode.Insert);
        NewTrainingLink.Visible = false;//hide button
    }



    protected void TrainingLinkDetail_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        TrainingLinkDetail.Visible = false;
        NewTrainingLink.Visible = true;
    }
}