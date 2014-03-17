using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;
using CustomStrings;
using System.Data.SqlClient;
using DBHelpers;

public partial class Admin_VerifyUser : System.Web.UI.Page
{
    string ConnString = StaticVariables.ConnectionString;
    int SelectedUserID, SelectedUserType; //1 - Tenant 2 - Employee
    string strCurfewTime;
    bool HasCurfew, HasContract;
    int CurrentEmployeeID;


    SqlDataSource dsSearch = new SqlDataSource();

    string SearcQuery = "";

    //base search queries
    string SelectTenant = "SELECT TenantID AS 'ID', FName, MName,LName, UN, PhotoFile FROM Tenants";
    string SelectEmployee = "SELECT EmployeeID AS 'ID', FName, MName, LName, UN, PhotoFile FROM Employees";


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            CurrentEmployeeID = Convert.ToInt32(Session["EmployeeID"].ToString());
        }
        catch
        {
            Response.Redirect(@"~/Admin/Default.aspx");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        setSearch();
    }

    private void setSearch()
    {

        
        dsSearch.ConnectionString = ConnString;

        if (ddlCategory.SelectedValue != "" && ddlUserType.SelectedValue != "")
        {
            if (ddlUserType.SelectedValue == "Tenants")
            {
                SelectTenant += " WHERE " + AntiXSSMethods.MakeStringSafeForSQL(ddlCategory.SelectedValue) + " LIKE @SQ";
                SearcQuery = SelectTenant;
                SelectedUserType = 1;    
            }
            else if (ddlUserType.SelectedValue == "Employees")
            {
                SelectEmployee += " WHERE " + AntiXSSMethods.MakeStringSafeForSQL(ddlCategory.SelectedValue) + " LIKE @SQ";
                SearcQuery = SelectEmployee;
                SelectedUserType = 2;
            }


            ViewState.Add("UserType", SelectedUserType.ToString());

            dsSearch.SelectParameters.Add(new Parameter("SQ", System.Data.DbType.String, "%" + AntiXSSMethods.CleanString(txtSearchQuery.Text) + "%"));
            dsSearch.SelectCommand = SearcQuery;
            dsSearch.DataBind();

            GRD_Results.DataSource = dsSearch;
            GRD_Results.DataBind();

            lblAlert.Text = "";

        }
        else if (ddlUserType.SelectedValue != "" && ddlCategory.SelectedValue == "")
        {
            //no category selected
            clearGrid();
            lblAlert.Text = "No Category selected.";
        }
        else if (ddlUserType.SelectedValue == "" && ddlCategory.SelectedValue != "")
        {
            //no category selected
            clearGrid();
            lblAlert.Text = "No User Type selected.";
        }
        else
        {
            //no category selected

            lblAlert.Text = "Please complete fields!";
            clearGrid();
        }
    }

    private void clearGrid()
    {
        dsSearch.SelectCommand = string.Empty;
        dsSearch.SelectParameters.Clear();
        dsSearch.DataBind();
        GRD_Results.DataSource = dsSearch;
        GRD_Results.DataBind();

        tblView.Visible = false;
        tblInOut.Visible = false;
        btnSubmit.Enabled = false;

    }


    protected void GRD_Results_SelectedIndexChanged(object sender, EventArgs e)
    {
        SelectedUserType = int.Parse(ViewState["UserType"].ToString());

        if (SelectedUserType == 1 || SelectedUserType == 2)
        {
            loadUser(int.Parse(GRD_Results.SelectedDataKey["ID"].ToString()), SelectedUserType);
            ViewState.Add("SelectedUserType", SelectedUserType);
            ViewState.Add("SelectedUserID", SelectedUserID);

        }
        else
        {
            lblAlert.Text = "Please repeat your search.";
        }
    }

    private void loadUser(int _ID, int _Usertype)
    {
        string Table, Identifier;
        


        if (_Usertype == 1)
        {
            Table = "Tenants";
            Identifier = "TenantID";
        }
        else
        {
            Table = "Employees";
            Identifier = "EmployeeID";
        }

        tblView.Visible = true;
        tblInOut.Visible = true;
        btnSubmit.Enabled = true;
        int TenantID = _ID;

        string strQuery = "SELECT * FROM " + Table + " WHERE " + Identifier + "=@ID";
        SqlParameter[] IDParam = { new SqlParameter("@ID", _ID) };
        SqlDataReader dr = DataAccess.ReturnReader(strQuery, IDParam, ConnString);

        dr.Read();

        lblFName.Text = dr["FName"].ToString();
        lblMName.Text = dr["MName"].ToString();
        lblLName.Text = dr["LName"].ToString();
        lblUsername.Text = dr["UN"].ToString();
        lblIDNo.Text = _ID.ToString();


        try
        {
            string IMGURL = dr["PhotoFile"].ToString();
            if (IMGURL == "" || IMGURL == null)
            {
                IMGPHOTO.ImageUrl = @"~/images/nophoto.jpg";
            }
            else
            {
                IMGPHOTO.ImageUrl = @"~/Uploads/" + IMGURL;     
            }
        }
        catch
        {
            IMGPHOTO.ImageUrl = @"~/images/nophoto.jpg";
        }
        IMGPHOTO.DataBind();

        if (_Usertype == 1)
        {
            lblUserType.Text = "Tenant";
            
            strCurfewTime = dr["CurfewTime"].ToString();
            if (strCurfewTime == "")
            {
                lblCurfew.Text = "No Curfew";
                HasCurfew = false;
            }
            else
            {
                lblCurfew.Text = strCurfewTime;
                HasCurfew = true;
            }


        }
        else
        {
            lblUserType.Text = "Employee";
            lblHasContract.Text = "-";
            lblCurfew.Text = "-"; 
        }

        DataAccess.ForceConnectionToClose();


        if (_Usertype == 1)
        {
            SqlParameter[] TID = { new SqlParameter("@TID", _ID) };
            HasContract = DataAccess.DetermineIfExisting("SELECT * FROM Contracts WHERE TenantID=@TID AND IsValid=1", TID, ConnString);
            if (HasContract)
            {
                lblHasContract.Text = "Yes";
            }
            else
            {
                lblHasContract.Text = "No";
            }

        }

        SelectedUserID = _ID;

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DateTime now = DateTime.Now;
        DateTime CurfewTimeToday;
        bool HasBrokenCurfew;
        string DTRTYPE;

        if (rbIN.Checked)
        {
            DTRTYPE = "IN";
        }
        else
        {
            DTRTYPE = "OUT";
        }


        if (HasCurfew)
        {
            CurfewTimeToday = DateTime.Parse(DateTime.Now.ToShortDateString() + " " + strCurfewTime);
            if (now >= CurfewTimeToday)
            {
                HasBrokenCurfew = true;
            }
            else
            {
                HasBrokenCurfew = false;
            }
        }
        else
        {
            HasBrokenCurfew = false;
        }


        SelectedUserID = int.Parse(ViewState["SelectedUserID"].ToString());
        SelectedUserType = int.Parse(ViewState["SelectedUserType"].ToString());

        if (SelectedUserType == 2)
        {
            RecordDTR(SelectedUserType, SelectedUserID, DTRTYPE, txtRemarks.Text);
            clearGrid();
            lblAlert.Text = DTRTYPE + " Time Recorded!";
        }
        else if (SelectedUserType == 1 || HasBrokenCurfew == false)
        {
            RecordDTR(SelectedUserType, SelectedUserID, DTRTYPE, txtRemarks.Text);
            clearGrid();
            lblAlert.Text = DTRTYPE + " Time Recorded!";
        }
        else if (SelectedUserType == 1 || HasBrokenCurfew == true)
        {
            if (DTRTYPE == "IN")
            {
                //Record a violation, then record DTR
                RecordCurfewViolation(SelectedUserID, CurrentEmployeeID);
                RecordDTR(SelectedUserType, SelectedUserID, DTRTYPE, txtRemarks.Text);
                lblAlert.Text = DTRTYPE + " Time Recorded and Violation Filed!";
            }
            else
            {
                lblAlert.Text = "Tenat is not allowed to go out. It is already past his/her curfew time.";
            }
        }


    }


    private void RecordCurfewViolation(int _TenantID, int _EmployeeID)
    {
        string strInsertViolation = "INSERT INTO Violations (TenantID, EmployeeID, Title, Description) VALUES (@TenantID, @EmployeeID, @Title, @Description)";
        SqlParameter[] Insertables = {
                                                             new SqlParameter("@TenantID", _TenantID),
                                                             new SqlParameter("@EmployeeID", _EmployeeID),
                                                             new SqlParameter("@Title", "Curfew Violation"),
                                                             new SqlParameter("@Description", "This tenant has entered the dormitory premises beyond his/her curfew time.")
                                                         };
        DataAccess.DataProcessExecuteNonQuery(strInsertViolation, Insertables, ConnString);
    }


    //1 - Tenant 2 - Employee
    private void RecordDTR(int _UserType, int _UserID, string _InOrOut, string _Remarks)
    {
        string Column;
        if (_UserType == 1)
        {
            Column = "TenantID";
        }
        else
        {
            Column = "EmployeeID";
        }

        string strInsertQuery = "INSERT INTO DTR (" + Column + ", EntryType, Remarks) VALUES (@ID, @EntryType, @Remarks)";

        SqlParameter[] Params = {
                                    new SqlParameter("@ID", _UserID),
                                    new SqlParameter("@EntryType", _InOrOut),
                                    new SqlParameter("@Remarks", AntiXSSMethods.CleanString(_Remarks))
                                };


        DataAccess.DataProcessExecuteNonQuery(strInsertQuery, Params, ConnString);
    }

}