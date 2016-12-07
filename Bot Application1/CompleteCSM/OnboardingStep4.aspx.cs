using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OnboardingStep4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Session["CompanyId"] = 1;

        //post back?
        if (!this.IsPostBack)
        {
            //put back button
            NewSupportLink.Visible = true;
            SupportLinkDetail.Visible = false;
        }
        else
        {

        }
    }

    protected void NewSupportLink_Click(object sender, EventArgs e)
    {
        SupportLinkDetail.Visible = true;
        SupportLinkDetail.ChangeMode(DetailsViewMode.Insert);
        NewSupportLink.Visible = false;//hide button
    }



    protected void SupportLinkDetail_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        SupportLinkDetail.Visible = false;
        NewSupportLink.Visible = true;
    }
}