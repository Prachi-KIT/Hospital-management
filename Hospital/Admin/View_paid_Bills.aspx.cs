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
    public partial class View_paid_Bills : System.Web.UI.Page
    {
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
              if (!IsPostBack)
                {
                    string cmdtxt = "select  A.Patientname,B.DoctorName,a.Id,a.Email,a.Gender,a.Age,A.contactno,A.Address,B.department,B.consult_fee,B.status from Patient_Register as a inner join Book_Appointment as B on a.patient_Id=B.Pat_id and B.Flag='PAID'";
                    SqlConnection cn = new SqlConnection(connection_string);
                    cn.Open();
                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(cmdtxt, cn);
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
        }
    }
