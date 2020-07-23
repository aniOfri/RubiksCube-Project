// Input Validation Variables
var finalReturn = false,
    newPass = document.getElementById("newPass"),
    confNewPass = document.getElementById("confNewPass"),
    newPassInvalid = document.getElementById("newPassError"),
    confPassInvalid = document.getElementById("confPassError");


function chngPassValid() {
    // Empty Password
    if (newPass.value.length == 0) {
        newPassInvalid.innerHTML = "Invalid Input.";
        newPass.style.border = "2px dashed blue";
        newPassInvalid.style.display = "inline";
        finalReturn = false;
    }
    else {
        newPass.style.border = "";
        passInvalid.style.display = "none";

        // Too short password
        if (newPass.value.length < 5) {
            passInvalid.innerHTML = "Passwords can't be shorter than 5 digits.";
            newPass.style.border = "2px dashed blue";
            passInvalid.style.display = "inline";
            finalReturn = false;
        }
        else {
            newPass.style.border = "";
            passInvalid.style.display = "none";
            finalReturn = true;

            // Too long password
            if (newPass.value.length > 16) {
                passInvalid.innerHTML = "Passwords can't be longer than 16 digits.";
                newPass.style.border = "2px dashed blue";
                passInvalid.style.display = "inline";
                finalReturn = false;
            }
            else {
                newPass.style.border = "";
                passInvalid.style.display = "none";

                // Password Confirmation
                if (newPass.value != confNewPass.value) {
                    passConfInvalid.innerHTML = "Passwords must match.";
                    newPass.style.border = "2px dashed blue";
                    confNewPass.style.border = "2px dashed blue";
                    confPassInvalid.style.display = "inline";
                    finalReturn = false;
                }
                else {
                    confNewPass.style.border = "";
                    confPassInvalid.style.display = "none";
                }
            }
        }
    }
    return finalReturn;
}