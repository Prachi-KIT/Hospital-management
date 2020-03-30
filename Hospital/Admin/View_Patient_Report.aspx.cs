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
    public partial class View_Patient_Report : System.Web.UI.Page
    {
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string cmdtxt = "select  from Patient_Register";
                //SqlConnection cn = new SqlConnection(connection_string);
                //cn.Open();
                //DataSet ds = new DataSet();
                //SqlDataAdapter da = new SqlDataAdapter(cmdtxt, cn);
                //da.Fill(ds);
                //GridView1.DataSource = ds;
                //GridView1.DataBind();
            }
        }
    }
}