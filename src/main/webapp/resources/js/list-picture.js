const actionForm_pic =$("#actionForm_picture");

$(".paginate_button_picture a").on("click",
	function(e){
		e.preventDefault();
		actionForm_pic.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm_pic.attr("action", "/film/list-picture");
		actionForm_pic.submit();
});

