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
    public partial class Pay_your_bill_form : System.Web.UI.Page
    {
        String connection_string1 = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;
        string doctorid;
        string flag;
        string status;
        int appointmentid;
        string Appointmmentd;
        string pat_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void txt_pat_id_TextChanged(object sender, EventArgs e)
        {

            if (txt_pat_id.Text != "")
            {
                ///....check..Patient Id is valid or not....
                try
                {
                    string cmdtxt = "select Patient_id from Patient_register where ltrim(rtrim(id))=ltrim(rtrim('" + txt_pat_id.Text + "'))";
                    SqlConnection cn = new SqlConnection(connection_string1);
                    cn.Open();
                    SqlCommand cmd = new SqlCommand(cmdtxt, cn);
                    SqlDataReader da = cmd.ExecuteReader();
                    if (da.Read())
                    {
                        //If Patient Id is valid...then retreive related information from Book Appointment...

                        string cmdtxt1 = "select * from Book_Appointment where ltrim(rtrim(Pat_id))=ltrim(rtrim('" + da["Patient_id"].ToString() + "'))";
                        SqlConnection cn1 = new SqlConnection(connection_string1);
                        cn1.Open();
                        SqlCommand cmd1 = new SqlCommand(cmdtxt1, cn1);
                        SqlDataReader da1 = cmd1.ExecuteReader();
                        if (da1.Read())
                        {
                            txt_Pat_nm.Text = da1["patientname"].ToString();
                            txt_docnm.Text = da1["doctorname"].ToString();
                            txt_diease.Text = da1["Dieasename"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('No Appointement.. found..')</script>");
                            clearTextboxes();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else
            {
                Response.Write("<script>alert('Patient Id can not blank...')</script>");
            }
        }

        private void clearTextboxes()
        {
            txt_pat_id.Text = "";
            txt_Pat_nm.Text = "";
            txt_docnm.Text = "";
            txt_diease.Text = "";
            txt_amount.Text = "";
        }
        protected void btn_paybill_Click(object sender, EventArgs e)
        {
            if(Page.IsPostBack)
            {

                if (Page.IsValid)
                {
                    try
                    {
                        string cmdtxt1 = "select Patient_id from Patient_register where ltrim(rtrim(id))=ltrim(rtrim('" + txt_pat_id.Text + "'))";
                        SqlConnection cn1 = new SqlConnection(connection_string1);
                        cn1.Open();
                        SqlCommand cmd1 = new SqlCommand(cmdtxt1, cn1);
                        SqlDataReader da1 = cmd1.ExecuteReader();
                        if (da1.Read())
                        {
                            pat_id = da1["Patient_id"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Patient Id not found..')</script>");
                        clearTextboxes();
                    }

                    ///second.condition...start..
                    if (pat_id != "")
                    {
                        try
                        {
                            ///Write twice..this code due..to postback...

                            string cmdtxt1 = "select * from Book_Appointment where ltrim(rtrim(Pat_id))=ltrim(rtrim('" + pat_id + "'))";
                            SqlConnection cn1 = new SqlConnection(connection_string1);
                            cn1.Open();
                            SqlCommand cmd1 = new SqlCommand(cmdtxt1, cn1);
                            SqlDataReader da1 = cmd1.ExecuteReader();
                            if (da1.Read())
                            {

                                doctorid = da1["Doc_id"].ToString();
                                flag = "PAID";
                                status = "Paid By the Patient";
                                appointmentid = Convert.ToInt32(da1["Id"]);

                                ///inserted data into....Pay your bill table....

                                string cmdtxt2 = "insert into Pay_Your_Bill values('" + pat_id + "','" + txt_Pat_nm.Text + "','" + doctorid + "','" + txt_docnm.Text + "','" + txt_diease.Text + "','" + txt_amount.Text + "','" + flag + "','" + status + "','" + "kuch bi" + "','" + System.DateTime.Today +"','" + appointmentid + "','')";
                                SqlConnection cn = new SqlConnection(connection_string1);
                                cn.Open();
                                SqlCommand cmd = new SqlCommand(cmdtxt2, cn);
                                int chk = cmd.ExecuteNonQuery();
                                if (chk > 0)
                                {
                                    string query = "update Book_Appointment set flag='" + flag + "',status='" + status + "' where ltrim(rtrim(pat_id))=ltrim(rtrim('" + pat_id + "')) ";
                                    cn.Close();
                                    cn.Open();
                                    SqlCommand cmd_q = new SqlCommand(query, cn);
                                    int chk_update = cmd_q.ExecuteNonQuery();
                                    Response.Write("<script>alert('Your bill is sucessfully paid')</script>");
                                    clearTextboxes();
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Patient Id incorrect..')</script>");
                                clearTextboxes();
                            }
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('Patient Id incorrect..or Appointment is not found..')</script>");
                            clearTextboxes();
                        }
                    }
                }
            }
        }
    }
}

