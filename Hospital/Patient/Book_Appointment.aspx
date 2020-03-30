<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book_Appointment.aspx.cs" Inherits="Hospital.Book_Appointment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Appointment...</title>
    <style>
        .main-box {
            position: absolute;
            height: 580px;
            width: 600px;
            color: black;
            background: rgba(241, 246, 241, 0.97);
            top: 25%;
            left: 10%;
            box-sizing:border-box;
        }
        .textboxes {
            margin-top:10px;
            margin-bottom:5px;
            margin-left:12px;
            height:32px;
            width:250px;
            border:1px solid blue ;
            border-radius:2px;
            padding:0px;
        }

        
         /*style for menus....start................... */
          ul{
                margin-top:2%;
                padding:0px;
                list-style:none;
            }
            ul li{
               float:right;
                width:150px;
                height:40px;
                background-color: black;
                opacity: .8;
                line-height: 40px;
                text-align: center;
                font-size: 15px;
                margin-right: 30px;
            }
            ul li a{
                text-decoration: none;
                color:WHITE;
                display: block;

            }
            ul li a:hover{
                background-color: #60dd3c;
            }
           
            ul li:hover ul li{
                display:block;
            }

            #head1
            {
                position:relative;
                height:75px;
                width:1350px;
                background-image:url('../images/m.jpg');background-repeat:repeat;
                background-size:auto;
            }

         /*style for menus....End................... */
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="head1">
                   <ul>
                       <li><a href="Patient_Registration.aspx">Logout</a></li>
                       <li><a href="Pay_your_bill_form.aspx">Pay Bill</a></li>
                       <li><a href="Patient_login.aspx">Login</a></li>
                       <li><a href="/index.html">Home</a></li>
                   </ul> 
            </div>

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <img src="../images/staff2.jpg" height="700" width="1450" />
            <div class="main-box">
                 <div><asp:Label ID="lbl1" runat="server" style="color:darkorange;font-size:23px;text-align:center;"></asp:Label></div>
               <div style="color:blue;font-size:22px;padding-left:35%"><h4>Book Appointment</h4></div>
               <table>
                   <tr>
                       <td>
                          <label id="lbl_depart">&nbsp;&nbsp;Select Department</label><br />
                       </td>
                       <td>
                          <label id="lbl_doctor">&nbsp;&nbsp;
                              Select Doctor</label><br />
                       </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="drp_department" runat="server" for="mob" CssClass="textboxes" OnSelectedIndexChanged="drp_department_SelectedIndexChanged" AutoPostBack="true" >
                                    <asp:ListItem>---SELECT DEPARTMENT---</asp:ListItem>
                                    <asp:ListItem>Dentist</asp:ListItem>
                                    <asp:ListItem>Cardiology</asp:ListItem>
                                    <asp:ListItem>Pathologist</asp:ListItem>
                                    <asp:ListItem>Radiology</asp:ListItem>
                                    <asp:ListItem>Ayurveda</asp:ListItem>
                                    <asp:ListItem>Homeopathy</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="drp_doctors" runat="server" for="mob" CssClass="textboxes" autopostback="true">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                       <td>
                          <label id="lbl_Appoint_dt">&nbsp; Select Appointment Date</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Appointment_Dt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_Appointment_Dt" ErrorMessage="Invalid Date" ForeColor="Red" ValidationExpression="^(?:0[1-9]|[12]\d|3[01])([/.-])(?:0[1-9]|1[12])\1(?:19|20)\d\d$"></asp:RegularExpressionValidator>
                       </td>
                       <td>
                          <label id="lbl_Appoint_tym">&nbsp;&nbsp Select Appointment Time</label><br />
                       </td>
                    </tr>
                   <tr>
                       <td>
                           <asp:TextBox ID="txt_Appointment_Dt" runat="server"  CssClass="textboxes" placeholder="dd-MM-yyyy" ></asp:TextBox>
                       </td>
                       <td>
                           <asp:TextBox ID="txt_Appointment_Dt0" runat="server" CssClass="textboxes" ></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                        <td>
                           <label id="lbl_disease0">&nbsp; Diease Name</label>     
                        </td>
                        <td> 
                           <label id="lbl_room0">&nbsp;  Room Type</label>
                        </td>
                   </tr>
                   <tr>
                        <td>
                           <asp:dropdownlist id="drp_diease" for="mob" runat="server" CssClass="textboxes">
                               <asp:ListItem>---SELECT DIEASENAME---</asp:ListItem>
                               <asp:ListItem>Allergies and Asthma</asp:ListItem>
                               <asp:ListItem>celiac diease</asp:ListItem>
                               <asp:ListItem>Liver Diease</asp:ListItem>
                               <asp:ListItem>Infection  diease</asp:ListItem>
                               <asp:ListItem>Heart Diease</asp:ListItem>
                               <asp:ListItem>Type1 Diabetes</asp:ListItem>
                           </asp:dropdownlist>
                        </td>
                        <td>
                            <asp:DropDownList ID="drp_room" runat="server" CssClass="textboxes">
                                <asp:ListItem>---Select RoomType----</asp:ListItem>
                                <asp:ListItem>VIP</asp:ListItem>
                                <asp:ListItem>Normal</asp:ListItem>
                            </asp:DropDownList>
                       </td>
                   </tr>
                   <tr>
                           <td>
                               <label id="lbl_name2">&nbsp; Write Your own query...</label>
                           </td>
                           <td>
                               <label id="lbl_room">&nbsp;&nbsp; Consultant Fees..</label>
                           </td>
                   </tr>
                   <tr>
                       <td>
                           <asp:TextBox ID="txt_query" runat="server" TextMode="MultiLine" CssClass="textboxes"></asp:TextBox>
                       </td>
                       <td>
                           <asp:TextBox ID="txt_fees" runat="server" CssClass="textboxes"></asp:TextBox>
                       </td>
                   </tr>

                   <tr>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                   </tr>
                   <tr>
                       <td colspan="2">
                           <asp:Button ID="btn" runat="server" Text="SUBMIT" style="background-color:blue;color:white;margin-left:10px;" Width="567px" Height="30px" OnClick="btn_Click"   />
                       </td>
                   </tr>
               </table>
                <br />
                <asp:LinkButton ID="lnk" runat="server" ForeColor="#FF3300" OnClick="lnk_Click"><center>View your Last Appointment</center></asp:LinkButton>
               <br />
                </div>
           
        </div>
    </form>
</body>
</html>
