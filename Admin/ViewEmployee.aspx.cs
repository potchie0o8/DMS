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

public partial class Admin_ViewEmployee : System.Web.UI.Page
{

    string connString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();

    int EmployeeID;

    string photofile;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            EmployeeID = int.Parse(Request.QueryString["ID"]);
            if (!IsPostBack)
            {
                loaddata(EmployeeID);
                ViewState.Add("photofile", photofile);
            }
            else
            {
                photofile = ViewState["photofile"].ToString();
            }
        }
        catch (Exception ex)
        {

            Response.Redirect("ManageEmployees.aspx");
            Response.Write(ex.Message);
        }
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
                string NewFileName = "Employee_" + StringCustomizers.dateStampNoID + FileExtension;

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

    private void loaddata(int _EID)
    {
        SqlParameter [] EID = { new SqlParameter("@EID", _EID) };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT * FROM Employees WHERE EmployeeID=@EID", EID, connString);
        dr.Read();
        lblEmpID.Text = EmployeeID.ToString();
        lblUN.Text = dr["UN"].ToString();
        ddlAdminAccess.SelectedValue = dr["AdminLevel"].ToString();
        ddlGender.SelectedValue = dr["Gender"].ToString();
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

        txtContactNo.Text = dr["ContactNo"].ToString();
        txtDOB.Text = dr["BDate"].ToString();
        txtDOE.Text = dr["DateOfEmployment"].ToString();
        txtEmailAdd.Text = dr["Email"].ToString();
        txtFName.Text = dr["FName"].ToString();
        txtLName.Text = dr["LName"].ToString();
        txtMName.Text = dr["MName"].ToString();

        DataAccess.ForceConnectionToClose();

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {

            string strUpdate = "UPDATE Employees SET AdminLevel=@adminlevel, Gender=@gender, Photofile=@photofile, ContactNo=@contactno, BDate=@bdate, DateOfEmployment=@doe, Email=@email, FName=@fname, MName=@mname, @LName=@lname WHERE EmployeeID=@EID";

            photofile = UploadPhoto();

            SqlParameter[] UpdateParams = {
                                          new SqlParameter("@adminlevel", AntiXSSMethods.CleanString(ddlAdminAccess.SelectedValue)),
                                          new SqlParameter("@gender", AntiXSSMethods.CleanString(ddlGender.SelectedValue)),
                                          new SqlParameter("@photofile", photofile),
                                          new SqlParameter("@contactno", AntiXSSMethods.CleanString(txtContactNo.Text)),
                                          new SqlParameter("@bdate", Convert.ToDateTime(txtDOB.Text)),
                                          new SqlParameter("@doe", Convert.ToDateTime(txtDOE.Text)),
                                          new SqlParameter("@email", AntiXSSMethods.CleanString(txtEmailAdd.Text)),
                                          new SqlParameter("@fname", AntiXSSMethods.CleanString(txtFName.Text)),
                                          new SqlParameter("@mname", AntiXSSMethods.CleanString(txtMName.Text)),
                                          new SqlParameter("@lname", AntiXSSMethods.CleanString(txtLName.Text)),
                                          new SqlParameter("@EID", EmployeeID)
                                       };
            DataAccess.DataProcessExecuteNonQuery(strUpdate, UpdateParams, connString);
            loaddata(EmployeeID);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }


    }
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {

    }
}