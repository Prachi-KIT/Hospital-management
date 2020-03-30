<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forget_password.aspx.cs" Inherits="Hospital.Wel_Doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Forget Password</title>
    <style>
        .main_div {
            height:407px;
            width:400px;
            background-color:white;
            margin:450px 450px 250px 250px;
            position:absolute;
            top: -297px;
            left: 232px;
            border:1px solid #00ccff;
        }
        .auto-style1 {
            height: 111px;
            width: 197px;
        }
        .auto-style2 {
            width: 391px;
        }
        .auto-style3 {
            width: 393px;
        }
        .auto-style4 {
            width: 389px;
            height: 25px;
        }
    </style>
</head>
<body style="background:url(../images/box-img1.jpg)">
    <form id="form1" runat="server">
    <div class="main_div">
        <div style="height:29px; width:400px;color:white;background-color:#00ccff;padding-top:10px;text-align:center;">
             Reset Your Password
        </div>
        <div style="height:120px;width:120px;padding-left:120px;padding-right:90px">
            <img src="Images/email.png" alt="image not found" class="auto-style1"/>
        </div>
        <table>
            <tr><td><h4 style="color:black;text-align:center;" class="auto-style3">Forget Your Password?</h4></td>
            </tr>
            <tr>
                <td><center class="auto-style2">Please Enter your email address and I</center></td>
            </tr>
            <tr>
                <td><center class="auto-style4">will help you reset your password.<br /><br /></center></td>
            </tr>
            <tr>
                <td><center class="auto-style3"><b>Enter&nbsp; Email</b></center></td>
            </tr>
            <tr><td><asp:TextBox id ="txt_email" name="Email" required="true" runat="server"  style="border-radius:2px;" Width="385px" ></asp:TextBox><br />
                <br />
                </td></tr>
            <tr>
                <td><asp:Button id="btn_send" Text="Continue" runat="server"  style="background-color:#00ccff;color:white;margin-left:150px;margin-right:150px;border-radius:4px;"  Width="110px" Height="32px"></asp:Button></td>
            </tr>
        </table>

    </div>
    </form>
</body>

</html>
