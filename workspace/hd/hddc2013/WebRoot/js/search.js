
$(function () {
	$("#form119").hide();
	$("#search").bind("click", function () {
		if ($("#form119").is(":visible")) {
			$("#form119").hide();
			$("#font").html("+");
		} else {
			$("#form119").show();
			$("#font").html("-");
		}
	});
});


