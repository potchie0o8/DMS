﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;
using ImageProcessor;
using System.IO;

public partial class Admin_EmployeeReg : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }


<<<<<<< HEAD
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
                result = "nofile";
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

=======
>>>>>>> e8541358c2c7a1a6c94024264f9d9ef3d352362c

    private bool checkInputs()
    {
        //to check each for blank entries
        if (txtFName.Text.Trim() == "")
        {
            return false;
        }
        if (txtMName.Text.Trim() == "")
        {
            return false;
        }
        if (txtLName.Text.Trim() == "")
        {
            return false;
        }
        if (ddlGender.SelectedValue.Trim() == "")
        {
            return false;
        }
        if (txtBDay.Text.Trim() == "")
        {
            return false;
        }
        if (txtContact.Text.Trim() == "")
        {
            return false;
        }
        if (txtEmail.Text.Trim() == "")
        {
            return false;
        }
        if (ddlAdminLevel.SelectedValue.Trim() == "")
        {
            return false;
        }
        if (txtUN.Text.Trim() == "")
        {
            return false;
        }
        if (txtPwd1.Text.Trim() == "")
        {
            return false;
        }
        if (txtPwd2.Text.Trim() == "")
        {
            return false;
        }
        if (txtDateEmployeed.Text.Trim() == "")
        {
            return false;
        }


        //checks if password 1 and 2 are similar
        if (txtPwd1.Text.Trim() != txtPwd2.Text.Trim())
        {
            return false;
        }

        //checks if int and datetime objects are valid

        try
        {
            DateTime.Parse(txtDateEmployeed.Text.Trim());
            DateTime.Parse(txtBDay.Text.Trim());
        }
        catch
        {
            return false;
        }

        return true;

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

<<<<<<< HEAD
        string strImageFile = UploadPhoto();

        if ((strImageFile == "nofile") || (strImageFile !="large" && strImageFile !="invalid"))
        {

            if (strImageFile == "nofile")
            {
                strImageFile = "";
            }

            if (checkInputs())
            {

                SqlParameter[] checkUNParam = {
                                          new SqlParameter("@un", txtUN.Text)
                                      };

                bool isExisting = DataAccess.DetermineIfExisting("SELECT * FROM Employees WHERE UN=@un", checkUNParam, conString);
                if (isExisting != true)
                {
                    string strInsert = "INSERT INTO Employees (FName, MName, LName, Gender, BDate, ContactNo, Email, AdminLevel, UN, PWD, DateOfEmployment, PhotoFile) VALUES (@fname, @mname, @lname, @gender, @bdate, @contact, @email, @adminlevel, @un, @pwd, @doe, @photofile)";
                    SqlParameter[] insrtParam = {
=======
        if (checkInputs())
        {

            SqlParameter[] checkUNParam = {
                                          new SqlParameter("@un", txtUN.Text)
                                      };

            bool isExisting = DataAccess.DetermineIfExisting("SELECT * FROM Employees WHERE UN=@un", checkUNParam, conString);
            if (isExisting != true)
            {
                string strInsert = "INSERT INTO Employees (FName, MName, LName, Gender, BDate, ContactNo, Email, AdminLevel, UN, PWD, DateOfEmployment) VALUES (@fname, @mname, @lname, @gender, @bdate, @contact, @email, @adminlevel, @un, @pwd, @doe)";
                SqlParameter[] insrtParam = {
>>>>>>> e8541358c2c7a1a6c94024264f9d9ef3d352362c
                                            new SqlParameter("@fname",  AntiXSSMethods.CleanString(txtFName.Text)),
                                            new SqlParameter("@mname", AntiXSSMethods.CleanString(txtMName.Text)),
                                            new SqlParameter("@lname", AntiXSSMethods.CleanString(txtLName.Text)),
                                            new SqlParameter("@gender", ddlGender.SelectedValue),
                                            new SqlParameter("@bdate", Convert.ToDateTime(txtBDay.Text)),
                                            new SqlParameter("@contact", AntiXSSMethods.CleanString((txtContact.Text))),
                                            new SqlParameter("@email", AntiXSSMethods.CleanString(txtEmail.Text)),
                                            new SqlParameter("@adminlevel", ddlAdminLevel.SelectedValue),
                                            new SqlParameter("@un", AntiXSSMethods.CleanString(txtUN.Text)),
                                            new SqlParameter("@pwd", Encryption.MD5(AntiXSSMethods.CleanString((txtPwd2.Text)))),
                                            new SqlParameter("@doe", Convert.ToDateTime(txtDateEmployeed.Text)),
                                            new SqlParameter("@photofile", strImageFile)
                                        };
<<<<<<< HEAD
                    DataAccess.DataProcessExecuteNonQuery(strInsert, insrtParam, conString);
                    //Response.Write("<script>alert('Success!');</script>");
                    Response.Redirect("ManageEmployees.aspx");

                }
                else
                {
                    lblAlert.Text = "Username already taken!";
                    //Response.Write("<script>alert('Username already taken!');</script>");
                }


=======
                DataAccess.DataProcessExecuteNonQuery(strInsert, insrtParam, conString);
                //Response.Write("<script>alert('Success!');</script>");
                Response.Redirect("ManageEmployees.aspx");
>>>>>>> e8541358c2c7a1a6c94024264f9d9ef3d352362c

            }
            else
            {
<<<<<<< HEAD
                lblAlert.Text = "Some fields are either have invalid entries or left blank.";
                //Response.Write("Some fields are either have invalid entries or left blank.");
            }
 
=======
                Response.Write("<script>alert('Username already taken!');</script>");
            }


           
>>>>>>> e8541358c2c7a1a6c94024264f9d9ef3d352362c
        }
        else if (strImageFile == "large")
        {
<<<<<<< HEAD
            lblAlert.Text = "Photo File exceeds 1MB!";
            //Response.Write("<script>alert('Photo File exceeds 1MB!');</script>");
        }
        else if (strImageFile == "invalid")
        {
            lblAlert.Text = "Photo File is not valid!";
            //Response.Write("<script>alert('Photo File is not valid!');</script>");
=======
            Response.Write("Some fields are either have invalid entries or left blank.");
>>>>>>> e8541358c2c7a1a6c94024264f9d9ef3d352362c
        }


        
    }

}