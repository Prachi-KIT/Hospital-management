using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Net;
using System.IO;
using System.Collections.Specialized;

namespace Hospital
{
    public partial class Book_Appointment : System.Web.UI.Page
    {
        long tele;
        string patient;
        string cmdtxt;
        int doctorid;
        string patient_id;
        string pat_email;
        string patient_nm;
        string Int_PatientId;
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            HttpCookie cookies = Request.Cookies["UserInfo"];
            if (cookies != null)
            {
                lbl1.Text = "Welcome to   " + cookies["Name"] + "   And Your  Patient Id is   :  " + cookies["Patien_Id"];
            }
            patient_id = cookies["Patien_Id"];
            patient_nm = cookies["Name"];
            pat_email = cookies["Email"];

            cmdtxt = "select distinct Doctorname from doctor_register";
            SqlConnection cn = new SqlConnection(connection_string);
            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmdtxt, cn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            drp_doctors.DataSource = ds;
            drp_doctors.DataTextField = "Doctorname";
            drp_doctors.DataBind();

        }

        public void clear_data()
        {
            drp_department.SelectedIndex = -1;
            drp_diease.SelectedIndex = -1;
            drp_doctors.SelectedIndex = -1;
            drp_room.SelectedIndex = -1;
            txt_fees.Text = "";
            txt_query.Text = "";
            txt_Appointment_Dt.Text = "";
            txt_Appointment_Dt0.Text = "";

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Page.IsValid)
                {
                    string cmdtxt1 = "";
                    cmdtxt1 = "select id from doctor_register where ltrim(rtrim(Doctorname))=ltrim(rtrim('" + drp_doctors.SelectedItem + "'))";
                    SqlConnection c = new SqlConnection(connection_string);
                    c.Open();
                    SqlCommand cmd = new SqlCommand(cmdtxt1, c);
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        doctorid = Convert.ToInt32(r["id"].ToString());
                    }
                    else
                    {
                        Response.Write("<script>alert('Doctor is not Register')</script>");
                    }

                    string cmdtxt2 = "select Patient_id,id,contactno,Patientname from Patient_register where ltrim(rtrim(Email))=ltrim(rtrim('" + pat_email + "')) and Patient_id='" + patient_id + "'";
                    SqlConnection con = new SqlConnection(connection_string);
                    con.Open();
                    SqlCommand comd = new SqlCommand(cmdtxt2, con);
                    SqlDataReader r1 = comd.ExecuteReader();
                    if (r1.Read())
                    {
                        Int_PatientId = r1["Patient_id"].ToString();
                        tele = Convert.ToInt64(r1["contactno"]);
                        patient = r1["Patientname"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('Patient is not Register')</script>");
                    }


                    string query = txt_query.Text;
                    string flag = "Book";
                    string status = "Appointment is booked by " + patient_nm;
                    cmdtxt = "insert into Book_Appointment values('" + Int_PatientId + "','" + patient_nm + "','" + pat_email + "','" + doctorid + "','" + drp_doctors.SelectedItem + "','" + drp_department.SelectedItem + "','" + txt_fees.Text + "','" + drp_diease.SelectedItem + "','" + drp_room.SelectedItem + "','" + flag + "','" + status + "','" + txt_Appointment_Dt.Text + "','"+query+"')";
                    SqlConnection c1 = new SqlConnection(connection_string);
                    c1.Open();
                    SqlCommand cmd1 = new SqlCommand(cmdtxt, c1);
                    int chk = cmd1.ExecuteNonQuery();
                    if (chk > 0)
                    {
                        if (tele != 0)
                        {
                            ////send message to register mobile no..
                           string s= SendMessage(tele, patient);
                            Response.Write("<script>alert('Appointment booked Sucessfully.... <br/><br/>')</script>");
                            clear_data();
                        }

                    }

                }
            }
        }
        /*private void SendPasswordReset(string ToEmail,  string name)
    {
        try
        {

            MailMessage msg = new MailMessage("1816510903@kit.ac.in", ToEmail);
            StringBuilder Email_body = new StringBuilder();
            Email_body.Append("Dear " + name + "  <br/><br/>");
            Email_body.Append("Your Appointment is booked ..Thank u for visiting..");
            Email_body.Append("<br/>");
            Email_body.Append("We all wish for you good health...");
            Email_body.Append("<br/><br/>");
            msg.IsBodyHtml = true;
            msg.Body = Email_body.ToString();

            msg.Subject = "Appointment Book ..";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

            smtp.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "1816510903@kit.ac.in",
                Password = "1816510903"
            };

            smtp.EnableSsl = true;
            smtp.Send(msg);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            Response.Write("<script>alert('There is some problem...  with mail security..')</script>");
        }
    }*/

        protected void lnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Doctor/View_Appointment");
        }

        protected void drp_doctors_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void drp_department_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                cmdtxt = "select distinct Doctorname,fees from doctor_register where ltrim(rtrim(department))=ltrim(rtrim('" + drp_department.SelectedItem.Text + "'))";
                SqlConnection cn = new SqlConnection(connection_string);
                cn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmdtxt, cn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                drp_doctors.DataSource = ds;
                drp_doctors.DataTextField = "Doctorname";
                drp_doctors.DataBind();
                txt_fees.Text = ds.Tables[0].Rows[0][1].ToString();
            }
            catch (Exception exx)
            {
                Response.Write("<script>alert('" + exx.Message.ToString() + "')</script>");
            }
        }

        private string SendMessage(long patient_mob, string patientname)
        {
            try
            {
                string patientmob = patient_mob.ToString();
                String message = HttpUtility.UrlEncode("This is a message from demo hospital dear  you have sucessfully book your appointment please take care of yourself ");
                using (var wb = new WebClient())
                {
                    byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "lrVQ9cdOo4I-GRaZgzYPvz1h8YHcwZ7znYQAuPKGm7"},
                {"numbers" , "916386018824"},
                {"message" , message},
                {"sender" , "TXTLCL"}
                });
                    string result = System.Text.Encoding.UTF8.GetString(response);
                    return result;
                }
            }
            catch (Exception e)
            {
                return " Response.Write(e.Message);";
            }
        }
    }
}