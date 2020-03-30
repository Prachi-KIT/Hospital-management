<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor_login.aspx.cs" Inherits="Hospital.Doctor_login" %>
<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor Login Form....</title>
    <style>
        .Login-box {
            position: fixed;
            height: 400px;
            width: 530px;
            color: black;
            background:rgba(245, 231, 231,0.80);
            top: 30%;
            left: 10%;
            box-sizing:border-box;
        }
        .textboxes {
            margin-left:43%;
            margin-bottom:5px;
            margin-top:10px;
            height:30px;
            width:270px;
            border:2px solid #3176f2;
            border-radius:2px;
        }
        .lbl{
            margin-left:43%;
            margin-bottom:5px;
            margin-top:10px;
            height:30px;
            width:270px;
        }
        .btn{
            height:35px;
            width:510px;
            background-color:blue;
            color:white;
        }
        #lnk_for_pass{
            color:#09afff;
            margin-left:60px;
        }
        #lnk_signup{
            color:#09afff;
            margin-left:90px;
        }
        
        .auto-style1 {
            margin-left: 43%;
            margin-bottom: 5px;
            margin-top: 10px;
            border: 2px solid #65e2ea;
            border-radius: 2px;
        }
        
        /*style form menus....start................... */

        ul{
                margin:0px;
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
                position:fixed;
                height:180px;
                width:1350px;
                background-image:url('../images/m.jpg');
                background-repeat:repeat;
                background-size:auto;
            }
      /*style form menus....End..................... */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             
             <div id="head1">
                <h1 style="margin-left:40%;"> Welcome to LifeCare Hospital</h1><br />
                   <ul>
                        <li><a href="/index.html">Home</a></li>
                        <li><a href="Doctor_Registeration.aspx">Registration</a></li>
                        <li><a href="View_Appointment.aspx">View Appointment</a></li>
                        <li><a href="All_Patient_List.aspx">Patient List</a></li>
                        <li><a href="Doctor_Registeration.aspx">Logout</a></li>
                  </ul>
            </div>
                    <img src="../images/Background1.jpg" height="800" width="1450"/>
                <div class="Login-box">
                     <h2><center>Doctor Login</center></h2>
                     <div style="height:400px;width:500px;position:relative">
                            <div style="position:absolute;top:10px;left:2px;">
                                <img src="../images/logo1 (2).png" style="border-radius:100px;"/>
                            </div>
                            <div style="position:absolute;top:5px;right:50px;left:30px;padding-left:50px;">
                                <br />
                                <label id="lbl_name" class="lbl"><b>Doctor Email</b><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </label>
                                <br />
                                <asp:TextBox ID="txt_email" runat="server" CssClass="textboxes"></asp:TextBox><br />
                                <label id="lbl_pat_Id" class="lbl"><b>Doctor ID</b></label>
                                <label>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_doc_id" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </label>
                                <br />
                                <asp:TextBox ID="txt_doc_id" runat="server" CssClass="textboxes"></asp:TextBox><br />
                                 <label id="lbl_pass" class="lbl"><b>Password</b><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_pass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </label>
                                <br />
                                <asp:TextBox ID="txt_pass" runat="server" CssClass="textboxes" TextMode="Password" Height="28px" Width="268px"></asp:TextBox><br />
                            </div>
                            <div style="position:absolute;top:250px;left:10px;">
                                <asp:Button ID="btn_submit" runat="server" Text="SUBMIT" CssClass="btn" OnClick="btn_submit_Click" /><br /><br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                      </div>
               </div>
        </div>
    </form>
</body>
</html>
