using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;

public partial class Admin_ContractMgt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string GetBedSide(int _BedSideID)
    {
        return IntToWords.getBedside(_BedSideID);
    }

    public string GetGender(int _GenderID)
    {
        return IntToWords.getGender(_GenderID);
    }

}