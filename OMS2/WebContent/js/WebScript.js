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


function myFirstFunctionV() {

    let barcodeText = document.getElementById("txtBarcodev");
    let itemStatus = document.getElementById("itemStatusv");
    let itemDescription = document.getElementById("descriptionv");

    if (barcodeText.value.trim() !== "" && itemStatus.value.trim() !== "") {


        let i = 0;
        let bool = true;
        let popup;
        let boolFault = true;


        let workingItemsTable = document.getElementById("workingItemsTablev");
        let faultTable = document.getElementById("faultTablev");


        let rows = workingItemsTable.getElementsByTagName('tr');

        for (let i = 0; rows[i] !== undefined; i++) {
            if (rows[i].getElementsByTagName('td')[0].getElementsByTagName('input')[0].value.trim() === barcodeText.value.trim()) {
                bool = false;
                break;
            }
        }

        let rowsFault = faultTable.getElementsByTagName('tr');

        for (let i = 0; rowsFault[i] !== undefined; i++) {
            if (rowsFault[i].getElementsByTagName('td')[0].getElementsByTagName('input')[0].value.trim() === barcodeText.value.trim()) {
                boolFault = false;
                break;
            }
        }


        if (bool === true && boolFault === true) {


            if (itemStatus.value.trim() === "working") {

                if (itemDescription.value.trim() === "")
                    workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="------" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRowV(this)"><i class="fa fa-trash"></i></button></td></tr>';
                else
                    workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRowV(this)"><i class="fa fa-trash"></i></button></td></tr>';
                resetItemDetailsV();
                autoFocusV();

            } else if (itemStatus.value.trim() === "faulty" && itemDescription.value.trim() !== "") {
                faultTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "faultBarcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="faultDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeFaultItemRowV(this)"><i class="fa fa-trash"></i></button></td></tr>';
                resetItemDetailsV();
                autoFocusV();

            } else {
                popup = document.getElementById("myPopup2v");
                popup.innerHTML = "This is a Required Field!!";
                if (!popup.classList.contains("show")) {
                    popup.classList.add("show");

                    setTimeout(function () {
                        popup.classList.remove("show");
                    }, 3000);
                }

                itemDescription.focus();
                window.scrollTop;


            }


        } else {
            popup = document.getElementById("myPopup1v");
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

        popup = document.getElementById("myPopup4v");
        popup.innerHTML = "Please Select the Item Status!!";
        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
        itemStatus.focus();
        window.scrollTop;

    } else {
        popup = document.getElementById("myPopup1v");
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


function resetItemDetailsV() {

    let barcodeText = document.getElementById("txtBarcodev");
    let itemStatus = document.getElementById("itemStatusv");
    let itemDescription = document.getElementById("descriptionv");

    barcodeText.value = "";
    itemStatus.getElementsByTagName("option").item(0).selected = true;
    itemDescription.value = "";
}


function autoFocusV() {
    document.getElementById("txtBarcodev").focus();
    window.scrollTop;
}


function deleteAllWorkingItemsRowsV() {
    document.getElementById("workingItemsTablev").innerHTML = "";
    document.getElementById("txtBarcodev").focus({
        preventScroll: true
    });
}

function removeWorkingItemRowV(input) {

    var i = input.parentNode.parentNode.rowIndex;
    let workingTable = document.getElementById("workingItemsTablev");

    workingTable.deleteRow(i);

    let rows = workingTable.getElementsByTagName('tr');

    if (rows.length === 0)
        workingTable.innerHTML = "";

    document.getElementById("txtBarcodev").focus({
        preventScroll: true
    });
}


function deleteAllFaultItemsRowsV() {
    document.getElementById("faultTablev").innerHTML = "";
    document.getElementById("txtBarcodev").focus({
        preventScroll: true
    });
}


function removeFaultItemRowV(input) {
    var i = input.parentNode.parentNode.rowIndex;
    let faultTable = document.getElementById("faultTable<%=i%>");
    faultTable.deleteRow(i);

    let rowsFault = faultTable.getElementsByTagName('tr');

    if (rowsFault.length === 0)
        faultTable.innerHTML = "";
    document.getElementById("txtBarcodev").focus({
        preventScroll: true
    });
}


function validateFormX() {

    var popup;


    if (document.getElementById('itemdetailsdropitemv').value.trim().replace(/^\s+|\s+$/, '') === "") {
        popup = document.getElementById("myPopup3v");
        popup.innerHTML = "This is a Required Field!!";
        document.getElementById("itemdetailsdropitemv").focus();
        window.scrollTop;

        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
    } else if (document.getElementById("workingItemsTablev").innerHTML.trim().replace(/^\s+|\s+$/, '') === "" && document.getElementById("faultTablev").innerHTML.trim().replace(/^\s+|\s+$/, '') === "") {
        popup = document.getElementById("myPopup1v");
        popup.innerHTML = "Please Enter at least one Item!!!";
        document.getElementById("txtBarcodev").focus();
        window.scrollTop;

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


function clearAllFieldsV() {
    document.getElementById("itemdetailsdropitemv").value = "";
    document.getElementById('iteminformationv').innerHTML = 'Item&nbsp;Information&nbsp;Goes&nbsp;Here...';
    document.getElementById("workingItemsTablev").innerHTML = "";
    document.getElementById("faultTablev").innerHTML = "";

    if (document.getElementById("ErrorMessage") !== null)
        document.getElementById("ErrorMessage").hidden = true;

    window.scrollTop;

}


let oldTable = "";


document.getElementById("txtBarcodev").addEventListener('keydown', function (event) {
    if ((event.ctrlKey && event.key === "j") || (event.ctrlKey && event.key === "b") || (event.ctrlKey && event.key === "i") || (event.keyCode === 13))
        event.preventDefault();

});

document.getElementById("txtSearch").addEventListener('keydown', function (event) {
    if ((event.ctrlKey && event.key === "j") || event.keyCode === 13 || (event.ctrlKey && event.key === "b") || (event.ctrlKey && event.key === "i"))
        event.preventDefault();
});


window.addEventListener('load', function () {
    oldTable = document.getElementById("mainTable").innerHTML;

});


document.getElementById('itemdetailsdropitemv').addEventListener('keyup', function (event) {
    if (event.keyCode === 13) {
        document.getElementById('itemdetailsitemdisplayv').classList.toggle('show');
    }
});


//filter function for the Item Detail
function itemdetailsitemdisplayfilterFunctionV() {
    let input, filter, ul, li, a, i, div;
    input = document.getElementById("itemdetailsmyInput");
    filter = input.value.toUpperCase();
    div = document.getElementById("itemdetailsitemdisplay");
    a = div.getElementsByTagName("a");

    let txtValue;
    for (i = 0; i < a.length; i++) {
        txtValue = a[i].textContent || a[i].innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}


window.addEventListener('click', function (event) {

    let itemx = document.getElementById("itemdetailsitemdisplayv");

    if (event.target.id === "itemdetailsdropitemv" || event.target.id === "caretv") {
        itemx.classList.toggle("show");

    } else if (event.target.id === "itemdetailsmyInputv") {
    } else {
        itemx.classList.remove("show");
    }
});


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
