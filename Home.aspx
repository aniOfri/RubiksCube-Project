<%@ Page Title="Rubik's Cube: Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RubiksCube_Masterpage.Home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Home.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!--Title-->
    <div class="scale">
        <div class="wrap">
            <h1>- The Rubik's Cube -</h1>
            <h3>From an experiment to a best-selling puzzle</h3>
            <h1><%=username %></h1>
        </div>
    </div>
    <div class="aboutGroup">
        <!--About the Rubik's Cube-->
        <div class="about" id="rubiks" onmouseover="hoverAbout()">
            <div class="aboutCont">
                <h1>About the Rubik's cube</h1>
                <p>
                    The Rubik's cube is a combination twisty-puzzle invented in 1974 and <br />released in Budapest in 1977. <br />
                    in 1980 the cube was released worldwide and on the same year won The <br />"Toy of the Year Award". <br />
                    The cube was a global success and hooked both young and adult, <br /> by 1982 - just two years after
                    the cube got released worldwide, it had <br />been sold for over 100 million times. <br />
                    The simple-looking yet almost impossible puzzle stumped millions, <br /> today there aren't very much people
                    that can honestly say they had <br />solved the cube without a guide.
                </p>
            </div>
            <div class="aboutImg">
                <img src="imgs/Cubes/6.png" width="100" height="100" />
            </div>
        </div>
        <!--About Speedcubing-->
        <div class="about about3" id="speedcube" >
            <div class="aboutCont">
                <h1>About Speedcubing</h1>
                <p>
                    Many people see cubing as a calm hobby, where you just sit down and <br />fidget with the cube.<br />
                    Some people have many variants of cubes in different shapes and colors. <br />
                    But there are some people who take solving a cube to the next level, <br />where just solving the cube is too easy<br />
                    for them and they need a challenge, and thus, Speedcubing was born. <br />
                    The objective of Speedcubing is solving the cube as fast of possible<br />
                    Speedsolving events are very common these days, even in Israel.<br />
                    The current World Record is by Yushend Du with a 3.47 seconds
                </p>
            </div>
            <div class="aboutImg">
                <img src="imgs/assets/YushengDuWR.jpg" />
            </div>
        </div>
        <!--About Eron Rubik-->
        <div class="about about2" id="eron" ">
            <div class="aboutCont">
                <h1>About Eron Rubik</h1>
                <p>
                    Eron Rubik was born in 1944 (~75 years old) in Hungary, Budapest.<br /> he is an inventor, desginer, architect and professor of architecture.<br />
                    He graduated from the Technical Unversity, Budapest Faculty of Architecture in 1967 <br />and began 
                    working on sculpting and interior design,<br /> from 1971 to 1975 he worked as an architect and became a professor <br />of the Budapest
                    College of Applied Arts.<br />In the early 1980s, he became editor of a game and puzzle journal, and by 1983,<br />
                    he bacame self-employed, founding the Rubik Studio, where he designed furniture <br />and games.
                </p>
            </div>
            <div class="aboutImg">
                <img src="imgs/assets/ErnoRubik.jpg" />
            </div>
        </div>
    </div>
</asp:Content>