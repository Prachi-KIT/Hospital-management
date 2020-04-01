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
                string cmdtxt = "select p.patient_id,p.patientname,b.department,p.email,p.age,p.contactno,b.diease,b.fees,b.Reg_date,b.flag,b.query from Patient_Register p inner join Book_Appointment b on p.patient_id=b.Patient_id";
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