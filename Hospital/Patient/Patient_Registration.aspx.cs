using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hospital.Patient
{
    public partial class Patient_Registration : System.Web.UI.Page
    {
        string cmdtxt;
        int id;
        string Pat_id;
        string dt;
        int chk,k,k1;
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
            
            cmdtxt = "select id from Patient_Register order by patient_id desc";
            SqlConnection cn = new SqlConnection(connection_string);
            cn.Open();
            SqlCommand cmd = new SqlCommand(cmdtxt, cn);
            SqlDataReader da = cmd.ExecuteReader();
            if (da.Read())
            {
                id = Convert.ToInt32(da["id"]) + 1;
            }
            else
            {
                id = 1;
            }
            Pat_id = "PAT" + System.DateTime.Now.ToString("dd/MMM/yyyy") + id;
            txt_pid.Text = Pat_id;
            txt_pid.Enabled = false;
            dt = "getdate()";
        }

        public void clear_data()
        {
            txt_pid.Text = "";
            txt_pname.Text = "";
            txt_tele.Text = "";
            txt_pass.Text = "";
            txt_email.Text = "";
            txt_age.Text = "";
            txt_add.Text = "";
            drp_gender.SelectedIndex = -1;
            drp_maristatus.SelectedIndex = -1;
            txt_Dob.Text = "";
        }

        public int Check_duplicate_Id()
        {
            int duplicate;
            cmdtxt = "select * from Patient_Register where ltrim(rtrim(id))=ltrim(rtrim('"+ txt_pid.Text + "')) and usertype='PATIENT'";
            SqlConnection cn = new SqlConnection(connection_string);
            cn.Open();
            SqlCommand cmd = new SqlCommand(cmdtxt, cn);
            SqlDataReader da = cmd.ExecuteReader();
            if(da.Read())
                {
                    duplicate = 1;
                }
            else
                {
                    duplicate = 0;
                }
            return duplicate;
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Page.IsValid)
                {
                    int dup = Check_duplicate_Id();
                    if (dup == 0)
                    {
                        using (SqlConnection cn = new SqlConnection(connection_string))
                        {
                            cn.Open();
                            using (SqlTransaction tran = cn.BeginTransaction())
                            {
                                try
                                {
                                    string cmdtxt;
                                    long tele = Convert.ToInt64(txt_tele.Text);
                                    string f = "getdate()";
                                   cmdtxt = "insert into Patient_Register values('" + txt_pname.Text + "','" + txt_email.Text + "','" + txt_pass.Text + "','" + drp_gender.SelectedItem.Text + "','" + txt_age.Text + "'," + tele + ",'" + txt_Dob.Text + "','" + drp_maristatus.SelectedItem.Text + "','" + txt_add.Text + "'," + dt + ",'PATIENT','" + txt_pid.Text + "')";
                                    using (SqlCommand cmd = new SqlCommand(cmdtxt, cn, tran))
                                    {
                                        chk = cmd.ExecuteNonQuery();
                                    }
                                    if (chk > 0)
                                    {
                                        string cmdtxt1 = "insert into login values('" + txt_email.Text + "','PATIENT','" + txt_pass.Text + "','" + txt_pid.Text + "')";
                                        using (SqlCommand cm = new SqlCommand(cmdtxt1, cn, tran))
                                        {
                                            k = cm.ExecuteNonQuery();
                                        }

                                    }
                                    if (k > 0)
                                    {
                                        string cmdtxt2 = "insert into sign_up values('" + txt_pname.Text + "','" + txt_email.Text + "','PATIENT','" + txt_pass.Text + "')";
                                        using (SqlCommand cm1 = new SqlCommand(cmdtxt2, cn, tran))
                                        {
                                            k1 = cm1.ExecuteNonQuery();
                                            if (k1 > 0)
                                            {
                                                Response.Write("<script>alert('Patient sucessfully..Register.')</script>");
                                                id = id + 1;
                                                Pat_id = "PAT" + System.DateTime.Now.ToString("dd/MMM/yyyy") + id;
                                                clear_data();
                                                txt_pid.Text = Pat_id;
                                            }
                                        }
                                        tran.Commit();
                                    }
                                }


                                catch (Exception ex)
                                {

                                    tran.Rollback();
                                    Response.Write("<script>alert('Invalid Doctor..Patient... Already..exist')</script>");

                                }
                          }
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Duplicate Patient Id...')</script>");
                    
                }
              
            }
        }
    }
}