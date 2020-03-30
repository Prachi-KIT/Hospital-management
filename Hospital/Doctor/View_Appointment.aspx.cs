using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hospital.Doctor
{

    public partial class View_Appointment : System.Web.UI.Page
    {
        string cmdtxt;
        string doc_name;
        Boolean cookie_flag;
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           // if(!IsPostBack)
           // {
                HttpCookie cookie = Request.Cookies["Doctor_info"];
                if (cookie != null)
                {
                    cookie_flag = true;
                    string cmd = "select Doctorname,department from doctor_Register where ltrim(rtrim(id))=ltrim(rtrim('" + cookie["id"].ToString()+"'))";
                    SqlConnection c = new SqlConnection(connection_string);
                    c.Open();
                    SqlCommand cm = new SqlCommand(cmd, c);
                    SqlDataReader d=cm.ExecuteReader();
                    if (d.Read())
                    {
                        doc_name = d["doctorname"].ToString();
                        string cmdtxt = "select * from Book_Appointment where ltrim(rtrim(doctorname))=ltrim(rtrim('"+d["doctorname"].ToString()+"'))";
                        SqlConnection cn = new SqlConnection(connection_string);
                        cn.Open();
                        DataSet ds = new DataSet();
                        SqlDataAdapter da = new SqlDataAdapter(cmdtxt, cn);
                        da.Fill(ds);
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                        lbl_info.Text = "View Appointments" + "(Doctor : " + d["doctorname"].ToString() + " - " + d["department"].ToString() + ")";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Appointment is not found...')</script>");
                }
          //  }
           

        }
        protected void btn_by_id_Click(object sender, EventArgs e)
        {
            if (txt_pat_id.Text != "")
            {
              cmdtxt = "select * from Book_Appointment where ltrim(rtrim(patientid)) = ltrim(rtrim('" + txt_pat_nm.Text + "')) and ltrim(rtrim(doctorname))= ltrim(rtrim('" + doc_name + "'))";

               // string cmdtxt = "select Patientname, Doctorname, Department, Dieasename, RoomType, pat_email, Status, Appointment_date from Book_Appointment where ltrim(rtrim(patientid)) = ltrim(rtrim('" + txt_pat_nm.Text + "')) and ltrim(rtrim(doctorname))= ltrim(rtrim('" + doc_name + "'))";
            }
            else
            {
              cmdtxt = "select * from Book_Appointment where ltrim(rtrim(patientid)) = ltrim(rtrim('" + txt_pat_nm.Text + "')) and ltrim(rtrim(doctorname))= ltrim(rtrim('" + doc_name + "'))";

                //cmdtxt = "select Patientname,Doctorname ,Department,Dieasename,RoomType,pat_email,Status,Appointment_date from Book_Appointment where ltrim(rtrim(patientname))=ltrim(rtrim('" + txt_pat_nm.Text + "')) ";

            }
            SqlConnection cn = new SqlConnection(connection_string);
            cn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmdtxt, cn);
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void btn_by_name_Click(object sender, EventArgs e)
        {
            try
            {
               
                    if (txt_pat_nm.Text != "")
                    {
                     cmdtxt  = "select * from Book_Appointment where ltrim(rtrim(patientname)) = ltrim(rtrim('" + txt_pat_nm.Text + "')) and ltrim(rtrim(doctorname))= ltrim(rtrim('" + doc_name + "'))";

                    //cmdtxt = "select Patientname,Doctorname ,Department,Dieasename,RoomType,pat_email,Status,Appointment_date from Book_Appointment where ltrim(rtrim(patientname))=ltrim(rtrim('" + txt_pat_nm.Text + "')) and ltrim(rtrim(doctorname))=ltrim(rtrim('" + doc_name + "'))";
                    }
                    else
                    {
                    cmdtxt = "select * from Book_Appointment where ltrim(rtrim(doctorname))= ltrim(rtrim('" + doc_name + "'))";

                    //cmdtxt = "select Patientname,Doctorname ,Department,Dieasename,RoomType,pat_email,Status,Appointment_date from Book_Appointment where ltrim(rtrim(doctorname))=ltrim(rtrim('" + doc_name + "'))";
                }
                SqlConnection cn = new SqlConnection(connection_string);
                cn.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmdtxt, cn);
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lnk_home_Click(object sender, EventArgs e)
        {
            Response.Redirect("/index.html");
        }

        protected void lnk_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Doctor_Registeration.aspx");
        }
    }
    }
