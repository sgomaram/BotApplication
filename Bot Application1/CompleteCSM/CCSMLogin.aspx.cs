using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CCSMLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        string username = TxtUser.Text;
        string pwd = TxtPwd.Text;

        int CompanyId = Login(username, pwd);
        if (CompanyId == 0)
        {
            lblError.Visible = true;
        }
        else
        {
            lblError.Visible = false;
            Session["CompanyId"] = CompanyId;
            Response.Redirect("OnboardingStep1.aspx");
        }



    }

    private int Login(string username, string pwd)
    {
        if(username == "Acme" & pwd == "Acme")
        {
            return 1; //first Company Id
        } else
        {
            return 0;
        }

    }


}