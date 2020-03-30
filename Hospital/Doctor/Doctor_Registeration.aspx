<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor_Registeration.aspx.cs" Inherits="Hospital.Doctor.Doctor_Registeration" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor Registration Form.</title>
    <style>
        .main
        {
           height:500px;
           width:800px;
           background:rgba(0,0,0,0.3);
           position:fixed;
        }
        .auto-style1 {
            width: 503px;
        }
        .Signup-box {
            position: absolute;
            height: 649px;
            width: 684px;
            color: black;
            top: 21%;
            left: 30%;
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
                height:65px;
                width:1350px;
                background-image:url('../images/m.jpg');background-repeat:repeat;
                background-size:auto;
            top: 0px;
            left: 0px;
        }

            /*style for menus....Ending................... */


            /*style for Popup................... */
            .modal_back
            {
            background-color:darkgrey;
            filter:alpha(opacity=90)!important;
            opacity:0.6!important;
            z-index:20;
        }
        .modal_popup 
        {
            padding:20px 0px 24px 10px;
            position:relative;
            width:450px;
            height:66px;
            background-color:white;
            border:1px solid black;
        }
        

    </style>
</head>
<body>
      <form id="form2" runat="server" method="post">

           <div id="head1">
                   <ul>
                        <li><a href="Doctor_Registeration.aspx">Logout</a></li>
                            <%-- <li><a href="View_Appointment.aspx">View Your Appointment</a></li>--%>
                        <li><a href="Doctor_Login.aspx">Login</a></li>
                        <li><a href="/index.html">Home</a></li>
                  </ul>
            </div>
          <div class="main">
          <div style="height:auto;width:1450px">
          <br />
              <img src="../images/a.jpg" height="1000" width="1450"/>
            <div class="Signup-box">
                <br />
                     <label for="l" style="margin-top:600px;font-size:x-large;color:blue;"><center><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Doctor Registration Form</b></center>
                <br />
                </label>
            <br /><br />
               <div style="height: 436px; width: 639px">
                    <table>
                              <tr>
                                     <td>
                                         <label for="Fname" style="margin-left:10px;">Doctor Id</label>

                                     </td>
                                     <td>
                                         <label for="Lname" style="margin-left:10px;">Doctor Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txt_docnm" ForeColor="Red"></asp:RequiredFieldValidator>
                                         </label>
                                     </td>
                              </tr>     
                              <tr>
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_id" runat="server" Height="23px" style="margin-left: 10px" Width="300px" CssClass="Signup_textboxes"  ></asp:TextBox>
                                    </td>
                            
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_docnm" runat="server" Height="24px" style="margin-left: 10px" Width="300px" CssClass="Signup_textboxes" ></asp:TextBox>
                                    </td>
                          
                              </tr>
                              <tr>
                                    <td>
                                        <label for="email" style="margin-left:10px;">Email<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_email" ErrorMessage="Invalid email" ForeColor="Red" ValidationExpression="[a-zA-Z\d\s._]{5,15}@[a-zA-Z\d]{2,8}\.[a-zA-Z]{2,5}"></asp:RegularExpressionValidator>
                                        </label>
                                    </td>
                                    <td>
                                        <label for="coun" style="margin-left:10px;">Password</label>
                                    </td>
                              </tr>
                              <tr>
                                    <td>
                                        <asp:TextBox ID="txt_email" runat="server" Height="25px" style="margin-left: 10px" Width="300px" CssClass="Signup_textboxes" ></asp:TextBox>
                                    </td> 
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_pass" runat="server" Height="24px" style="margin-left: 10px" Width="300px" CssClass="Signup_textboxes"  TextMode="Password"></asp:TextBox>
                                   </td>
                              </tr>
                              <tr>
                                    <td class="auto-style1">
                                        <label for="mob" style="margin-left:10px;">Doctor Gender</label>
                                    </td>
                                    <td class="auto-style1">
                                        <label for="mob" style="margin-left:10px;">Doctor Age<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txt_age"></asp:RequiredFieldValidator>
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt_age" ErrorMessage="Enter Valid Age" ForeColor="Red" ValidationExpression="[0-9]{1,2}"></asp:RegularExpressionValidator>
                                        </label>
                                    </td>
                              </tr>
                              <tr>
                                    <td class="auto-style1"><asp:DropDownList ID="drp_gender" runat="server"  style="margin-left:10px;" Height="28px" Width="306px">
                                        <asp:ListItem>-------SELECT GENDER------</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txt_age" runat="server" Height="26px" style="margin-left: 10px" Width="300px" CssClass="Signup_textboxes" ></asp:TextBox>
                                    </td>

                              </tr>
                             <tr>
                                    <td class="auto-style1">
                                        <label for="mob" style="margin-left:10px;">Select Degree<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" InitialValue="----SELECT DEGREE---" ControlToValidate="drp_degree" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </label>
                                    </td>
                                    <td class="auto-style1">
                                        <label for="mob" style="margin-left:10px;">Select Department<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drp_department" InitialValue="---SELECT DEPARTMENT---"></asp:RequiredFieldValidator>
                                        </label>
                                    </td>

                              </tr>
                              <tr>
                                    <td class="auto-style1"><asp:DropDownList ID="drp_degree" runat="server"  style="margin-left:10px;" Height="29px" Width="300px">
                                        <asp:ListItem>----SELECT DEGREE---</asp:ListItem>
                                        <asp:ListItem>M.B.B.S</asp:ListItem>
                                        <asp:ListItem>B.D.S</asp:ListItem>
                                        <asp:ListItem>B.P.T</asp:ListItem>
                                        <asp:ListItem>B.H.M.S</asp:ListItem>
                                        <asp:ListItem>B.A.M.S</asp:ListItem>
                                        <asp:ListItem>RADIOGRAPHY</asp:ListItem>
                                        <asp:ListItem>D.D.S</asp:ListItem>
                                        <asp:ListItem>M.D</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style1"><asp:DropDownList ID="drp_department" runat="server"  style="margin-left:10px;" Height="23px" Width="302px">
                                        <asp:ListItem>---SELECT DEPARTMENT---</asp:ListItem>
                                        <asp:ListItem>Dentist</asp:ListItem>
                                        <asp:ListItem>Cardiology</asp:ListItem>
                                        <asp:ListItem>Pathologist</asp:ListItem>
                                        <asp:ListItem>Radiology</asp:ListItem>
                                        <asp:ListItem>Ayurveda</asp:ListItem>
                                        <asp:ListItem>Homeopathy</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                              </tr>
                              <tr>
                                    <td>
                                        <label for="email" style="margin-left:10px;">Fees<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txt_fees"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_fees" ErrorMessage="ONLY NUMBERS" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]{2,4}$"></asp:RegularExpressionValidator>
                                        </label>
                                    </td>
                                    <td>
                                        <label for="coun" style="margin-left:10px;">Mobile No<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txt_tele"></asp:RequiredFieldValidator>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_tele" ErrorMessage="Invalid contact" ForeColor="Red" ValidationExpression="[6-9]{1}[0-9]{9}"></asp:RegularExpressionValidator>
                                        </label>
                                    </td>
                              </tr>
                              <tr>
                                    <td>
                                        <asp:TextBox ID="txt_fees" runat="server" Height="27px" style="margin-left: 10px" Width="300px" CssClass="Signup_textboxes"  ></asp:TextBox>
                                    </td> 
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_tele" runat="server" Height="27px" style="margin-left: 10px" Width="300px" CssClass="Signup_textboxes" ></asp:TextBox>
                                    </td>
                              </tr>
                              <tr>
                                  <td>
                                      <label for="Pass" style="margin-left:10px;">Address<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txt_address"></asp:RequiredFieldValidator>
                                      </label>
                                  </td>
                              </tr>     
                              <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_address" runat="server" Height="62px" style="margin-left: 10px" Width="611px" CssClass="Signup_textboxes" TextMode="MultiLine" ></asp:TextBox>
                                    </td>
   
                              </tr>
                            <tr>
                          
                                <td>
                                    <asp:FileUpload ID="image_upload"  CssClass="Signup_textboxes" runat="server" Height="27px" style="margin-left: 15px" Width="309px"  />
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button  ID="btn_upload" runat="server" Text="Upload Image" OnClick="btn_upload_Click"/>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                           <tr></tr>
                          <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lbl_upldmsge" runat="server" Text=""></asp:Label>
                            </td>
                            <td></td>
                          </tr>
                     </table>
                    <br />
                    
                    <table>
                            <tr>
                              <td><asp:Button ID="signup" runat="server" BackColor="Blue" ForeColor="White" Height="34px" Width="622px" style="margin-left: 9px" Text="Register" Font-Size="Medium" OnClick="signup_Click"/></td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                            </tr>
                    </table>
                    <br />
                    <div style="padding-left:25%;" class="auto-style1"><span style="color:white;">By Clicking Sign up&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="color:blue;">Terms</span> and <span style="color:blue;">Privacy Policy.</span></div>
                    </div>
                   </div>
                </div>
              </div>
    </form>
</body>
</html>

