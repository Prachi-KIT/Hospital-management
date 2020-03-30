<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pay_your_bill_form.aspx.cs" Inherits="Hospital.Pay_your_bill_form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pay Your bill Form</title>
     <style>
        .main
        {
           margin-left:3%;
           margin-right:86%;
           background-color:white;
        }
        .auto-style1 {
            width: 503px;
        }
        .Signup-box {
            position: absolute;
            height: 400px;
            width: 600px;
            color: black;
            background: rgba(241, 246, 241, 0.80);
            top: 21%;
            left: 47%;
            box-shadow:
                inset 0 -3em 3em rgba(0,0,0,0.1),
                      0   0    0    rgba(0,0,0,0.1),
                      0   0    1em   rgba(0,0,0,0.3)
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
                height:50px;
                width:1350px;
                background-image:url('../images/m.jpg');background-repeat:repeat;
                background-size:auto;
            }

         /*style for menus....End................... */
 

    </style>
</head>
<body>
     <form id="form2" runat="server">
         <div id="head1">
                   <ul>
                       <li><a href="Patient_Registration.aspx">Logout</a></li>
                       <li><a href="Patient_login.aspx">Login</a></li>
                       <li><a href="/index.html">Home</a></li>
                   </ul> 
            </div>
          <div style="height:auto;width:1450px">
          <br />
              <img src="../images/Background5.jpg" height="1000" width="1450"/>
            <div class="Signup-box">
                <br />
                     <label for="l" style="margin-top:600px;font-size:x-large;color:#00ccff;"><center><b>Pay Your Bill Form</b></center></label>
            <br /><br />
               <div class="main">
                    <table>
                              <tr>
                                     <td>&nbsp;&nbsp;&nbsp; Patient Id<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_pat_id" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                     </td>
                                     <td>
                                         <label for="Lname" style="margin-left:10px;">Patient&nbsp; Name<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Pat_nm" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                         </label></td>
                              </tr>     
                              <tr>
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_pat_id" runat="server" Height="23px" style="margin-left: 10px" Width="250px" CssClass="Signup_textboxes" OnTextChanged="txt_pat_id_TextChanged" AutoPostBack="True"  ></asp:TextBox>
                                    </td>
                            
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_Pat_nm" runat="server" Height="24px" style="margin-left: 10px" Width="250px" CssClass="Signup_textboxes" ></asp:TextBox>
                                    </td>
                          
                              </tr>
                              <tr>
                                    <td><label for="email" style="margin-left:10px;">Doctor Name<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_docnm" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </label></td>
                                    <td><label for="coun" style="margin-left:10px;">Disease Name<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_diease" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </label></td>
                              </tr>
                              <tr>
                                    <td>
                                        <asp:TextBox ID="txt_docnm" runat="server" Height="25px" style="margin-left: 10px" Width="250px" CssClass="Signup_textboxes" ></asp:TextBox>
                                    </td> 
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_diease" runat="server" Height="24px" style="margin-left: 10px" Width="250px" CssClass="Signup_textboxes"></asp:TextBox>
                                   </td>
                              </tr>
                              <tr>
                                    <td class="auto-style1">
                                        <label for="mob" style="margin-left:10px;">Bill Amount<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_amount" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_amount" ErrorMessage="InValid Amount" ForeColor="Red" ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                                        </label></td>
                                    <td class="auto-style1">&nbsp;</td>

                              </tr>
                              <tr>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txt_amount" runat="server" Height="26px" style="margin-left: 10px" Width="250px" CssClass="Signup_textboxes" ></asp:TextBox>
                                    </td>
                                    <td class="auto-style1">
                                        &nbsp;</td>

                              </tr>
                              <tr>
                                    <td class="auto-style1">
                                        &nbsp;</td>
                                    <td class="auto-style1">
                                        &nbsp;</td>
                              </tr>
                              </table>
                    <br />
                    <table>
                        <tr>
                          <td><asp:Button ID="btn_paybill" runat="server" BackColor="#00ccff" ForeColor="#FFFFCC" Height="34px" Width="520px" style="margin-left: 9px" Text="Pay Bill" OnClick="btn_paybill_Click" /></td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>

                        </tr>
                    </table>
                    <br />
                 </div>
                </div>
           </div>
    </form>
</body>
</html>
