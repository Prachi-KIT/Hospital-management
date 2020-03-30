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

namespace Hospital
{
    public partial class Book_Appointment : System.Web.UI.Page
    {
        string cmdtxt;
        int doctorid;
        string patient_id;
        string pat_email;
        string patient_nm;
        int Int_PatientId;
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
                    cmdtxt = "select Doc_id from doctor_register where ltrim(rtrim(Doctorname))=ltrim(rtrim('" + drp_doctors.SelectedItem + "'))";
                    SqlConnection c = new SqlConnection(connection_string);
                    c.Open();
                    SqlCommand cmd = new SqlCommand(cmdtxt, c);
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        doctorid = Convert.ToInt32(r["Doc_id"]);
                    }
                    else
                    {
                        Response.Write("<script>alert('Doctor is not Register')</script>");
                    }

                    string cmdtxt1 = "select Patient_id from Patient_register where ltrim(rtrim(Email))=ltrim(rtrim('" + pat_email + "')) and id='" + patient_id + "'";
                    SqlConnection con = new SqlConnection(connection_string);
                    con.Open();
                    SqlCommand comd = new SqlCommand(cmdtxt1, con);
                    SqlDataReader r1 = comd.ExecuteReader();
                    if (r1.Read())
                    {
                        Int_PatientId = Convert.ToInt32(r1["Patient_id"]);
                    }
                    else
                    {
                        Response.Write("<script>alert('Patient is not Register')</script>");
                    }



                    string flag = "Book";
                    string status = "Appointment is booked by " + patient_nm;
                    cmdtxt = "insert into Book_Appointment values('" + Int_PatientId + "','" + doctorid + "','" + patient_nm + "','" + drp_doctors.SelectedItem + "','" + drp_department.SelectedItem + "','"+txt_fees.Text+"','" + drp_diease.SelectedItem + "','" + drp_room.SelectedItem + "','" + flag + "','" + status + "','" + pat_email + "','" + txt_Appointment_Dt.Text + "')";
                    SqlConnection c1 = new SqlConnection(connection_string);
                    c1.Open();
                    SqlCommand cmd1 = new SqlCommand(cmdtxt, c1);
                    int chk = cmd1.ExecuteNonQuery();
                    if (chk > 0)
                    {
                        if (pat_email != "")
                        {
                            ////send....mail..regarding...book appointment by the patient.
                            //  SendPasswordReset(pat_email, "1816510903@kit.ac.in", patient_nm);
                            Response.Write("<script>alert('Appointment booked Sucessfully....')</script>");
                            clear_data();
                        }

                    }

                }
            }
        }
        private void SendPasswordReset(string ToEmail, string From, string name)
        {
            try
            {

                MailMessage msg = new MailMessage(From, ToEmail);
                StringBuilder Email_body = new StringBuilder();
                Email_body.Append("Dear " + name + "  <br/><br/>");
                Email_body.Append("Appointment is booked by you..Thank u for visiting..");
                Email_body.Append("<br/>");
                Email_body.Append("We all wish for you good health...");
                Email_body.Append("<br/><br/>");
                msg.IsBodyHtml = true;
                msg.Body = Email_body.ToString();

                msg.Subject = "Book Appointment..";
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
                Response.Write("<script>alert('There is some problem...  with mail security..')</script>");
            }
        }

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
                txt_fees.Text=ds.Tables[0].Rows[0][1].ToString();
            }
            catch (Exception exx)
            {
                Response.Write("<script>alert('" + exx.Message.ToString() + "')</script>");
            }
        }
    }
}
     