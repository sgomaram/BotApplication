using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OnboardingStep1 : System.Web.UI.Page
{

    int sindex = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
       
       
        


        //post back?
        if (!this.IsPostBack)
        {
            SubscDetailsView.Visible = false;
            //UserDetailsView.Visible = false;
           
        }
        else
        {
            SubscDetailsView.Visible = true;
            UserDetailsView.Visible = true;
            

            //put back button
            NewUser.Visible = true;

            
            //sindex = UsersGridView.SelectedIndex;
           // UsersGridView.DataBind();
            //UsersGridView.SelectRow(sindex);
        

            //hide new link
            //((CommandField)UserDetailsView.Fields[0]).ShowInsertButton = false;
            //UserDetailsView.DataBind();



        }
    }



    protected void UsersGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView g = (GridView)sender;
        //int userId = (Int32)g.SelectedValue;
        //sindex = g.SelectedIndex;
        //sindex = g.SelectedRow.RowIndex;
       
        //SubscDetailsView.Visible = true;
        //SubscDetailsView.
        //SubscDetailsView.SelectMethod = g.SelectedValue;

    }
    protected void SubsrDetailsView_OnDataBound(object sender, EventArgs e)
    {
       // if (SubscDetailsView.DataKey.Value == null)
     //   {
         //   SubscDetailsView.ChangeMode(DetailsViewMode.Insert);
       // }
    }

    protected void SubscDetailsView_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
    protected void UsersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        // The RowIndex of the Row where LinkButton was clicked
        int rowIndex = Convert.ToInt32(e.CommandArgument);

        // Get the GridView Row
        GridViewRow row = UsersGridView.Rows[rowIndex];

       //get current user id from selected gridview
        updateSubscUserId =  row.Cells[2].Text;
        //put in session so other details view can pick it up
        Session["updateSubscUserId"] = updateSubscUserId;
        
        /*
        //get products from selected row
        Label l1 = row.FindControl("Label3") as Label;
        if (l1 != null)
            subsproducts = l1.Text;
            */
       
    }
    bool updateSubsc = false;
    string updateSubscUserId = "";
    string subsproducts = "";

    protected void UpdateSubsc_Click(object sender, EventArgs e)
    {
        updateSubsc = true;
        
    }
       

    protected void UserDetailsView_ItemInserted(object sender, EventArgs e)
    {
        DetailsView udv = (DetailsView)sender;
        TextBox sp = (TextBox)udv.FindControl("SubscProducts");

        //udv.ro




        UsersGridView.DataBind();
        //sindex = UsersGridView.Rows.Count;
        // GridViewRow r = UsersGridView.Rows[sindex];

        //UsersGridView.SelectedIndex = sindex;
        // UsersGridView.SelectRow(sindex);
    }

    protected void NewUser_Click(object sender, EventArgs e)
    {
        UserDetailsView.ChangeMode(DetailsViewMode.Insert);
       // SubscDetailsView.Visible = false;
        NewUser.Visible = false;
        SubscDetailsView.Visible = false;
        //sindex = UsersGridView.SelectedRow.RowIndex + 1;
        //((CommandField)UserDetailsView.Fields[0]).ShowInsertButton = true;
    }

    protected void UserDetailsView_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SubscDetailsView.ChangeMode(DetailsViewMode.Insert);
        SubscDetailsView.Visible = true;
        //TextBox l = (TextBox)Page.FindControl("TxtUDUID");
        //l.Text = updateSubscUserId;
    }

    protected void SubscDetailsView_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        UsersGridView.DataBind();
    }

    protected void SubscDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        UsersGridView.DataBind();
    }
}