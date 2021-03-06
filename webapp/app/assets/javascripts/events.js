$(document).ready(function() {
	// global initiation :: initiate everything
	init();

	function init() {
		init_calendar(); // initiate calendar
		/* EVENTS PAGE specific components initiation */
		init_mapcontrol();
	}
});

// Deletes all markers in the array by removing references to them
function deleteOverlays() {
  if (markersArray) {
    for (i in markersArray) {
    	// markersArray[i].infoBubble.close();
		markersArray[i].setMap(null);
    }
    markersArray.length = 0;
  }
}

//Add new markers to array
function add_markers(){
	markersArray = [];
	setMarkers(map, datas);
}

//Below is the functions for clicking the tags at the bottom
function displayList(events) {
	$("div.updated-events-list").html(events);
	//alert($("input#hidden_event_lat").eq(0).val());
}

function getEvents() {
	datas = [];
	var keywords = [];
	$('#map-filters span.selected').each(function(){
		keywords.push($(this).html());
	});
	$.ajax({
          url: "/events/tag_filter",
          data: {keywords: keywords.join("','")},
          dataType: "html",
          type: "GET",
          success: function(data){
          	displayList(data);
          	deleteOverlays();
          	add_markers();
          }
    });
}

function init_mapcontrol() {
	$('#map_canvas').width($(window).outerWidth(true));
	$('#map_canvas').height($(window).outerHeight(true)+25); //+25 gets rid of the google logo at bottom of the page
	$('#map-filters span').toggle(function() {
		$(this).addClass('selected');
	}, function() {
		$(this).removeClass('selected');
	});
	$('#map-filters span').click(function() {
		getEvents();
	});
	$('#filter-activate-btn').toggle(function() {
		$('#map-filters').stop().show().animate({
			bottom: 0
		});
		$(this).html('x');
	}, function() {
		$('#map-filters').stop().show().animate({
			bottom: -400
		});
		$(this).html('+');
	});
	$(window).resize(function() {
		elementsPosition();
	});
	
	$('#map-listing-btn').toggle(function() {
		$('#map-listing').animate({
			left: 0,
		});
		$('#map-listing').addClass('out');
	}, function() {
		$('#map-listing').animate({
			left: -350,
		});
		$('#map-listing').removeClass('out');
	});
	
	elementsPosition();
}

function elementsPosition() {
	$('#map-listing').css({
		'height': $(window).height(),
	});
	$('#map-listing-content').css({
		'height': $(window).height()-145,
	});
	$('#map-listing-btn').css({
		'top': ($(window).outerHeight()-$('#map-listing-btn').outerHeight())/2,
	})
	$('#map-footer').css({
		'left': ($(window).outerWidth()-$('#map-footer').outerWidth())/2,
		'top': $(window).height()-45,
	});
	$('#map-filters').css({
		'left': $('#map-footer').position().left + $('#map-footer').outerWidth(true) - $('#map-filters').outerWidth(true),
	});
}

function joinEvent(joinEventId, i){
	$('a.join-btn').load(
		"/events/join_events",
		"eventId="+joinEventId,
		function(){
			if(datas[i].joinStatus == "我要参加" ){
				datas[i].joinStatus = '取消参加';
				datas[i].participants_num++;
				document.getElementById("join_event_"+joinEventId).innerHTML = '取消参加';
				document.getElementById("joinnum").innerHTML = datas[i].participants_num;
			}else{
				datas[i].joinStatus = '我要参加';
				datas[i].participants_num--;
				document.getElementById("join_event_"+joinEventId).innerHTML = '我要参加';
				document.getElementById("joinnum").innerHTML = datas[i].participants_num;
			}
		}
	);
}

function followEvent(){
	
}
