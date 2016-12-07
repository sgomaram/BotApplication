using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompleteCSM : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {            
            
            object o = Session["CompanyId"];
            if (o == null)
            {
                Response.Redirect("CCSMLogin.aspx");
            }                   
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["CompanyId"] = null;
        Response.Redirect("CCSMLogin.aspx");
    }
}
