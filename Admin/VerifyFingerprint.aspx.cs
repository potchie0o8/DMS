using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;
using System.Data;
using Globals;
using ImageProcessor;
using System.IO;

public partial class VerifyFingerprint : System.Web.UI.Page
{
    string connString = StaticVariables.ConnectionString;
    
    int SelectedUser;
    




    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            try
            {
                SelectedUser = int.Parse(ViewState["SelectedUser"].ToString());
            }
            catch { }
        }


    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (ddlCategory.SelectedValue + ddlUserType.SelectedValue != "")
        {
            string strSelect = "SELECT * FROM DTR WHERE " + ddlCategory.SelectedValue + ddlUserType.SelectedValue + " LIKE @entry AND DTR_ID !='" + SelectedUser.ToString() + "'  ORDER BY Username DESC";
            SqlParameter[] SearchVal = { new SqlParameter("@entry", "%" + AntiXSSMethods.CleanString(txtSearch.Text) + "%") };
            DataSet ds = DataAccess.DataProcessReturnData(strSelect, SearchVal, connString);


            GRD_Results.DataSourceID = string.Empty;
            GRD_Results.DataSourceID = string.Empty;
            GRD_Results.DataBind();
        }
        else
        {

        }


    }


    protected void GRD_Results_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intSelectedProfile = int.Parse(GRD_Results.SelectedDataKey["DTR_ID"].ToString());
        showProfile(intSelectedProfile);

    }

    private void showProfile(int _DTR_ID)
    {
        try
        {
            

            SelectedUser = _DTR_ID;
            ViewState.Add("SelectedUser", SelectedUser.ToString());

            tbView.Visible = true;

            string strSelect = "SELECT * FROM DTR WHERE " + ddlCategory.SelectedValue + ddlUserType.SelectedValue + " LIKE @entry AND DTR_ID !='" + SelectedUser.ToString() + "'  ORDER BY Username DESC";

            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(strSelect, con);
            cmd.Parameters.Add(new SqlParameter("DTR_ID", _DTR_ID));

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            lblIDNo.Text = _DTR_ID.ToString();

            IMGPHOTO.ImageUrl = dr["Photofile"].ToString();
            lblFName.Text = dr["FirstName"].ToString();
            lblLName.Text = dr["LastName"].ToString();
            lblUserType.Text = dr["UserType"].ToString();
            lblUsername.Text = dr["Username"].ToString();
            lblHasContract.Text = dr["Contract"].ToString();
            lblCurfew.Text = DateTime.Parse(dr["Curfew_Time"].ToString()).ToString("hh:mm tt");
            


            dr.Close();
            con.Close();

            //check if tenant has contract
        }
        catch (Exception ex)
        {
            //Response.Write("<script>alert('Please select one to view profile.');</script>");
            Response.Write(ex.Message);
        }
    }
}




              
            
    
 


               
           
        
    
    