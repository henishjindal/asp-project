﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillManager.aspx.cs" Inherits="login2.BillManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
    <title>Bill Manager - ESB</title>
    <style type="text/css">
        *{
            margin:0px;
            padding:0px;
            box-sizing:border-box;
            
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
body{
    background-image:url('../Images/texture.png');

}
        .auto-style1 {
            display: block;
            width: 100%;
            height: calc(1.5em + .75rem + 2px);
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: none;
            text-decoration: underline;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
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
 
        <div class="Container">
            <h1 class="text-center mt-3">
            Bill Management Dashboard
                </h1><table class="table text-center ">
                <tr>
                    <td>Cust_ID:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="This is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Electricity Bill:</td>
                    <td>
                        <asp:TextBox ID="TextBox2"  CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Telephone Bill:</td>
                    <td>
                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Due Date_Electricity:</td>
                    <td>
                        <asp:TextBox ID="TextBox4" type="date" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>
                      
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Enter Valid Date" ForeColor="Red" MinimumValue="18" SetFocusOnError="True" Type="Date" MaximumValue="120"></asp:RangeValidator>
                   
                    </td>
                </tr>
                <tr>
                    <td>Due Date_Telephone:</td>
                    <td>
                        <asp:TextBox ID="TextBox5"  type="date" CssClass="auto-style1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                      
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Enter Valid Date" ForeColor="Red" MinimumValue="18" SetFocusOnError="True" Type="Date" MaximumValue="120"></asp:RangeValidator>
                   
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" OnClick="Button1_Click" Text="Generate Bill" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label2" runat="server" ForeColor="#00CC00"></asp:Label>
                    </td>
                </tr>
            </table>
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