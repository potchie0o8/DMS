using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewTenantReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ContentPlaceHolder holder = (ContentPlaceHolder)Page.PreviousPage.FindControl ("Content");
        ContentPlaceHolder holder = (ContentPlaceHolder)Page.PreviousPage.FindControl("Content2");
        if (holder != null)
        {
            TextBox txtFname, txtMname, txtLname;
            txtFname = (TextBox)holder.FindControl("txtFName");
            txtMname = (TextBox)holder.FindControl("txtMName");
            txtLname = (TextBox)holder.FindControl("txtLName");

            lblFName.Text = txtFname.Text;
            lblMName.Text = txtMname.Text;
            lblLName.Text = txtLname.Text;
        }
        else
        {
            Response.Redirect("TenantReg.aspx");
        }
    }
}