const actionForm =$("#actionForm");

$(".paginate_button a").on("click",
	function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action", "/film/board");
		actionForm.submit();
});

