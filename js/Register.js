// Input Validation Variables
var finalReturn = false,
    textLog = document.getElementById("textRegister"),
    emailReg = document.getElementById("emailRegister"),
    newPass = document.getElementById("passRegister"),
    passConfReg = document.getElementById("passRegister2"),
    textInvalid = document.getElementById("regTextError");
    emailInvalid = document.getElementById("regEmailError");
    passInvalid = document.getElementById("regPassError");
    passConfInvalid = document.getElementById("regPassConfError");
    terms = document.getElementById("terms");
    termsInvalid = document.getElementById("termsError");

// Input Validation Function
function RegValid() {
        // Empty username 
    if (textLog.value.length == 0) {
        textInvalid.innerHTML = "Username can't be empty";
        textLog.style.border = "2px dashed blue";
        textInvalid.style.display = "inline";
        finalReturn = false;
    }
    else {
        textLog.style.border = "";
        textInvalid.style.display = "none";

        // Too short username
        if (textLog.value.length < 3) {
            textInvalid.innerHTML = "Usernames can't be shorter than 3 digits.";
            textLog.style.border = "2px dashed blue";
            textInvalid.style.display = "inline";
            finalReturn = false;
        }
        else {
            // Too long username
            if (textLog.value.length > 9) {
                textInvalid.innerHTML = "Usernames can't be longer than 8 digits.";
                textLog.style.border = "2px dashed blue";
                textInvalid.style.display = "inline";
                finalReturn = false;
            }
            else {
                textLog.style.border = "";
                textInvalid.style.display = "none";

                // Empty email
                if (emailReg.value.length == 0) {
                    emailInvalid.innerHTML = "Email can't be empty.";
                    emailReg.style.border = "2px dashed blue";
                    emailInvalid.style.display = "inline";
                    finalReturn = false;
                }
                else {
                    emailReg.style.border = "";
                    emailInvalid.style.display = "none";

                    // Validate email
                    if (validateEmail(emailReg.value)) {
                        emailInvalid.innerHTML = "Email is invalid. - i.e: name@company.com";
                        emailReg.style.border = "2px dashed blue";
                        emailInvalid.style.display = "inline";
                        finalReturn = false;
                    }
                    else {
                        emailReg.style.border = "";
                        emailInvalid.style.display = "none";

                        // Empty Password
                        if (newPass.value.length == 0) {
                            passInvalid.innerHTML = "Password can't be empty.";
                            newPass.style.border = "2px dashed blue";
                            passInvalid.style.display = "inline";
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

                                    if (newPass.value != passConfReg.value) {
                                        passConfInvalid.innerHTML = "Passwords must match.";
                                        newPass.style.border = "2px dashed blue";
                                        passConfReg.style.border = "2px dashed blue";
                                        passConfInvalid.style.display = "inline";
                                        finalReturn = false;
                                    }
                                    else {
                                        passConfReg.style.border = "";
                                        passConfInvalid.style.display = "none";
                                        if (terms.checked == false) {
                                            termsError.innerHTML = "Must accept the TOS.";
                                            termsError.style.display = "inline";
                                            finalReturn = false;
                                        }
                                        else {
                                            termsError.style.display = "none";
                                            finalReturn = true;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return finalReturn;
}

function validateEmail(email) {
    return !/\S+@\S+\.\S+/.test(email)
}

