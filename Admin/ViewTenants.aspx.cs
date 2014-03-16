using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelpers;
using CustomStrings;
using ImageProcessor;
using System.IO;
using BCryptEncryption;
using UserManagement;
using Globals;
using Auditor;

public partial class Admin_ViewTenants : System.Web.UI.Page
{
    string connString = StaticVariables.ConnectionString;
    int TenantID;
    int EmployeeID;
    string photofile, username;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID = int.Parse(Session["EmployeeID"].ToString());
        try
        {
            TenantID = int.Parse(Request.QueryString["ID"]);
            if (!IsPostBack)
            {
                loaddata(TenantID);
                ViewState.Add("photofile", photofile);
                ViewState.Add("username", username);
            }
            else
            {
                photofile = ViewState["photofile"].ToString();
                username = ViewState["username"].ToString();
            }
        }
        catch (Exception ex)
        {
            //Response.Redirect("ManageTenants.aspx");
            Response.Write(ex.Message);
        }
    }

    private void loaddata(int _TID)
    {
        SqlParameter[] TID = {
                                 new SqlParameter("@TID", _TID)
                             };
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
        lblTenantID.Text = TenantID.ToString();
        txtFPID.Text = dr["FingerprintID"].ToString();
        txtFName.Text = dr["FName"].ToString();
        txtMName.Text = dr["MName"].ToString();
        txtLName.Text = dr["LName"].ToString();
        ddlGender.SelectedValue = dr["Gender"].ToString();
        txtDOB.Text = dr["BDate"].ToString();
        txtContactNo.Text = dr["MobileNo"].ToString();
        txtEmailAdd.Text = dr["Email"].ToString();
        txtStreet.Text = dr["Street"].ToString();
        txtCityProvince.Text = dr["City"].ToString();
        txtRegion.Text = dr["Region"].ToString();
        txtCountry.Text = dr["Country"].ToString();
        username = dr["UN"].ToString();
        lblUN.Text = dr["UN"].ToString();
        DataAccess.ForceConnectionToClose();
    }

    protected void btnResetPassword_Click(object sender, EventArgs e)
    {

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int fpid;
        try
        {
            fpid = int.Parse(AntiXSSMethods.CleanString(txtFPID.Text));
        }
        catch
        {
            fpid = 0;
        }
        try
        {
            string strUpdate = "UPDATE Tenants SET PhotoFile=@photofile, FingerprintID=@fpid, FName=@fname, MName=@mname, LName=@lname, Gender=@gender, BDate=@bdate, MobileNo=@mobno, Email=@email, Street=@street, City=@city, Region=@region, Country=@country WHERE TenantID=@TID";
            photofile = UploadPhoto();
            SqlParameter[] UpdateParams = {
                                          new SqlParameter("@fpid", fpid),
                                          new SqlParameter("@photofile", photofile),
                                          new SqlParameter("@fname", AntiXSSMethods.CleanString(txtFName.Text)),
                                          new SqlParameter("@mname", AntiXSSMethods.CleanString(txtMName.Text)),
                                          new SqlParameter("@lname", AntiXSSMethods.CleanString(txtLName.Text)),
                                          new SqlParameter("@gender", AntiXSSMethods.CleanString(ddlGender.SelectedValue)),
                                          new SqlParameter("@bdate", AntiXSSMethods.CleanString(txtDOB.Text)),
                                          new SqlParameter("@mobno", AntiXSSMethods.CleanString(txtContactNo.Text)),
                                          new SqlParameter("@email", AntiXSSMethods.CleanString(txtEmailAdd.Text)),
                                          new SqlParameter("@street", AntiXSSMethods.CleanString(txtStreet.Text)),
                                          new SqlParameter("@city", AntiXSSMethods.CleanString(txtCityProvince.Text)),
                                          new SqlParameter("@region", AntiXSSMethods.CleanString(txtRegion.Text)),
                                          new SqlParameter("@country", AntiXSSMethods.CleanString(txtCountry.Text)),
                                          new SqlParameter("@TID", TenantID)
                                       };
            DataAccess.DataProcessExecuteNonQuery(strUpdate, UpdateParams, connString);
            AuditTrailFunctions.UpdateEmployeeAuditTrail("Updated tenants details", EmployeeID);
            loaddata(TenantID);
            lblAlert.Text = "Tenant information saved.";
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        } 
    }
    protected void btnResetPass2_Click(object sender, EventArgs e)
    {
        
    }

    public string UploadPhoto()
    {
        string result;
        try
        {
            if (FupPhoto.HasFile)
            {

                ImageProcess img = new ImageProcess();
                Stream imgStream = FupPhoto.FileContent;

                //validates if file is a valid JPG/PNG image
                bool isValidType = img.ValidateImageFileType(imgStream);
                //validates if file meets valid size;
                bool isValidSize = img.ValidateImageFileSize(imgStream, 1048576);


                if (isValidType == false)
                {
                    return "invalid";
                }
                if (isValidSize == false)
                {
                    return "large";
                }

                string FileExtension = Path.GetExtension(FupPhoto.FileName).ToLower();
                string NewFileName = NewFileName = "Tenant_" + username + "_" + StringCustomizers.dateStampNoID + FileExtension;

                FupPhoto.SaveAs(Server.MapPath(@"~/uploads/" + NewFileName));
                result = NewFileName;
            }
            else
            {
                result = photofile;
            }
        }
        catch (Exception ex)
        {
            result = "error: " + ex.Message;
        }
        finally
        {
            FupPhoto.Dispose();
        }
        return result;
    }

}


