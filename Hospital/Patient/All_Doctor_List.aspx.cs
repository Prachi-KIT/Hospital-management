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
    public partial class All_Doctor_List : System.Web.UI.Page
    {
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string cmdtxt = "select Id,DoctorName,Email,Address,Gender,Fees,Age,Contactno,Reg_date from doctor_Register";
                SqlConnection cn = new SqlConnection(connection_string);
                cn.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmdtxt, cn);
                da.Fill(ds);
                Gridview1.DataSource = ds;
                Gridview1.DataBind();
               
            }
        }
    }
}