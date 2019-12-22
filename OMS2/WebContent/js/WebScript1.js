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

    let barcodeText = document.getElementById("itemList");
    let itemDescription = document.getElementById("descriptionv");

    if (barcodeText.value.trim() !== "") {


        let i = 0;
        let bool = true;
        let popup;


        let workingItemsTable = document.getElementById("ItemsListTable");


        let rows = workingItemsTable.getElementsByTagName('tr');

        for (let i = 0; rows[i] !== undefined; i++) {
            if (rows[i].getElementsByTagName('td')[0].getElementsByTagName('input')[0].value.trim() === barcodeText.value.trim()) {
                bool = false;
                break;
            }
        }


        if (bool === true) {


            if (itemDescription.value.trim() !== "") {
                workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" readonly name="description" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRowV(this)"><i class="fa fa-trash"></i></button></td></tr>';
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
                window.scroll(0, 0);


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

    $('#itemList').val(null).trigger('change');
    document.getElementById("descriptionv").value = "";
}


function autoFocusV() {
    document.getElementById("itemList").focus();
    window.scroll(0, 0);
}


function deleteAllWorkingItemsRowsV() {
    document.getElementById("ItemsListTable").innerHTML = "";
    document.getElementById("itemList").focus({
        preventScroll: true
    });
}

function removeWorkingItemRowV(input) {

    var i = input.parentNode.parentNode.rowIndex;
    let workingTable = document.getElementById("ItemsListTable");

    workingTable.deleteRow(i);

    let rows = workingTable.getElementsByTagName('tr');

    if (rows.length === 0)
        workingTable.innerHTML = "";

    document.getElementById("itemList").focus({
        preventScroll: true
    });
}


function validateFormX() {

    var popup;


    if (document.getElementById('itemdetailsdropitemv').value.trim().replace(/^\s+|\s+$/, '') === "") {
        popup = document.getElementById("myPopup3v");
        popup.innerHTML = "This is a Required Field!!";
        document.getElementById("itemdetailsdropitemv").focus();
        window.scroll(0, 0);

        if (!popup.classList.contains("show")) {
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 3000);
        }
    } else if (document.getElementById("ItemsListTable").innerHTML.trim().replace(/^\s+|\s+$/, '') === "") {
        popup = document.getElementById("myPopup1v");
        popup.innerHTML = "Please Enter at least one Item!!!";
        document.getElementById("itemList").focus();
        window.scroll(0, 0);

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
    document.getElementById("ItemsListTable").innerHTML = "";
    document.getElementById('custOrder').value = "";


    if (document.getElementById("custOrderTable").classList.contains("show"))
        document.getElementById("custOrderTable").classList.remove("show");


    if (document.getElementById("ErrorMessage") !== null)
        document.getElementById("ErrorMessage").hidden = true;

    if (document.getElementById('itemList') !== undefined || document.getElementById('itemList') !== null) {
        document.getElementById('itemList').innerHTML = "";
        let x = document.createElement('option');
        x.text = "Please Choose One or More Stock Items Here by Barcode...";
        x.value = '';
        x.selected = true;
        x.disabled = true;
        document.getElementById('itemList').add(x);
    }


    window.scroll(0, 0);

}


let oldTable = "";


document.getElementById("itemList").addEventListener('keydown', function (event) {
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

document.getElementById('custOrder').addEventListener('click', function (event) {

    document.getElementById("custOrderTable").classList.toggle("show");
    clearCustTable();

});

document.getElementById('custOrder').addEventListener('keydown', function (event) {

    if (event.keyCode === 13) {
        document.getElementById("custOrderTable").classList.toggle("show");
        clearCustTable();
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

function clearCustTable() {
    document.getElementById("custOrderSearch").value = "";
    document.getElementById("custOrderSearchType").getElementsByTagName('option').item(0).selected = true;
    let table = document.getElementById("custOrderTable");

    let tr = table.getElementsByTagName("tr");

    let i;

    for (i = 1; i < tr.length; i++) {
        tr[i].style.display = "";
    }

    table.scroll(0, 0);
}


function searchfunctionV() {

    let input, filter, table, tr, td, i, txtValue, catval, colno;

    input = document.getElementById("custOrderSearch");
    catval = document.getElementById("custOrderSearchType").value;
    filter = input.value.toUpperCase();
    table = document.getElementById("custOrderTable");

    tr = table.getElementsByTagName("tr");
    switch (catval) {
        case "orderID":
            colno = 0;
            break;
        case "custName":
            colno = 1;
            break;
        case "location":
            colno = 2;
            break;
        case "branch":
            colno = 3;
            break;
        case "ordersList":
            colno = 4;
            break;
        default:
            return false;
    }
    for (i = 1; i < tr.length; i++) {
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
