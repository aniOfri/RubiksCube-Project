<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="RubiksCube_Masterpage.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/LoginRegister.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #titleMain {
            color: #f5316f;
            font-size: 60px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="title">
        <h1 id="titleMain">Manage Users</h1>
    </div>
    <div class="formDiv">
        <form id="formLogin" method="get" action="" runat="server" >
            <input id="Button3" runat="server" onserverclick="Button3_Click" type="button" style="align-content:center" value="Show All"/>
            <input id="Button4" runat="server" onserverclick="Button4_Click" type="button" style="align-content:center" value="Filter"/>
            <%=allUsers %>
            <div id="normalDiv" runat="server">
                <div class="asp">
                <%=db %>
                <%=info %>
                <input id="Button1" runat="server" onserverclick="Button1_Click" type="button" value="Update info"/>
                <input id="Button2" runat="server" onserverclick="Button2_Click" type="button" value="Delete user"/>
                </div>

                <label for="newPass">New password:</label> <br />
                <input id="newPass" type="password" name="password"/>
                <a class="errorMsgs" id="newPassError"></a><br /><br /> <!--- Error msg -->
                <label for="confNewPass">Confirm new password:</label> <br />
                <input id="confNewPass" type="password" name="confpassword"/>
                <a class="errorMsgs" id="confPassError"></a><br /><br /> <!--- Error msg -->

                <input id="submitLogin" type="submit" name="changePass" onsubmit="return chngPassValid();" />
            </div>
        </form>
        <br /><%=chngPassStatus %><br />
    </div>
    <script src="js/Manager.js"></script>
</asp:Content>
