<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient_login.aspx.cs" Inherits="Hospital.Patient_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Login Form</title></head>
    <body>
     <style>
         body{
             background-image:url("../images/Background4.jpg");
         }
        .Login-box {
            position: fixed;
            height: 350px;
            width: 530px;
            color: black;
            background: rgba(241, 246, 241, 0.98);
            top: 25%;
            left: 10%;
            box-sizing:border-box;
        }
        .textboxes {
            margin-left:43%;
            margin-bottom:5px;
            margin-top:10px;
            height:30px;
            width:250px;
            border:2px solid #65e2ea;
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
            background-color:#09afff;
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

         /*style for menus....start................... */

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
                margin-right: 2px;
            }
            ul li a{
                text-decoration: none;
                color:WHITE;
                display: block;

            }
            ul li a:hover{
                background-color: #60dd3c;
            }
            ul li ul li{
                display: none;
            }
            ul li:hover ul li{
                display:block;
            }
            #head1
            {
                position:fixed;
                height:180px;
                width:1350px;
                background-image:url('../images/m.jpg');background-repeat:repeat;
                background-size:auto;
            }

            /*style for menus....Ending................... */
        
    </style>
    <form id="form1" runat="server">
        <div>

             <div id="head1">
                 <h1 style="margin-left:44%;"> Welcome to LifeCare Hospital</h1><br />
                   <ul>
                       <li><a href="Patient_Registration.aspx">Logout</a></li>
                        <li><a href="Patient_Registration.aspx">Registration</a></li>
                       <li><a href="Pay_your_bill_form.aspx">Pay Bill</a></li>
                        <li><a href="/index.html">Home</a></li>
                   </ul> 
            </div>

                <div class="Login-box">
                     <h2><center>Patient Login</center></h2>
                     <div style="height:400px;width:520px;position:relative">
                            <div style="position:absolute;top:5px;left:2px;">
                                <img src="../images/logo3.png"/>
                            </div>
                            <div style="position:absolute;top:0px;right:40px;left:15px;padding-left:45px;width:500px;">
                                <br />
                                    <label id="lbl_name" class="lbl"><b>Patient Email</b></label><br />
                                    <asp:TextBox ID="txt_pat_nm" runat="server" CssClass="textboxes"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txt_pat_nm" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <label id="lbl_pat_Id" class="lbl"><b>Patient Id</b></label><br />
                                    <asp:TextBox ID="txt_pat_id" runat="server" CssClass="textboxes"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txt_pat_id"></asp:RequiredFieldValidator>
                                    <label id="lbl_pass" class="lbl"><b>Password</b></label><br />
                                    <asp:TextBox ID="txt_pass" runat="server" CssClass="auto-style1" Height="28px" Width="250px" TextMode="Password" ForeColor="Red"></asp:TextBox><br />
                            </div>
                            <div style="position:absolute;top:250px;left:10px;">
                                <asp:Button ID="btn_submit" runat="server" Text="SUBMIT" CssClass="btn" OnClick="btn_submit_Click" /><br /><br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="lnk_for_pass" runat="server" Font-underline="false">Forget Password?</asp:LinkButton><span><asp:LinkButton ID="lnk_signup" runat="server" Font-underline="false" >Sign Up here</asp:LinkButton></span>
                            </div>
                      </div>
               </div>
        </div>
    </form>
</body></html>
