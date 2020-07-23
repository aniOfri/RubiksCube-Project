<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="RubiksCube_Masterpage.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/LoginRegister.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #titleMain {
            font-size: 50px;
            <%=color%>
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="title">
    <h1 id="titleMain">Change Password</h1>
    </div>
    <div class="formDiv">
        <form id="formLogin" method="get" action="" runat="server">
            <label for="curPass" style="font-size: 30px">Current Password</label><br />
            <input id="curPass" type="password" name="curPass" />
            <a class="errorMsgs" id="curPassError"></a><br /> <!--- Error msg -->
            
            <label for="newPass">New password:</label> <br />
            <input id="newPass" type="password" name="password"/>
            <a class="errorMsgs" id="newPassError"></a><br /><br /> <!--- Error msg -->
            <label for="confNewPass">Confirm new password:</label> <br />
            <input id="confNewPass" type="password" name="confpassword"/>
            <a class="errorMsgs" id="confPassError"></a><br /><br /> <!--- Error msg -->

            <input id="submitLogin" type="submit" name="Submit" onsubmit="return chngPassValid();"/>
            
            <input id="Button1" runat="server" onserverclick="Button1_Click" type="button" value="Show info"/>
        </form>
        <br /><%=chngPassStatus %><br />
        <%=profileInfo %><br />
    </div>
    <script src="js/Profile.js"></script>
</asp:Content>
