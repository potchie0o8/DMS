using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using CustomStrings;
using DBHelpers;
using Auditor;

public partial class Admin_GuardianMgt : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID = int.Parse(Session["EmployeeID"].ToString());
    }
    private void loaddata(int _GID)
    {
        tblGuardian.Visible = true;
        SqlParameter[] GID = { new SqlParameter("@GID", _GID )};
        SqlDataReader dr = DataAccess.ReturnReader("SELECT * FROM Guardians WHERE GuardianID=@GID", GID, conString);
        dr.Read();
        lblGuardianID.Text = dr["GuardianID"].ToString();
        txtFName.Text = dr["FName"].ToString();
        txtMName.Text = dr["MName"].ToString();
        txtLName.Text = dr["LName"].ToString();
        ddlGender.SelectedValue = dr["Gender"].ToString();
        txtBDay.Text = dr["BDate"].ToString();
        txtContact.Text = dr["ContactNo"].ToString();
        txtEmail.Text = dr["Email"].ToString();
        txtAddress.Text = dr["Address"].ToString();
        lblUN.Text = dr["UN"].ToString();
        DataAccess.ForceConnectionToClose();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int SelectedGuardian = int.Parse(grdGuardian.SelectedDataKey["GuardianID"].ToString());
        string strUpdate = "UPDATE Guardians SET FName=@fname, MName=@mname, LName=@lname, Gender=@gender, BDate=@bdate, ContactNo=@contactNo, Email=@email, Address=@address WHERE GuardianID=@GID";
        SqlParameter[] updateParam = {
                                         new SqlParameter("@fname", AntiXSSMethods.CleanString(txtFName.Text)),
                                         new SqlParameter("@mname", AntiXSSMethods.CleanString(txtMName.Text)),
                                         new SqlParameter("@lname", AntiXSSMethods.CleanString(txtLName.Text)),
                                         new SqlParameter("@gender", AntiXSSMethods.CleanString(ddlGender.SelectedValue)),
                                         new SqlParameter("@bdate", AntiXSSMethods.CleanString(txtBDay.Text)),
                                         new SqlParameter("@contactNo", AntiXSSMethods.CleanString(txtContact.Text)),
                                         new SqlParameter("@email", AntiXSSMethods.CleanString(txtEmail.Text)),
                                         new SqlParameter("@address", AntiXSSMethods.CleanString(txtAddress.Text)),
                                         new SqlParameter("@GID", SelectedGuardian)
                                     };
        DataAccess.DataProcessExecuteNonQuery(strUpdate, updateParam, conString);
        AuditTrailFunctions.UpdateEmployeeAuditTrail("Updated guardians details", EmployeeID);
        lblAlert.Text = "Successfully Updated!";
        grdGuardian.DataBind();
        loaddata(SelectedGuardian);
    }
    protected void grdGuardian_SelectedIndexChanged(object sender, EventArgs e)
    {
        int SelectedGuardian = int.Parse(grdGuardian.SelectedDataKey["GuardianID"].ToString());
        loaddata(SelectedGuardian);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        tblGuardian.Visible = false;
    }
}