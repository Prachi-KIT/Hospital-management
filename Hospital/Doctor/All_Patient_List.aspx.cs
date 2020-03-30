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
    public partial class All_Patient_List : System.Web.UI.Page
    {
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cmdtxt = "select id,Patientname,Email,Gender,Age,Contactno,DOB,Marital_status,Address,Reg_date,UserType from Patient_Register";
                SqlConnection cn = new SqlConnection(connection_string);
                cn.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmdtxt, cn);
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/index.html");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Doctor_Registeration.aspx");
        }
    }
}