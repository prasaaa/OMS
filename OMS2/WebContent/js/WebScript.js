function myFunction() {
		var x = document.getElementById("snackbar");
		x.className = "show";
		setTimeout(function() {
			x.className = x.className.replace("show", "");
		}, 3000);
		
	}


function setInputFilter(textbox, inputFilter) {
	[ "input", "keydown", "keyup", "mousedown", "mouseup", "select",
			"contextmenu", "drop" ].forEach(function(event) {
		textbox.addEventListener(event, function() {
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

document.getElementById("txtSearch").addEventListener('keydown', function(event) {
	if ((event.ctrlKey  &&  event.key === "j") || event.keyCode == 13 || (event.ctrlKey  &&  event.key === "b") || (event.ctrlKey  &&  event.key === "i"))
		event.preventDefault();
});
