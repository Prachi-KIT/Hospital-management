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
    public partial class Default : System.Web.UI.Page
    {
        String connection_string = ConfigurationManager.ConnectionStrings["Hospital"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl1.Visible = true;
            btn.Visible = true;
            lbl2.Visible = true;
            lbl3.Visible = true;
            lbl4.Visible = true;
            Btn2.Visible = true;
            Btn4.Visible = true;
            Btn3.Visible = true;
            btn.Visible = true;
            btn.Visible = true;
        }

        protected void lnk_Home_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.PopupControlID = Pnl1.ID;
            ModalPopupExtender1.TargetControlID = lnk_Home.ID;
        }

        protected void lnk_services_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.PopupControlID = Pnl2.ID;
            ModalPopupExtender2.TargetControlID = lnk_services.ID;
        }

        protected void lnk_doctor_Click(object sender, EventArgs e)
        {
            ModalPopupExtender3.PopupControlID = Pnl3.ID;
            ModalPopupExtender3.TargetControlID = lnk_doctor.ID;
        }

        protected void lnk_contact_Click(object sender, EventArgs e)
        {
            ModalPopupExtender4.PopupControlID = Pnl4.ID;
            ModalPopupExtender4.TargetControlID = lnk_contact.ID;
        }

      
        protected void btn_login_Click(object sender, EventArgs e)
        {
            string cmdtxt = "select * from Login where userType='ADMIN' and Email='" + txt_email.Text + "' and Pass='" + txt_pass.Text + "'";
            SqlConnection cn = new SqlConnection(connection_string);
            cn.Open();
            SqlCommand cmd = new SqlCommand(cmdtxt, cn);
            SqlDataReader da = cmd.ExecuteReader();
            if(da.Read())
            {
                Response.Redirect("../Admin/Admin_Home.aspx");
            }
            else
            {
                Response.Write("<Script>Alert('Invalid User')</script>");
            }

        }
    }
}