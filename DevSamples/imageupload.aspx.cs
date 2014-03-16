using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DevSamples_imageupload : System.Web.UI.Page
{

    //reinsmeister/dms

    string imagedir = "/uploads/";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {


        string newfilename = "blablabla.jpg";
        
        //check if file is inside fileupload
        
        //check file size
        
        

        //check file type

       //save file to server



        FileUpload1.SaveAs(imagedir + newfilename);

        //save newfilename to db


        //dispose
        FileUpload1.Dispose();

    }
}