using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OnboardingStep2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Session["CompanyId"] = 1;

    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        //if this is the first record to setup!
        if (FormView1.DataItemCount == 0) {
            FormView1.ChangeMode(FormViewMode.Insert);
        }
        else {
            FormView1.ChangeMode(FormViewMode.Edit);
        }
    
    }
}