﻿// Input Validation Variables
var finalReturn = false,
    textLog = document.getElementById("textLogin"),
    newPass = document.getElementById("passLogin"),
    textInvalid = document.getElementById("logTextError");
    passInvalid = document.getElementById("logPassError");

// Input Validation Function
function LogValid() {
    // Empty username 
    if (textLog.value.length == 0) {
        textInvalid.innerHTML = "Invalid Input.";
        textLog.style.border = "2px dashed blue";
        textInvalid.style.display = "inline";
        finalReturn = false;
    }
    else {
        textLog.style.border = "";
        textInvalid.style.display = "none";

        // Too long username
        if (textLog.value.length > 9) {
            textInvalid.innerHTML = "Invalid Input.";
            textLog.style.border = "2px dashed blue";
            textInvalid.style.display = "inline";
            finalReturn = false;
        }
        else {
            textLog.style.border = "";
            textInvalid.style.display = "none";

                // Empty Password
                if (newPass.value.length == 0) {
                    passInvalid.innerHTML = "Invalid Input.";
                    newPass.style.border = "2px dashed blue";
                    passInvalid.style.display = "inline";
                    finalReturn = false;
                }
                else {
                    newPass.style.border = "";
                    passInvalid.style.display = "none";

                    // Too short password
                    if (newPass.value.length < 5) {
                        passInvalid.innerHTML = "Invalid Input.";
                        newPass.style.border = "2px dashed blue";
                        passInvalid.style.display = "inline";
                        finalReturn = false;
                    }
                    else {
                        // Too long password
                        if (newPass.value.length > 16) {
                            passInvalid.innerHTML = "Invalid Input.";
                            newPass.style.border = "2px dashed blue";
                            passInvalid.style.display = "inline";
                            finalReturn = false;
                        }
                        else {
                            newPass.style.border = "";
                            passInvalid.style.display = "none";
                            finalReturn = true;
                        }
                     }
                }
            }
        }
return finalReturn;
}

