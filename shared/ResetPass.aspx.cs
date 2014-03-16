using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomStrings;
using UserManagement;
using System.Net.Mail;
using System.Data.SqlClient;
using DBHelpers;
using Globals;
using System.Net;

public partial class shared_ResetPass : System.Web.UI.Page
{
    string ConnString = StaticVariables.ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        string TableName = "";
        

        string Username = AntiXSSMethods.CleanString(txtUsername.Text);
        if (Username != "")
        {
            bool IsExisting = General.CheckIfExisting(Username);
            if (IsExisting)
            {
                //role = 1 Employee, 2 Tenant, 3 Guardian, 4 - error that will most likely not happen! :)
                int role = General.CheckRole(Username);
                //Response.Write(role.ToString());

                string newpass = StringCustomizers.RandomStr();
                string encryptednewpass = Encryption.GenerateBCryptHash(newpass);

                if (role == 1)
                {
                    TableName = "Employees";
                }
                else if (role == 2)
                {
                    TableName = "Tenants";
                }
                else if (role == 3)
                {
                    TableName = "Guardians";
                }

                string UpdatePWD = "UPDATE " + TableName + " SET Pwd=@pwd WHERE UN=@UN";

                SqlParameter[] Params = { 
                                             new SqlParameter("@UN", Username),
                                             new SqlParameter("@pwd", encryptednewpass)
                                         };
                DataAccess.DataProcessExecuteNonQuery(UpdatePWD, Params, ConnString);

                //sends email
                SqlParameter[] UN = { new SqlParameter("@UN", Username) };
                string email = DataAccess.ReturnData("SELECT Email FROM " + TableName + " WHERE UN=@UN", UN, ConnString, "Email");
                bool mailIsSent = sendmail(email, newpass);

                if (mailIsSent)
                {
                    lblAlert.Text = "Your password has been successfully reset. Please check your registered email's inbox for your new password. Don't forget to check your junk mailbox.";
                }
                else
                {
                    lblAlert.Text = "Email is not sent. You may ask an administrator to reset your password for you.";
                }
            }
            else
            {
                lblAlert.Text = "Username doesn't exist!";
            }
        }
        else
        {
            lblAlert.Text = "No username entered!";
        }
    }

    private bool sendmail(string _email, string _newpass)
    {
        try
        {
            MailMessage message = new MailMessage();
            message.To.Add(_email);
            message.Subject = "This is the Subject line";
            message.From = new System.Net.Mail.MailAddress("noreply@egidms.com");
            message.Body = "Your password has been reset. Your new password is: " + _newpass;
            //System.Net.Mail.SmtpClient smtp = new SmtpClient("localhost", 25);

            System.Net.Mail.SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

            smtp.UseDefaultCredentials = false;

            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential("almedaaaronjohn@gmail.com", "sensitivity52767");
            //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Send(message);
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }

    }


}