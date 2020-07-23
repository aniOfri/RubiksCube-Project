<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="RubiksCube_Masterpage.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Gallery.css" rel="stylesheet" type="text/css" />
    <script src="js/Gallery.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="scale">
        <div class="wrap">
            <h1>- The Rubik's Cube -</h1>
            <h3>Image Gallery</h3>
        </div>
    </div>
    <div class="cubeSlider">
        <img id="cubeImg" src="imgs/Cubes/6.png" onmouseover="imgSlider()" onclick="changesize()" />
    </div>
</asp:Content>
