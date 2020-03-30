<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Hospital.Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Default</title>
    <link  rel="stylesheet" href="css/stylesheet.css" type="text/css"/>
    <style>
        .link:hover
        {
            color:skyblue;
        }
        .drop_down {
            height: 20px;
            width: 100px;
            -moz-border-radius:3px;
            -webkit-border-radius:2px ;
            border-radius:2px;
            font-size:14px;
        }
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
        .Login-box {
            position: absolute;
            height: 330px;
            width: 500px;
            color: black;
            background: rgba(241, 246, 241, 0.90);
            top: 25%;
            left: 10%;
            box-sizing:border-box;
        }
        .textboxes {
            margin-top:10px;
            margin-bottom:5px;
            height:30px;
            width:270px;
            border:2px solid #65e2ea;
            border-radius:2px;
        }
        .auto-style1 {
            width: 325px;
        }
        .auto-style2 {
            margin-top: 10px;
            margin-bottom: 5px;
            border: 2px solid #65e2ea;
            border-radius: 2px;
        }
        .auto-style3 {
            width: 478px;
        }
        .auto-style4 {
            height: 152px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!--start-header-->
        <div class="header">
            <div class="header-2">
                  <div class="inside">
                      <asp:TextBox runat="server" ID="txt_search" Placeholder="Search by Patient Id" style="border-radius:4px;height:22px;width:180px;"></asp:TextBox>
                      <asp:Button runat="server" ID="btn_search" Text="Search" style="border-radius:4px;height:28px;width:80px;background-color:#6600ff;color:#ffffff"/>
                  </div>
            </div>
            <br /><br />
            <div class="top_nav">
               <ul>
                <li><asp:LinkButton id="lnk_Home" runat="server" Font-underline="false" CssClass="link" OnClick="lnk_Home_Click">HOME</asp:LinkButton></li>
                <li><asp:LinkButton id="lnk_services" runat="server" Font-underline="false"  CssClass="link" OnClick="lnk_services_Click">SERVICES</asp:LinkButton></li>
                <li><asp:LinkButton id="lnk_doctor" runat="server" Font-underline="false" CssClass="link" OnClick="lnk_doctor_Click" >DOCTORS</asp:LinkButton></li>
                <li><asp:LinkButton id="lnk_contact" runat="server" Font-underline="false"  CssClass="link" OnClick="lnk_contact_Click">CONTACT US</asp:LinkButton></li>
                <li><asp:LinkButton id="lnk_About" runat="server" Font-underline="false"  CssClass="link">ABOUT US</asp:LinkButton></li>
                <li><asp:DropDownList ID="drp_signup" runat="server" CssClass="drop_down">
                    <asp:ListItem>SIGNUP</asp:ListItem>
                    <asp:ListItem>DOCTOR SIGNUP</asp:ListItem>
                    <asp:ListItem>PATIENT SIGNUP</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li><asp:DropDownList ID="drp_login" runat="server" CssClass="drop_down">
                    <asp:ListItem>LOGIN</asp:ListItem>
                    <asp:ListItem>DOCTOR LOGIN</asp:ListItem>
                    <asp:ListItem>PATIENT LOGIN</asp:ListItem>
                    <asp:ListItem>ADMIN LOGIN</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </li>
                </ul>
            </div>
   </div>

        

        <!--end--header-->
       <div style="height:900px;width:1450px;">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <img src="../images/slider1.jpg" height="400" width="1450"/>

           <div class="Login-box">
               <br />
               <div style="color:black;font-size:22px;padding-left:35%"><h4>Administrator Login</h4></div>
               <table>
                   <tr>
                       <td><img src="../images/grid-img1.png" width="180" class="auto-style4"/></td>
                       <td class="auto-style1">
                           <div>
                               <label id="lbl_name"><b>Administrator Name</b></label><br />
                               <asp:TextBox ID="txt_email" runat="server" CssClass="auto-style2" Height="31px" Width="289px"></asp:TextBox><br />
                               <label id="lbl_pass"><b>Password</b></label><br />
                               <asp:TextBox ID="txt_pass" runat="server" CssClass="auto-style2" Height="28px" Width="288px"></asp:TextBox><br />
                           </div>
                       </td>
                   </tr>
               </table>
               <br />
               <asp:Button  runat="server" ID="btn_login" class="auto-style3" style="background-color:aquamarine;color:white;height:31px;width:470px;margin-left:3%;" Text="LOGIN" OnClick="btn_login_Click" />
           </div>
                <asp:Panel ID="Pnl1" runat="server">
                    <asp:Label ID="lbl1" runat="server" Visible="false">Hiii..Home</asp:Label>
                    <asp:Button ID="btn" runat="server" Height="24px"  Text="Submit" Width="115px" Visible="false" />
                </asp:Panel>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btn"  BackgroundCssClass="modal_back" TargetControlID="lnk_Home" PopupControlID="Pnl1"></ajaxToolkit:ModalPopupExtender>

                <asp:Panel ID="Pnl2" runat="server">
                    <asp:Label ID="lbl2" runat="server" Visible="false">hello..services</asp:Label>
                    <asp:TextBox ID="txt1" runat="server"></asp:TextBox>
                    <asp:Button ID="Btn2" runat="server" Height="24px"  Text="Submit" Width="115px" Visible="false" />
                </asp:Panel>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" CancelControlID="btn2"  BackgroundCssClass="modal_back" TargetControlID="lnk_services" PopupControlID="Pnl2"></ajaxToolkit:ModalPopupExtender>

                 <asp:Panel ID="Pnl3" runat="server">
                    <asp:Label ID="lbl3" runat="server" Visible="false">hello..Doctors</asp:Label>
                    <asp:Button ID="Btn3" runat="server" Height="24px"  Text="Submit" Width="115px" Visible="false" />
                </asp:Panel>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" runat="server" CancelControlID="btn3"  BackgroundCssClass="modal_back" TargetControlID="lnk_doctor" PopupControlID="Pnl3"></ajaxToolkit:ModalPopupExtender>

                <asp:Panel ID="Pnl4" runat="server">
                    <asp:Label ID="lbl4" runat="server" Visible="false">hello..contact us</asp:Label>
                    <asp:Button ID="Btn4" runat="server" Height="24px"  Text="Submit" Width="115px" Visible="false" />
                </asp:Panel>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender4" runat="server" CancelControlID="btn4"  BackgroundCssClass="modal_back" TargetControlID="lnk_contact" PopupControlID="Pnl4"></ajaxToolkit:ModalPopupExtender>
     
          </div>     
        <!----end slider--->

        <div style="border:black;">
            <img  src="../images/bg.jpg" style="background-size:cover;"/>
           
            <p  style="align:center;font-family: Copperplate Gothic; color: crimson;font-size: 30px;">
        <b>!!..Welcome to LifeCare Hospital's Training Section..!!</b></p>
    <p style="font-size: 25px;">The AIIMS offers various Trainings at different levels-</p>
    <p style="position: absolute; left: 50px; font-size: 20px;"><b>1. PhD in Reproductive Biology</b><br/>
            Twice yearly: Session starts January and July<br/>
           <b>2. MSc in Reproductive Biology and Clinical Embryology</b><br/>
           Once Yearly: Session starts August<br/> 
           <b>3. Short & Long term Training</b><br/>
           Short-term (one to three month/s) training on Molecular Cytogenetics,<br/> 
           Radioimmunoassay/other hormone assay, Cell culture system based biochemical or molecular study, etc <br>
           Long term-Six months training in Reproductive Endocrinology<br/> 
           <b>4. Continuing Medical Education</b><br/>
           Organizes National Workshop on Molecular Cytogenetics: alternate years<br> Postgraduate rotations from 
           department of Biochemistry & Laboratory Medicine<br/> 
           (for PhD & MSc course details visit www.aiimsexams.org) </p><br/>
           <center><a href="test.html"><asp:button ID="btn1" runat="server" Text="Homepage" style="position: absolute; top:500px; color:white; height: 40px; font-size: 20px;background-color:crimson;">
            </asp:button></a></center>
        </div>
    </form>

</body>
    
</html>
