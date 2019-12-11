function isHidden(el) {
    var style = window.getComputedStyle(el);
    return ((style.display === 'none') || (style.visibility === 'hidden'))
}


function myFunction() {
    let x = document.getElementById("snackbar");
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

function logValue() {
    switch (this.value) {
        case "bar":
            document.getElementById("resetBtn").setAttribute('type', 'submit');
            document.getElementById("resetBtn").className = "btn btn-success btn-block";
            document.getElementById("txtSearch").setAttribute('type', 'text');
            document.getElementById("resetBtn").setAttribute('value', 'Search Stock');
            break;
        case "stockindate":
            document.getElementById("txtSearch").setAttribute('type', 'date');
            document.getElementById("resetBtn").setAttribute('value', 'Reset');
            document.getElementById("resetBtn").setAttribute('type', 'reset');
            document.getElementById("resetBtn").className = "btn btn-danger btn-block";
            break;
        default :
            document.getElementById("resetBtn").setAttribute('type', 'reset');
            document.getElementById("txtSearch").setAttribute('type', 'text');
            document.getElementById("resetBtn").className = "btn btn-danger btn-block";
            document.getElementById("resetBtn").setAttribute('value', 'Reset');
            break;
    }
}

let select = document.getElementById("searchType");
select.addEventListener('change', logValue, false);


function myFirstFunction() {

    let barcodeText = document.getElementById("txtBarcode");
    let itemStatus = document.getElementById("itemStatus");
    let itemDescription = document.getElementById("description");

    if (barcodeText.value.trim() !== "" && itemStatus.value.trim() !== "") {


        var workingBarcodeItems = [];
        var faultBarcodeItems = [];
        var i = 0;
        var bool = true;
        var popup;
        var boolFault = true;


        var workingItemsTable = document.getElementById("workingItemsTable");
        var faultTable = document.getElementById("faultTable");


        if (sessionStorage.getItem("workingBarcodeItems")) {
            workingBarcodeItems = JSON.parse(sessionStorage.getItem("workingBarcodeItems"));
        } else {

            sessionStorage.setItem("workingBarcodeItems", JSON.stringify(workingBarcodeItems));
            workingBarcodeItems = JSON.parse(sessionStorage.getItem("workingBarcodeItems"));

        }

        if (sessionStorage.getItem("faultBarcodeItems")) {
            faultBarcodeItems = JSON.parse(sessionStorage.getItem("faultBarcodeItems"));
        } else {

            sessionStorage.setItem("faultBarcodeItems", JSON.stringify(faultBarcodeItems));
            faultBarcodeItems = JSON.parse(sessionStorage.getItem("faultBarcodeItems"));

        }

        for (i = 0; i < workingBarcodeItems.length; i++) {
            if (workingBarcodeItems[i] === barcodeText.value) {
                bool = false;
                break;
            }
        }

        for (i = 0; i < faultBarcodeItems.length; i++) {
            if (faultBarcodeItems[i] === barcodeText.value) {
                boolFault = false;
                break;
            }
        }

        if (bool === true && boolFault === true) {


            if (itemStatus.value.trim() === "working") {
                workingBarcodeItems.push(barcodeText.value);
                sessionStorage.setItem("workingBarcodeItems", JSON.stringify(workingBarcodeItems));
                if (itemDescription.value.trim() === "")
                    workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="------" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow(this)"><i class="fa fa-trash"></i></button></td></tr>';
                else
                    workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow(this)"><i class="fa fa-trash"></i></button></td></tr>';
                resetItemDetails();
                autoFocus();

            } else if (itemStatus.value.trim() === "faulty" && itemDescription.value.trim() !== "") {
                faultBarcodeItems.push(barcodeText.value);
                sessionStorage.setItem("faultBarcodeItems", JSON.stringify(faultBarcodeItems));
                faultTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "faultBarcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="faultDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeFaultItemRow(this)"><i class="fa fa-trash"></i></button></td></tr>';
                resetItemDetails();
                barcodeText.focus();
                document.getElementById("faultTable").scrollIntoView();

            } else {
                popup = document.getElementById("myPopup2");
                popup.innerHTML = "This is a Required Field!!";
                if (!popup.classList.contains("show")) {
                    popup.classList.add("show");

                    setTimeout(function () {
                        popup.classList.remove("show");
                    }, 3000);
                }

                itemDescription.focus();
                document.getElementById("itemsList").scrollIntoView();

            }


        } else {
            popup = document.getElementById("myPopup1");
            popup.innerHTML = "Duplicate Barcode Number!!";
            if (!popup.classList.contains("show")) {
                popup.classList.add("show");

                setTimeout(function () {
                    popup.classList.remove("show");
                }, 3000);
            }
            barcodeText.value = "";
            autoFocus();
        }


    } else if (itemStatus.value.trim() === "" && barcodeText.value.trim() !== "") {

        popup = document.getElementById("myPopup4");
        popup.innerHTML = "Please Select the Item Status!!";
        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
        itemStatus.focus();
        document.getElementById("itemsList").scrollIntoView();

    } else {
        popup = document.getElementById("myPopup1");
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

let visibleElement = undefined;

function myFirstFunctionV() {

    let all = document.getElementsByClassName("modal fade");


    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }

    let barcodeText = visibleElement.getElementById("txtBarcode");
    let itemStatus = visibleElement.getElementById("itemStatus");
    let itemDescription = visibleElement.getElementById("description");

    if (barcodeText.value.trim() !== "" && itemStatus.value.trim() !== "") {


        var workingBarcodeItems = [];
        var faultBarcodeItems = [];
        var i = 0;
        var bool = true;
        var popup;
        var boolFault = true;


        var workingItemsTable = visibleElement.getElementById("workingItemsTable");
        var faultTable = visibleElement.getElementById("faultTable");


        if (sessionStorage.getItem("workingBarcodeItems")) {
            workingBarcodeItems = JSON.parse(sessionStorage.getItem("workingBarcodeItems"));
        } else {

            sessionStorage.setItem("workingBarcodeItems", JSON.stringify(workingBarcodeItems));
            workingBarcodeItems = JSON.parse(sessionStorage.getItem("workingBarcodeItems"));

        }

        if (sessionStorage.getItem("faultBarcodeItems")) {
            faultBarcodeItems = JSON.parse(sessionStorage.getItem("faultBarcodeItems"));
        } else {

            sessionStorage.setItem("faultBarcodeItems", JSON.stringify(faultBarcodeItems));
            faultBarcodeItems = JSON.parse(sessionStorage.getItem("faultBarcodeItems"));

        }

        for (i = 0; i < workingBarcodeItems.length; i++) {
            if (workingBarcodeItems[i] === barcodeText.value) {
                bool = false;
                break;
            }
        }

        for (i = 0; i < faultBarcodeItems.length; i++) {
            if (faultBarcodeItems[i] === barcodeText.value) {
                boolFault = false;
                break;
            }
        }

        if (bool === true && boolFault === true) {


            if (itemStatus.value.trim() === "working") {
                workingBarcodeItems.push(barcodeText.value);
                sessionStorage.setItem("workingBarcodeItems", JSON.stringify(workingBarcodeItems));
                if (itemDescription.value.trim() === "")
                    workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="------" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRowV(this)"><i class="fa fa-trash"></i></button></td></tr>';
                else
                    workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRowV(this)"><i class="fa fa-trash"></i></button></td></tr>';
                resetItemDetailsV();
                autoFocusV();

            } else if (itemStatus.value.trim() === "faulty" && itemDescription.value.trim() !== "") {
                faultBarcodeItems.push(barcodeText.value);
                sessionStorage.setItem("faultBarcodeItems", JSON.stringify(faultBarcodeItems));
                faultTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "faultBarcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="faultDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeFaultItemRowV(this)"><i class="fa fa-trash"></i></button></td></tr>';
                resetItemDetailsV();
                barcodeText.focus();
                visibleElement.getElementById("faultTable").scrollIntoView();

            } else {
                popup = visibleElement.getElementById("myPopup2");
                popup.innerHTML = "This is a Required Field!!";
                if (!popup.classList.contains("show")) {
                    popup.classList.add("show");

                    setTimeout(function () {
                        popup.classList.remove("show");
                    }, 3000);
                }

                itemDescription.focus();
                visibleElement.getElementById("itemsList").scrollIntoView();

            }


        } else {
            popup = visibleElement.getElementById("myPopup1");
            popup.innerHTML = "Duplicate Barcode Number!!";
            if (!popup.classList.contains("show")) {
                popup.classList.add("show");

                setTimeout(function () {
                    popup.classList.remove("show");
                }, 3000);
            }
            barcodeText.value = "";
            autoFocusV();
        }


    } else if (itemStatus.value.trim() === "" && barcodeText.value.trim() !== "") {

        popup = visibleElement.getElementById("myPopup4");
        popup.innerHTML = "Please Select the Item Status!!";
        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
        itemStatus.focus();
        visibleElement.getElementById("itemsList").scrollIntoView();

    } else {
        popup = visibleElement.getElementById("myPopup1");
        popup.innerHTML = "Please Enter a Barcode Number!!";
        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
        autoFocusV();
    }

}

function resetItemDetails() {

    let barcodeText = document.getElementById("txtBarcode");
    let itemStatus = document.getElementById("itemStatus");
    let itemDescription = document.getElementById("description");

    barcodeText.value = "";
    itemStatus.getElementsByTagName("option").item(0).selected = true;
    itemDescription.value = "";
}

function resetItemDetailsV() {

    let all = document.getElementsByClassName("modal fade");

    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }

    let barcodeText = visibleElement.getElementById("txtBarcode");
    let itemStatus = visibleElement.getElementById("itemStatus");
    let itemDescription = visibleElement.getElementById("description");

    barcodeText.value = "";
    itemStatus.getElementsByTagName("option").item(0).selected = true;
    itemDescription.value = "";
}


function autoFocus() {
    document.getElementById("txtBarcode").focus();
    document.getElementById("itemsList").scrollIntoView();
}

function autoFocusV() {

    let all = document.getElementsByClassName("modal fade");

    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }

    visibleElement.getElementById("txtBarcode").focus();
    visibleElement.getElementById("itemsList").scrollIntoView();
}


function deleteAllWorkingItemsRows() {
    document.getElementById("workingItemsTable").innerHTML = "";
    sessionStorage.removeItem("workingBarcodeItems");
    document.getElementById("txtBarcode").focus();
    document.getElementById("workingItems").scrollIntoView();
}

function deleteAllWorkingItemsRowsV() {

    let all = document.getElementsByClassName("modal fade");

    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }

    visibleElement.getElementById("workingItemsTable").innerHTML = "";
    sessionStorage.removeItem("workingBarcodeItems");
    visibleElement.getElementById("txtBarcode").focus();
    visibleElement.getElementById("workingItems").scrollIntoView();
}

function removeWorkingItemRow(input) {


    var barcodeArray = JSON.parse(sessionStorage.getItem("workingBarcodeItems"));
    var i = input.parentNode.parentNode.rowIndex;
    document.getElementById("workingItemsTable").deleteRow(i);
    barcodeArray.splice(i, 1);
    sessionStorage.setItem("workingBarcodeItems", JSON.stringify(barcodeArray));
    document.getElementById("txtBarcode").focus();
    document.getElementById("workingItems").scrollIntoView();
}

function removeWorkingItemRowV(input) {

    let all = document.getElementsByClassName("modal fade");

    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }

    var barcodeArray = JSON.parse(sessionStorage.getItem("workingBarcodeItems"));
    var i = input.parentNode.parentNode.rowIndex;
    visibleElement.getElementById("workingItemsTable").deleteRow(i);
    barcodeArray.splice(i, 1);
    sessionStorage.setItem("workingBarcodeItems", JSON.stringify(barcodeArray));
    visibleElement.getElementById("txtBarcode").focus();
    visibleElement.getElementById("workingItems").scrollIntoView();
}

function deleteAllFaultItemsRows() {
    document.getElementById("faultTable").innerHTML = "";
    sessionStorage.removeItem("faultBarcodeItems");
    document.getElementById("txtBarcode").focus();
    document.getElementById("faultTable").scrollIntoView();
}

function deleteAllFaultItemsRowsV() {

    let all = document.getElementsByClassName("modal fade");

    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }

    visibleElement.getElementById("faultTable").innerHTML = "";
    sessionStorage.removeItem("faultBarcodeItems");
    visibleElement.getElementById("txtBarcode").focus();
    visibleElement.getElementById("faultTable").scrollIntoView();
}

function removeFaultItemRow(input) {
    var barcodeArray = JSON.parse(sessionStorage.getItem("faultBarcodeItems"));
    var i = input.parentNode.parentNode.rowIndex;
    document.getElementById("faultTable").deleteRow(i);
    barcodeArray.splice(i, 1);
    sessionStorage.setItem("faultBarcodeItems", JSON.stringify(barcodeArray));
    document.getElementById("txtBarcode").focus();
    document.getElementById("faultTable").scrollIntoView();
}

function removeFaultItemRowV(input) {

    let all = document.getElementsByClassName("modal fade");

    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }

    var barcodeArray = JSON.parse(sessionStorage.getItem("faultBarcodeItems"));
    var i = input.parentNode.parentNode.rowIndex;
    visibleElement.getElementById("faultTable").deleteRow(i);
    barcodeArray.splice(i, 1);
    sessionStorage.setItem("faultBarcodeItems", JSON.stringify(barcodeArray));
    visibleElement.getElementById("txtBarcode").focus();
    visibleElement.getElementById("faultTable").scrollIntoView();
}


function validateFormX() {

    var popup;

    var array = [];
    var arrayFault = [];

    if (JSON.parse(sessionStorage.getItem("workingBarcodeItems")) != null)
        array = JSON.parse(sessionStorage.getItem("workingBarcodeItems"));

    if (JSON.parse(sessionStorage.getItem("faultBarcodeItems")) != null)
        arrayFault = JSON.parse(sessionStorage.getItem("faultBarcodeItems"));

    if (document.getElementById('itemdetailsdropitem').value.trim() === "") {
        popup = document.getElementById("myPopup3");
        popup.innerHTML = "This is a Required Field!!";
        document.getElementById("itemdetailsdropitem").focus();
        document.getElementById("stockItem").scrollIntoView();

        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
    } else if (array.length === 0 && arrayFault.length === 0) {
        popup = document.getElementById("myPopup1");
        popup.innerHTML = "Please Enter at least one Item!!!";
        document.getElementById("txtBarcode").focus();
        document.getElementById('itemsList').scrollIntoView();

        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
    } else {
        document.getElementById('mainForm').submit();
    }
}

function validateFormV() {

    let all = document.getElementsByClassName("modal fade");

    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }

    var popup;

    var array = [];
    var arrayFault = [];

    if (JSON.parse(sessionStorage.getItem("workingBarcodeItems")) != null)
        array = JSON.parse(sessionStorage.getItem("workingBarcodeItems"));

    if (JSON.parse(sessionStorage.getItem("faultBarcodeItems")) != null)
        arrayFault = JSON.parse(sessionStorage.getItem("faultBarcodeItems"));

    if (visibleElement.getElementById('itemdetailsdropitem').value.trim() === "") {
        popup = visibleElement.getElementById("myPopup3");
        popup.innerHTML = "This is a Required Field!!";
        visibleElement.getElementById("itemdetailsdropitem").focus();
        visibleElement.getElementById("stockItem").scrollIntoView();

        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
    } else if (array.length === 0 && arrayFault.length === 0) {
        popup = visibleElement.getElementById("myPopup1");
        popup.innerHTML = "Please Enter at least one Item!!!";
        visibleElement.getElementById("txtBarcode").focus();
        visibleElement.getElementById('itemsList').scrollIntoView();

        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
    } else {
        visibleElement.getElementById('mainForm').submit();
    }
}


function clearAllFields() {

    document.getElementById('iteminformation').innerHTML = 'Item&nbsp;Information&nbsp;Goes&nbsp;Here...';
    document.getElementById("workingItemsTable").innerHTML = "";
    document.getElementById("faultTable").innerHTML = "";

}

function clearAllFieldsV() {

    let all = document.getElementsByClassName("modal fade");

    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }
    visibleElement.getElementById('iteminformation').innerHTML = 'Item&nbsp;Information&nbsp;Goes&nbsp;Here...';
    visibleElement.getElementById("workingItemsTable").innerHTML = "";
    visibleElement.getElementById("faultTable").innerHTML = "";

}


let oldTable = "";

$(document).ready(function () {
    document.getElementById("txtBarcode").addEventListener(
        'keydown',
        function (event) {
            if ((event.ctrlKey && event.key === "j")
                || (event.ctrlKey && event.key === "b")
                || (event.ctrlKey && event.key === "i")
                || (event.keyCode === 13))
                event.preventDefault();

        });


});

window.onload = function () {
    oldTable = document.getElementById("mainTable").innerHTML;
    sessionStorage.clear();

};


document.getElementById('itemdetailsdropitem').addEventListener('keyup', function (event) {
    if (event.keyCode === 13) {
        document.getElementById('itemdetailsitemdisplay').classList.toggle('show');
    }
});


//filter fucntion for the Item Detail
function itemdetailsitemdisplayfilterFunction() {
    var input, filter, ul, li, a, i, div;
    input = document.getElementById("itemdetailsmyInput");
    filter = input.value.toUpperCase();
    div = document.getElementById("itemdetailsitemdisplay");
    a = div.getElementsByTagName("a");

    for (i = 0; i < a.length; i++) {
        txtValue = a[i].textContent || a[i].innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}

function itemdetailsitemdisplayfilterFunctionV() {

    let all = document.getElementsByClassName("modal fade");

    for (let i = 0, max = all.length; i < max; i++) {
        if (!isHidden(all[i]))
            visibleElement = all[i];

    }

    var input, filter, ul, li, a, i, div;
    input = visibleElement.getElementById("itemdetailsmyInput");
    filter = input.value.toUpperCase();
    div = visibleElement.getElementById("itemdetailsitemdisplay");
    a = div.getElementsByTagName("a");

    for (i = 0; i < a.length; i++) {
        txtValue = a[i].textContent || a[i].innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}


window.onclick = function (event) {


    var itemx = document.getElementById("itemdetailsitemdisplay");


    if (event.target.id === "itemdetailsdropitem" || event.target.id === "caret") {
        itemx.classList.toggle("show");

    } else if (event.target.id === "itemdetailsmyInput") {

    } else {


        itemx.classList.remove("show");

    }
};


//to search main table
function searchfunction() {
    let input, filter, table, tr, td, i, txtValue, catval, colno;


    input = document.getElementById("txtSearch");
    catval = document.getElementById("searchType").value;
    filter = input.value.toUpperCase();
    table = document.getElementById("mainTable");


    tr = table.getElementsByTagName("tr");
    switch (catval) {
        case "stockid":
            colno = 0;
            break;
        case "iname":
            colno = 2;
            break;
        case "manu":
            colno = 3;
            break;
        case "sup":
            colno = 4;
            break;
        case "itype":
            colno = 5;
            break;
        case "stockindate":
            colno = 6;
            break;
        default:
            return false;
    }
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[colno];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function clearTable() {
    document.getElementById("mainTable").innerHTML = oldTable;
    document.getElementById("txtSearch").setAttribute('type', 'text');
}
