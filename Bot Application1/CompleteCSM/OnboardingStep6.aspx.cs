using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OnboardingStep6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["CompanyId"] = 1;

        FormView1.Visible = true;
        //post back?
        if (!this.IsPostBack)
        {
            //put back button
            NewCampaign.Visible = true;
            //CampaignDetail.Visible = false;

        }
        else
        {

        }
    }

    protected void NewCampaign_Click(object sender, EventArgs e)
    {
        //CampaignDetail.Visible = true;
        //CampaignDetail.ChangeMode(DetailsViewMode.Insert);
       // NewCampaign.Visible = false;//hide button


       FormView1.ChangeMode(FormViewMode.Insert);


    }



    protected void CampaignDetail_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        //CampaignDetail.Visible = false;
        NewCampaign.Visible = true;
    }
}