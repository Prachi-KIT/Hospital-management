<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient_Registration.aspx.cs" Inherits="Hospital.Patient.Patient_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Registration Form.</title>
    <style>
        body{
            background-image:url("../images/a.jpg");
            background-size:cover;
        }
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
            height: 580px;
            width: 620px;
            color: black;
            background: rgba(241, 246, 241, 0.80);
            top: 21%;
            left: 30%;
        }
        #head1
            {
                position:fixed;
                height:55px;
                width:100%;
                margin-top:0px;
                background-image:url('../images/m.jpg');background-repeat:repeat;
                background-size:auto;
            }


         /*style for menus....start................... */
          ul{
    margin:0px;
    padding:0px;
    list-style:none;
}
ul li{
    float:left;
    width:200px;
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
    background-color: green;
}
ul li ul li{
    display: none;
}
ul li:hover ul li{
    display:block;
}

   
        .auto-style2 {
            margin-left: 16px;
        }
        .auto-style5 {
            height: 19px;
        }
        .auto-style7 {
            height: 23px;
        }
        .auto-style8 {
            width: 503px;
            height: 11px;
        }
        .auto-style9 {
            height: 30px;
        }
        .auto-style10 {
            left: 0px;
            top: 0px;
            height: 48px;
            width: 101%;
        }
    </style>
</head>
<body>
      <form id="form2" runat="server">
          <div id="head1" class="auto-style10">

                   <ul class="menu">
                        <li><a href="/index.html">Home</a></li>
                        <li><a>Services</a>
                           <ul>
                               <li><a href="cardio.html">Cardiology</a></li>
                               <li><a href="dermato.html">Dermatology</a></li>
                               <li><a href="neuro1.html">Neurology</a></li>
                               <li><a href="gaena.html">Gynecology</a></li>
                           </ul>
                        </li>
                        <li><a href="Patient_R.aspx">Logout</a></li>
                       <li><a href="Pay_your_bill_form.aspx">Pay Bill</a></li>
                      
                       <li><a href="Patient_login.aspx">Login</a></li>
                      
                       
                   </ul> 
           </div>
          <div style="height:auto;width:1450px">
          <br />
                  <div class="Signup-box">
                <br />
                     <h2 style="text-align-last:center;color:blue;">Patient Registration Form</h2>
           
               <div class="main">
                    <table>
                              <tr>
                                     <td>&nbsp;&nbsp; Patient Id</td>
                                     <td>
                                         <label for="Lname" style="margin-left:10px;">Patient&nbsp; Name<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_pname" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                         </label></td>
                              </tr>     
                              <tr>
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_pid" runat="server" Height="23px" style="margin-left: 10px" Width="270px" CssClass="Signup_textboxes"  ></asp:TextBox>
                                    </td>
                            
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_pname" runat="server" Height="24px" style="margin-left: 10px" Width="270px" CssClass="Signup_textboxes"></asp:TextBox>
                                    </td>
                          
                              </tr>
                              <tr>
                                    <td class="auto-style7"><label for="email" style="margin-left:10px;">Email<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="[a-zA-Z\d\s._]{5,15}@[a-zA-Z\d]{2,8}\.[a-zA-Z]{2,5}"></asp:RegularExpressionValidator>
                                        </label></td>
                                    <td class="auto-style7"><label for="coun" style="margin-left:10px;">Password<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_pass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </label></td>
                              </tr>
                              <tr>
                                    <td>
                                        <asp:TextBox ID="txt_email" runat="server" Height="25px" style="margin-left: 10px" Width="270px" CssClass="Signup_textboxes"></asp:TextBox>
                                    </td> 
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txt_pass" runat="server" Height="24px" style="margin-left: 10px" Width="270px" CssClass="Signup_textboxes" TextMode="Password"></asp:TextBox>
                                   </td>
                              </tr>
                              <tr>
                                    <td class="auto-style8">
                                        <label for="mob" style="margin-left:10px;">Patient Gender</label></td>
                                    <td class="auto-style8"><label for="mob" style="margin-left:10px;">Patient Age</label><label for="coun"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_age" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt_age" ErrorMessage="Enter Valid Age" ForeColor="Red" ValidationExpression="[0-9]{1,2}"></asp:RegularExpressionValidator>
                                        </label></td>

                              </tr>
                              <tr>
                                    <td class="auto-style1"><asp:DropDownList ID="drp_gender" runat="server" style="margin-left:10px;" Height="28px" Width="274px">
                                        <asp:ListItem>-------SELECT GENDER------</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txt_age" runat="server" Height="26px" style="margin-left: 10px" Width="266px" CssClass="Signup_textboxes" ></asp:TextBox>
                                    </td>

                              </tr>
                             <tr>
                                    <td class="auto-style1"><label for="mob" style="margin-left:10px;">Contact No.<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_tele" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_tele" ErrorMessage="Invalid Contact" ForeColor="Red" ValidationExpression="[6-9]{1}[0-9]{9}"></asp:RegularExpressionValidator>
                                        </label>
                                    </td>
                                    <td class="auto-style1">&nbsp;&nbsp;&nbsp; Marital Status</td>

                              </tr>
                              <tr>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txt_tele" runat="server" Height="24px" style="margin-left: 10px" Width="264px" CssClass="Signup_textboxes"></asp:TextBox>
                                    </td>
                                    <td class="auto-style1">   
                                        <asp:DropDownList ID="drp_maristatus" runat="server"  style="margin-left:10px;" Height="24px" Width="272px">
                                        <asp:ListItem>---SELECT STATUS---</asp:ListItem>
                                        <asp:ListItem>Single</asp:ListItem>
                                        <asp:ListItem>Married</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                              </tr>
                              <tr>
                                    <td class="auto-style5">&nbsp;&nbsp; Patient DOB<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Dob" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_Dob" ErrorMessage="Invalid Format" ForeColor="Red" ValidationExpression="^(?:0[1-9]|[12]\d|3[01])([/.-])(?:0[1-9]|1[12])\1(?:19|20)\d\d$"></asp:RegularExpressionValidator>
                                    </td>
                                    <td class="auto-style5">&nbsp;&nbsp;&nbsp;Address<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_add" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                              </tr>
                              <tr>
                                    <td class="auto-style9">
                                        <asp:TextBox ID="txt_Dob" runat="server" Height="20px" style="margin-left: 10px" Width="259px" CssClass="Signup_textboxes" placeholder="dd/mm/yyyy"></asp:TextBox>
                                    </td>
                                    <td class="auto-style9">

                                    </td>
                              </tr>
                              <tr>          
                                    <td>
                                         <span>

                                                       </span>
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_add" runat="server" placeholder="Enter Your..Address" Height="101px" style="margin-left: 10px" Width="270px" CssClass="Signup_textboxes" TextMode="MultiLine" ></asp:TextBox>
                                    </td>
                               </tr>                          
                                  
                              </table>
                    <table>
                        <tr>
                          <td>&nbsp;<asp:Button ID="signup" runat="server" BackColor="blue" ForeColor="#FFFFCC" Height="34px" Width="575px" style="margin-left: 9px" Text="Register" OnClick="signup_Click" /></td>
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

