const actionForm =$("#actionForm");
const searchForm = $("#searchForm");

$(".paginate_button a").on("click",
	function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action", "/film/board");
		actionForm.submit();
});

 $(document).ready(function() {

	$(".move").on("click",
		function(e){
			e.preventDefault();
			if(actionForm.find("input[name='bno']").val() != '') {
				actionForm.find("input[name='bno']").remove();
			}
			actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
			actionForm.attr("action", "board/read");
			actionForm.submit();
	});
	
    $("#searchForm button").on("click",
    	function(e) {
    		if(!searchForm.find("input[name='keyword']").val()) {
    			alert("키워드를 입력하세요");
    			return false;
    		}
    		searchForm.find("input[name='pageNum']").val("1");
    		e.preventDefault();
    		searchForm.submit();
    });
});