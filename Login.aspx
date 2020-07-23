<%@ Page Title="Rubik's Cube: Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RubiksCube_Masterpage.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/LoginRegister.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="title">
    <h1 id="titleMain">Login:</h1>
    <a id="titleInstead" href="Register.aspx">or Register</a>
    </div>
    <div class="formDiv">
        <form id="formLogin" onsubmit="return LogValid();" method="get" action="" >
            <label for="textLogin">Username:</label><br />
            <input id="textLogin" type="text" name="name" />
            <a class="errorMsgs" id="logTextError"></a><br /> <!--- Error msg -->
            
            <label for="passLogin">Password:</label> <br />
            <input id="passLogin" type="password" name="password"/>
            <a class="errorMsgs" id="logPassError"></a><br /><br /> <!--- Error msg -->
            
            <input id="submitLogin" type="submit" name="submit" />
        </form>
        <br /><%=LogStatus %><br />
    </div>
    <script src="js/Login.js"></script>
</asp:Content>