using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hospital
{
    public partial class Patient_login : System.Web.UI.Page
    {
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }


        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Page.IsValid)
                {
                    try
                    {
                        string cmdtxt1 = "select name from sign_up where userType='PATIENT' and Pwd='" + txt_pass.Text + "' and email='" + txt_pat_nm.Text + "'";
                        SqlConnection cn1 = new SqlConnection(connection_string);
                        cn1.Open();
                        SqlCommand cmd1 = new SqlCommand(cmdtxt1, cn1);
                        SqlDataReader da1 = cmd1.ExecuteReader();
                        if (da1.Read())
                        {
                            string Patient_Name = da1["name"].ToString();
                            string cmdtxt = "select * from Login where userType='PATIENT' and Pwd='" + txt_pass.Text + "' and Id='" + txt_pat_id.Text + "' and email='" + txt_pat_nm.Text + "'";
                            SqlConnection cn = new SqlConnection(connection_string);
                            cn.Open();
                            SqlCommand cmd = new SqlCommand(cmdtxt, cn);
                            SqlDataReader da = cmd.ExecuteReader();
                            if (da.Read())
                            {
                                HttpCookie ck = new HttpCookie("UserInfo");
                                ck["Name"] = Patient_Name;
                                ck["Patien_Id"] = txt_pat_id.Text;
                                ck["Email"] = txt_pat_nm.Text;
                                Response.Cookies.Add(ck);
                                ck.Expires = DateTime.Now.AddDays(30);
                                Response.Redirect("Book_Appointment.aspx",false);
                            }
                            else
                            {
                                Response.Write("<Script>Alert('Invalid User....')</script>");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "')</script>");
                    }
                }
            }
           }
        }
    }

