$(document).ready(function() {
	// global initiation :: initiate everything
	init();
	
	function init() {
		init_calendar(); // initiate calendar
		/* USERS PAGE specific components initiation */
		init_friends();
		
	}
});

/* =====================================================
// USER PAGE :: Detailed Information Panel Animation //
// ==================================================
*/
function init_friends() {
	var original_list = document.getElementById('streams').innerHTML;
	
	$(".filter-box").focus(function() {
		if ($("textarea.filter-box").val() == '搜索我的好友') {
			$("textarea.filter-box").val('');
		} else {}
	});
	
	$(".filter-box").blur(function() {
		if ($("textarea.filter-box").val().length == 0) {
			$("textarea.filter-box").val('搜索我的好友');
		} else {}
	});
	
	//ajax the inputs to return friends names matches the inputs
	// $(".fabu-box").keyup(function(){
		// if($("textarea.fabu-box").val().length != 0){
			// $("#streams").empty();	
			// $("#streams").load("/friends/search_friend", "message="+$("textarea.fabu-box").val());
		// }else{
			// document.getElementById('streams').innerHTML = original_list;
		// }
	// });
	$("#filterbtn").click(function() {
		if ($("textarea.filter-box").val().length != 0 && $("textarea.filter-box").val() != "搜索我的好友") {
			$("#streams").empty();
			$("#streams").load("/friends/search_friend", "message="+$("textarea.filter-box").val());
		} else {
			document.getElementById('streams').innerHTML = original_list;
		}
	});
	$(".filter-box").keyup(function() {
		if ($("textarea.filter-box").val().length == 0) {
			document.getElementById('streams').innerHTML = original_list;
			$("#filterbtn").attr("disabled", true);
		} else {
			$("#filterbtn").attr("disabled", false);
		}
	})
	
	//search a specific user
	$(".search_btn").click(function() {
		if ($("#search_nickname").val().length != 0 || $('#search_email').val().length !=0 ) {
			$('#detail_search_result').load("/friends/detail_search", "nickname="+$("#search_nickname").val()+"&email="+$("#search_email").val());
		} else {}
	});
}
