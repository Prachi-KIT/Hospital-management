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
    public partial class Doctor_Registeration : System.Web.UI.Page
    {
        string pwd;
        string id;
        string cmdtxt1;
        int new_doc;
        int chk,k,k1;
        String img;
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txt_id.Enabled = false;
                cmdtxt1 = "select Doc_id from doctor_Register order by Doc_id desc";
                SqlConnection c = new SqlConnection(connection_string);
                c.Open();
                SqlCommand cm = new SqlCommand(cmdtxt1, c);
                SqlDataReader da = cm.ExecuteReader();
                if (da.Read())
                {
                    new_doc = Convert.ToInt32(da["Doc_id"].ToString());
                    new_doc = new_doc + 1;
                }
                else
                {
                    new_doc = 1;
                }

                id = "DOC" + System.DateTime.Now.ToString("dd/MMM/yyyy") + new_doc;
                txt_id.Text = id;
                txt_id.Enabled = false;
            }
        }

        public int Check_duplicate_Id()
        {
            int duplicate;
            cmdtxt1 = "select * from Doctor_Register where ltrim(rtrim(id))=ltrim(rtrim('" + txt_id.Text + "')) and userType='DOCTOR'";
            SqlConnection cn = new SqlConnection(connection_string);
            cn.Open();
            SqlCommand cmd = new SqlCommand(cmdtxt1, cn);
            SqlDataReader da = cmd.ExecuteReader();
            if (da.Read())
            {
                duplicate = 1;
            }
            else
            {
                duplicate = 0;
            }
            return duplicate;
        }

      

        protected void btn_upload_Click(object sender, EventArgs e)
        {
             if(image_upload.HasFile)
                {
                    image_upload.SaveAs(Server.MapPath("~\\images\\"+image_upload.FileName));
                    img = "~\\images\\" + image_upload.FileName;
                    lbl_upldmsge.Text = "Image uploaded sucessfully";
                    lbl_upldmsge.ForeColor = System.Drawing.Color.ForestGreen;
                }
             else
                {
                    lbl_upldmsge.Text = "Please select Image ";
                    lbl_upldmsge.ForeColor = System.Drawing.Color.Red;
                }
           }

        public void clear_Data()
        {
            txt_id.Text = "";
            txt_docnm.Text = "";
            txt_email.Text = "";
            txt_pass.Text = "";
            txt_age.Text = "";
            txt_fees.Text = "";
            drp_gender.SelectedIndex = -1;
            drp_degree.SelectedIndex = -1;
            drp_department.SelectedIndex = -1;
            txt_address.Text = "";
            txt_tele.Text = "";
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Write(pwd);
            cmdtxt1 = "";

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
                                    string date = "getdate()";
                                    string cmdtxt = "insert into doctor_Register values('" + txt_docnm.Text + "','" + txt_email.Text + "','" + txt_pass.Text + "','" + drp_gender.SelectedItem + "','" + txt_age.Text + "','"+drp_department.Text+"','" + txt_fees.Text + "','" + txt_tele.Text + "','" + txt_address.Text + "'," + date + ",'" + "DOCTOR" + "','" + txt_id.Text + "','"+ img +"')";
                                    using (SqlCommand cmd = new SqlCommand(cmdtxt, cn, tran))
                                    {
                                        chk = cmd.ExecuteNonQuery();
                                    }
                                    if (chk > 0)
                                    {
                                        string query = "insert into login values('" + txt_email.Text + "','" + "DOCTOR" + "','" + pwd + "','" + txt_id.Text + "')";
                                        using (SqlCommand cm = new SqlCommand(query, cn, tran))
                                        {
                                            k = cm.ExecuteNonQuery();
                                        }
                                    }
                                    if (k > 0)
                                    {
                                        string query1 = "insert into Sign_Up values('" + txt_docnm.Text + "','" + txt_email.Text + "','" + "DOCTOR" + "','" + pwd + "')";
                                        using (SqlCommand cm1 = new SqlCommand(query1, cn, tran))
                                        {
                                            k1 = cm1.ExecuteNonQuery();
                                            if (k1 > 0)
                                            {
                                                Response.Write("<script>alert('Doctor Are Sucessfully Registered')</script>");
                                                clear_Data();
                                                new_doc = new_doc + 1;
                                                id = "DOC" + System.DateTime.Now.ToString("dd/MMM/yyyy") + new_doc;
                                                txt_id.Text = id;
                                            }
                                        }
                                    }
                                    tran.Commit();
                                }

                                catch (Exception ex)
                                {

                                    tran.Rollback();
                                    Response.Write("<script>alert('Invalid Doctor..Email... Already..exist')</script>");

                                }
                            }
                        }
                       
                    }
                }
            }
        }
    }
}