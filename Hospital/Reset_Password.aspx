<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reset_Password.aspx.cs" Inherits="Hospital.Reset_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Reset password</title>
    <style>
        .main_div {
            height:345px;
            width:550px;
            background-color:white;
            margin:450px 450px 250px 250px;
            position:absolute;
            top: -250px;
            left: 232px;
        }
        .auto-style2 {
            width: 498px;
        }
        .auto-style3 {
            height: 299px;
            width: 487px;
            background-color: white;
            margin: 450px 450px 250px 250px;
            position: absolute;
            top: -297px;
            left: 232px;
        }
        .auto-style4 {
            height: 44px;
            width: 487px;
        }

        </style>
</head>
<body style="background-image:url('../images/reset.jpg');">
    <form id="form1" runat="server">
        <div class="auto-style3" style="border:2px solid #00ccff;">
            <div style="color:white;background-color:#00ccff;padding-top:10px;text-align:left;" class="auto-style4">
            &nbsp;&nbsp;&nbsp;<b><center>Reset your password </center></b>
        </div>
            <br />
               <table>
                   <tr>
                       <td class="auto-style2">&nbsp; <asp:Label ID="lbl1" runat="server" style="padding-left:5px;">Enter New password</asp:Label></td>
                   </tr>
                   <tr>
                       <td class="auto-style2"><asp:TextBox ID="txt_pwd" runat="server" Width="467px" Height="24px" required="true" style="margin-left:5px;"></asp:TextBox>
                           <br />
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style2">&nbsp; <asp:Label ID="lbl2" runat="server" style="padding-left:5px;">Enter Confirm password</asp:Label></td>
                   </tr>
                   <tr>
                       <td class="auto-style2"><asp:TextBox ID="txt_con_pwd" runat="server" Width="465px" Height="23px" required="true" style="margin-left:5px;"></asp:TextBox></td>
                   </tr>
                   <tr>
                       <td class="auto-style2"><label id="lbl_compare" runat="server">&nbsp; compare</label></td>
                       <br /><br />
                   </tr>
                   <tr>
                       <td class="auto-style2"><asp:Button ID="btn_reset" runat="server" Text="Reset Password"  style="background-color:#00ccff;color:white;margin-left:190px;margin-right:150px;border-radius:4px;" Width="129px" Height="30px" /></td>
                   </tr>
                   <tr>
                       <td class="auto-style2"><asp:Label ID="lbl_msge" runat="server" Visible="false"></asp:Label></td>
                   </tr>
               </table>
        </div>
    </form>
</body>
    <script type="text/javascript">
       var  pwd = document.getElementById("txt_pwd");
       var con_pwd = document.getElementById("txt_con_pwd");
       var msge = document.getElementById("lbl_compare");
       
        function chk_pass() {
            if (pwd != con_pwd) {
                alert("inside method");
                msge.innerText = "password and confirm password is not same..";
                msge.style = "color:red;";
            }
        }
    </script>
</html>

