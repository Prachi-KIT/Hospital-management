using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class Doctor_login : System.Web.UI.Page
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
                    string cmdtxt = "select * from Login where id='"+txt_doc_id.Text+"' and Pwd='" + txt_pass.Text + "' and Email='" + txt_email.Text + "'";
                    SqlConnection cn = new SqlConnection(connection_string);
                    cn.Open();
                    SqlCommand cmd = new SqlCommand(cmdtxt, cn);
                    SqlDataReader da = cmd.ExecuteReader();
                    if (da.Read())
                    {
                        HttpCookie ck = new HttpCookie("Doctor_info");
                        ck["id"] = txt_doc_id.Text;
                        Response.Cookies.Add(ck);
                        ck.Expires = DateTime.Now.AddDays(30);
                        Response.Redirect("../Doctor/View_Appointment.aspx",false);
                    }
                    else
                    {
                        Response.Write("<script>Alert('Invalid User')</script>");
                    }

                }
            }
        }
    }
}