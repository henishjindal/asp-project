﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChequeRequest.aspx.cs" Inherits="login2.ChequeRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
           #loading{            /*loader starts*/
            display:flex;
            width:100%;
            height:100vh;
            z-index:9999999;
            position:absolute;
            justify-content:center;
            align-items:center;
            background: #fff no-repeat;
         }
         #ring{
            width:300px;
            height:300px;
            border-radius:50%;
            box-shadow:0 4px 0 #262626;
            background:transparent;
            animation: animate 1s linear infinite;
         }

        @keyframes animate{
            0%{
                transform:rotate(0 deg);
            }
            100%{
                transform:rotate(360deg);
            }
        }
        #text1{
            margin-left:-50px;
            color:black;
            font-family:Verdana;
            font-size:20px;
            font-weight:800;
            margin-left:-180px;
        }      
        .loader {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            display: inline-block;
            position: relative;
            border: 3px solid;
            border-color: rgba(54,219,219,1) rgba(54,219,219,1) transparent;
            box-sizing: border-box;
            animation: rotation 1s linear infinite;
            }
            .loader::after {
            content: '';  
            box-sizing: border-box;
            position: absolute;
            left: 0;
            right: 0;
            padding:5px;
            top: 0;
            bottom: 0;
            margin: auto;
            border: 3px solid;
            border-color: transparent rgba(242,209,124,1) rgba(242,209,124,1);
            width: 24px;
            height: 24px;
            border-radius: 50%;
            animation: rotationBack 0.5s linear infinite;
            transform-origin: center center;
            }

            @keyframes rotation {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
                } 
                    
                @keyframes rotationBack {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(-360deg);
                }
            }
                /*For Loading*/
            .loader1 {
            font-size: 28px;
            padding-left:5px;
            display: inline-block;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            color: #263238;
            box-sizing: border-box;
            text-shadow: 0 0 2px #FFF, 0 0 1px #FFF, 0 0 1px #FFF;
            letter-spacing: 2px;
            position: relative;
            }
            .loader1::after {
            content: 'Loading';
            position: absolute;
            left: 5px;
            top: 0;
            color: rgba(54,219,219,1);
            width: 100%;
            height: 100%;
            overflow: hidden;
            box-sizing: border-box;
            animation: animloader 2s linear infinite;
            }

            @keyframes animloader {
                0% {
                    width: 0%;
                }
                100% {
                    width: 100%;
                }
            }
        /* loader ends */
    </style>
</head>
     <link rel="icon" 
      type="image/png" 
      href="../Images/favicon.png" />
<body onload="myfunction()">
 <form id="form1" runat="server">
         <div id="loading">
            <!--<div id="ring"></div>
             <div id="text1">LOADING</div>-->
         <span class="loader"></span>
         <span></span>
         <span class="loader1">Loading</span>
        </div>
    
        <div class="auto-style1">
           <h1> Cheque Request Form</h1><br />
            <br />

            Your Customer Id is:&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Fetch Details" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" Font-Strikeout="False" Visible="False">
            <table class="auto-style2">
                <tr>
                    <td>Your Account No:</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" CausesValidation="True" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="This is Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Name (on checque book):</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="This is Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Firm name (if any):</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Mode of Delivery:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem>Branch</asp:ListItem>
                            <asp:ListItem>Home Address</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1" Display="Dynamic" ErrorMessage="This is Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Number of Leaves ( 25, 50, 100 or 200):</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>100</asp:ListItem>
                            <asp:ListItem>200</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="This is Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                        <br />
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
                </asp:Panel>
        </div>
    </form>
     <script>
        var preloader = document.getElementById('loading');
        function myfunction() {
            preloader.style.display = 'none';
        }
     </script>
</body>
</html>