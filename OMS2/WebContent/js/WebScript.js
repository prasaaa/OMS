function myFunction() {
    var x = document.getElementById("snackbar");
    x.className = "show";
    setTimeout(function () {
        x.className = x.className.replace("show", "");
    }, 3000);

}


function setInputFilter(textbox, inputFilter) {
    ["input", "keydown", "keyup", "mousedown", "mouseup", "select",
        "contextmenu", "drop"].forEach(function (event) {
        textbox.addEventListener(event, function () {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart,
                    this.oldSelectionEnd);
            }
        });
    });
}

document.getElementById("txtSearch").addEventListener('keydown', function (event) {
    if ((event.ctrlKey && event.key === "j") || event.keyCode === 13 || (event.ctrlKey && event.key === "b") || (event.ctrlKey && event.key === "i"))
        event.preventDefault();
});


function myFirstFunction1() {

    if (document.getElementById("txtBarcode1").value.trim() !== "" && document.getElementById("fault_description").value.trim() !== "") {

        var barcodeArray = [];
        var barcodeArray1 = [];
        var i = 0;
        var bool = true;
        var bool1 = true;
        var popup;

        var table = document.getElementById("myTable1");
        var selecteditem = document.getElementById("txtBarcode1");
        var description = document.getElementById("fault_description");

        if (sessionStorage.getItem("barcodeList1")) {
            barcodeArray = JSON.parse(sessionStorage.getItem("barcodeList1"));
        } else {

            sessionStorage.setItem("barcodeList1", JSON.stringify(barcodeArray));

            barcodeArray = JSON.parse(sessionStorage.getItem("barcodeList1"));


        }

        if (sessionStorage.getItem("barcodeList")) {
            barcodeArray1 = JSON.parse(sessionStorage.getItem("barcodeList"));
        } else {
            sessionStorage.setItem("barcodeList", JSON.stringify(barcodeArray1));
            barcodeArray1 = JSON.parse(sessionStorage.getItem("barcodeList"));
        }

        for (i = 0; i < barcodeArray.length; i++) {
            if (barcodeArray[i] === selecteditem.value) {
                bool = false;
                break;
            }
        }

        for (i = 0; i < barcodeArray1.length; i++) {
            if (barcodeArray1[i] === selecteditem.value) {
                bool1 = false;
                break;
            }
        }

        if (bool === true && bool1 === true) {

            barcodeArray.push(selecteditem.value);
            sessionStorage.setItem("barcodeList1", JSON.stringify(barcodeArray));
            table.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + selecteditem.value + '" name="barcodeFault"></td> <td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" name = "description" value="' + description.value + '"></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeRow1(this)"><i class="fa fa-trash"></i></button></td></tr>';
            document.getElementById("txtBarcode1").value = "";
            document.getElementById("fault_description").value = "";

            autoFocus1();

        } else {
            popup = document.getElementById("myPopup1");
            popup.innerHTML = "Duplicate Barcode Number!!";

            if (!popup.classList.contains("show")) {
                popup.classList.add("show");

                setTimeout(function () {
                    popup.classList.remove("show");
                }, 3000);
            }
            document.getElementById("txtBarcode1").value = "";
            document.getElementById("fault_description").value = "";
            autoFocus1();
        }


    } else if (document.getElementById("txtBarcode1").value.trim() !== "" && document.getElementById("fault_description").innerHTML.trim() === "") {
        popup = document.getElementById("myPopup2");
        popup.innerHTML = "Please Enter a Description!!";
        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
        autoFocus2();
    } else {
        popup = document.getElementById("myPopup1");
        popup.innerHTML = "Please Enter a Barcode Number!!";
        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
        autoFocus1();
    }

}

function autoFocus1() {
    document.getElementById("txtBarcode1").focus();
    document.getElementById("txtBarcode1").scrollIntoView();
}

function autoFocus2() {
    document.getElementById("fault_description").focus();
    document.getElementById("fault_description").scrollIntoView();
}


function deleteAllRows1() {
    document.getElementById("myTable1").innerHTML = "";
    sessionStorage.removeItem("barcodeList1");
    autoFocus1();
}

function removeRow1(input) {
    var barcodeArray = JSON.parse(sessionStorage.getItem("barcodeList1"));
    var i = input.parentNode.parentNode.rowIndex;
    document.getElementById("myTable1").deleteRow(i);
    barcodeArray.splice(i, 1);
    sessionStorage.setItem("barcodeList1", JSON.stringify(barcodeArray));
    autoFocus1();
}

function myFirstFunction() {

    if (document.getElementById("txtBarcode").value.trim() !== "") {

        var barcodeArray = [];
        var barcodeArray1 = [];
        var i = 0;
        var bool = true;
        var popup;
        var bool1 = true;

        var table = document.getElementById("myTable");
        var selecteditem = document.getElementById("txtBarcode");

        if (sessionStorage.getItem("barcodeList")) {
            barcodeArray = JSON.parse(sessionStorage.getItem("barcodeList"));
        } else {

            sessionStorage.setItem("barcodeList", JSON.stringify(barcodeArray));
            barcodeArray = JSON.parse(sessionStorage.getItem("barcodeList"));

        }

        if (sessionStorage.getItem("barcodeList1")) {
            barcodeArray1 = JSON.parse(sessionStorage.getItem("barcodeList1"));
        } else {

            sessionStorage.setItem("barcodeList1", JSON.stringify(barcodeArray1));
            barcodeArray1 = JSON.parse(sessionStorage.getItem("barcodeList1"));

        }

        for (i = 0; i < barcodeArray.length; i++) {
            if (barcodeArray[i] === selecteditem.value) {
                bool = false;
                break;
            }
        }

        for (i = 0; i < barcodeArray1.length; i++) {
            if (barcodeArray1[i] === selecteditem.value) {
                bool1 = false;
                break;
            }
        }

        if (bool === true && bool1 === true) {

            barcodeArray.push(selecteditem.value);
            sessionStorage.setItem("barcodeList", JSON.stringify(barcodeArray));
            table.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + selecteditem.value + '" name = "barcode"></td> <td style="padding:0;"></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeRow(this)"><i class="fa fa-trash"></i></button></td></tr>';
            document.getElementById("txtBarcode").value = "";
            autoFocus();

        } else {
            popup = document.getElementById("myPopup");
            popup.innerHTML = "Duplicate Barcode Number!!";
            if (!popup.classList.contains("show")) {
                popup.classList.add("show");

                setTimeout(function () {
                    popup.classList.remove("show");
                }, 3000);
            }
            document.getElementById("txtBarcode").value = "";
            autoFocus();
        }


    } else {
        popup = document.getElementById("myPopup");
        popup.innerHTML = "Please Enter a Barcode Number!!";
        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
        autoFocus();
    }

}

function autoFocus() {
    document.getElementById("txtBarcode").focus();

}


function deleteAllRows() {
    document.getElementById("myTable").innerHTML = "";
    sessionStorage.removeItem("barcodeList");
    autoFocus();
}

function removeRow(input) {
    var barcodeArray = JSON.parse(sessionStorage.getItem("barcodeList"));
    var i = input.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
    barcodeArray.splice(i, 1);
    sessionStorage.setItem("barcodeList", JSON.stringify(barcodeArray));
    autoFocus();
}

