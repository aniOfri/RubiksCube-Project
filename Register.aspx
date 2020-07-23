<%@ Page Title="Rubik's Cube: Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RubiksCube_Masterpage.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/LoginRegister.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- Form -->
    <div id="title">
        <h1 id="titleMain">Register:</h1>
        <a id="titleInstead" href="Login.aspx">or Login</a>
        </div>
        <div class="formDiv">
            <form id="formRegister" onsubmit="return RegValid();" method="get" action="#">
                <label for="textRegister">Username:</label><br />
                <input id="textRegister" type="text" name="name"/>
                <a class="errorMsgs" id="regTextError"></a><br /> <!--- Error msg -->

                <label for="textRegister">Email:</label><br />
                <input id="emailRegister" type="email" name="email"/>
                <a class="errorMsgs" id="regEmailError"></a><br /> <!--- Error msg -->
            
                <label for="passRegister">Password:</label><br />
                <input id="passRegister" type="password" name="password"/>
                <a class="errorMsgs" id="regPassError"></a><br /> <!--- Error msg -->
            
                <label for="passRegister2">Confirm Password:</label><br />
                <input id="passRegister2" type="password" />
                <a class="errorMsgs" id="regPassConfError"></a><br /><br /> <!--- Error msg -->

                <label for="favCube">Favorite cube size:</label>
                <select id="favCube" name="favCube">
                    <option value="2x2">2x2 Cube</option>
                    <option value="3x3" selected>3x3 Cube</option>
                    <option value="4x4">4x4 Cube</option>
                    <option value="5x5">5x5 Cube</option>
                    <option value="6x6">6x6 Cube</option>
                    <option value="oth">Other...</option>
                </select><br /><br />
            
                <label for="terms">Accept TOS? </label>
                <input id="terms" type="checkbox" />
                <a class="errorMsgs" id="termsError"></a><br /><br />
                <input id="submitRegister" type="submit" name="submit"/>
            </form>
            <br /><%=RegStatus %><br />
        </div>
        <script src="js/Register.js"></script>
</asp:Content>
        