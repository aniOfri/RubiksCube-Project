setInterval(imgSlider, 3000);

var i = 2;
function imgSlider() {
    document.getElementById("cubeImg").src = "imgs/Cubes/" + i + ".png";
    i++;
    if (i == 7)
        i = 1;
}

var big = false;
var click = 0;

function changesize() {
    click += 1;
    if (click == 2)
    {
        if (big) {
            document.getElementById("cubeImg").style.transform = "scale(1.2)";
            big = false;
        }
        else {
            document.getElementById("cubeImg").style.transform = "scale(0.8)";
            big = true;
        }
        click = 0;
    }
}