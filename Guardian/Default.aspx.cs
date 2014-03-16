using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;
using DBHelpers;
using System.Data.SqlClient;

public partial class Guardian_Default : System.Web.UI.Page
{
    string connString = StaticVariables.ConnectionString;
    string photofile;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void grdTGLink_SelectedIndexChanged(object sender, EventArgs e)
    {
        int SelectedTenant = int.Parse(grdTGLink.SelectedDataKey["TenantID"].ToString());
        loaddata(SelectedTenant);
    }

    public void loaddata(int _TID)
    {
        try
        {
            tblTenant.Visible = true;

            SqlParameter[] TID = { new SqlParameter("@TID", _TID) };
            SqlDataReader dr = DataAccess.ReturnReader("SELECT * FROM Tenants WHERE TenantID=@TID", TID, connString);
            dr.Read();
            //for photo, if no photo then default nopic from FRIENDSTER will appear. haha.
            photofile = dr["PhotoFile"].ToString();
            if (photofile.Trim() == "" || photofile == null)
            {
                ImgPhoto.ImageUrl = "~/images/nophoto.jpg";
            }
            else
            {
                ImgPhoto.ImageUrl = "~/uploads/" + photofile;
            }
            lblTenantID.Text = dr["TenantID"].ToString();
            lblFName.Text = dr["FName"].ToString();
            lblMName.Text = dr["MName"].ToString();
            lblLName.Text = dr["LName"].ToString();
            lblGender.Text = dr["Gender"].ToString();
            lblEmail.Text = dr["Email"].ToString();
            lblBday.Text = dr["BDate"].ToString();
            lblStreet.Text = dr["Street"].ToString();
            lblCity.Text = dr["City"].ToString();
            lblRegion.Text = dr["Region"].ToString();
            lblCountry.Text = dr["Country"].ToString();
            lblMobile.Text = dr["MobileNo"].ToString();
            lblUN.Text = dr["UN"].ToString();
            lblDateRegistered.Text = dr["DateRegistered"].ToString();
            DataAccess.ForceConnectionToClose();
        }
        catch
        {
        }
    }
}