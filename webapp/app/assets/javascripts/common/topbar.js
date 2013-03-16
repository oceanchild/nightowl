/* ===============================
 * COMMON :: Prevent Embedding //
 * ============================
 */
if (window != top){
	top.location.href = "/";
}

/* ===========================
 * COMMON :: Image Preload //
 * ========================
 */
function preload(arrayOfImages) {
    $(arrayOfImages).each(function(){
        $('<img/>')[0].src = this;
        // Alternatively you could use:
        // (new Image()).src = this;
    });
}
// Usage:
preload([
    '/assets/common/logo.png',
    '/assets/common/overlay.png',
    '/assets/common/calendar_left_inset.png',
    '/assets/common/calendar_right_inset.png',
]);

/* ==============================================
/* COMMON :: Top Navigation Buttons Animation //
/* ===========================================
 */
$(function() {
	/*$('#menu li.has-sub').click(function(e) {
		e.preventDefault();
		$(this).find('.submenu').toggle();
		$(this).toggleClass('menu-open');
	});
	$('#menu li.has-sub').mouseup(function() {
		return false;
	});
	var mouseInsideTarget = false;
	$('#menu li.menu-open submenu').hover(function() {
		mouseInsideTarget = true;
	}, function() {
		mouseInsideTarget = false;
	});
	$(document).mousedown(function(e) {
		if(mouseInsideTarget) {
			$('#debug').html(mouseInsideTarget);
		} else {
			$('.menu-open .submenu').hide();
			$('.menu-open').removeClass('menu-open');
			$('#debug').html(mouseInsideTarget);
		}
	});*/
	var timer;
	$('#menu li.has-sub').hover(function() {
		var $this = $(this);
		clearTimeout(timer);
		if(!$this.hasClass('menu-open')) {
			timer = setTimeout(function() {
				$('#menu li.has-sub').removeClass('menu-open').find('.submenu').hide();
				$this.addClass('menu-open');
				$this.find('.submenu').show();
			}, 300);
		}
	}, function() {
		var $this = $(this);
		clearTimeout(timer);
		if($this.hasClass('menu-open')) {
			timer = setTimeout(function() {
				$this.removeClass('menu-open');
				$this.find('.submenu').hide();
			}, 350);
		}
	});
});

/* ==================================================
 * COMMON :: Calendar Module and Topbar Animation //
 * ===============================================
 */
// calendar global variables
var inset_left_x;
var inset_right_x;
var window_height;
var window_scroll_height;
var calendar_left;
var calendar_right;
var calendar_width;
var calendar_height;
var week_calendar_height;
var topbar_height = $('#top-wrapper').outerHeight();
var calendar_border_radius = 20;
var calendar_inset_radius = 20;
var intervalID;

$(function() {
	// #calendar-activate-btn mouse actions
	$('#calendar-wrapper').delegate('#calendar-activate-btn:not(.active)', 'click', function() {
		calendarSizeAjust();
		$('#top-wrapper').removeClass('reset');
		$('#calendar-activate-btn.active').removeClass('active');
		$('#calendar-activate-btn').addClass('active');
		// setup interval monitor to check slide down action progression
		intervalID = setInterval(function() {
			if (window_height+$('#calendar-wrapper').position().top-window_scroll_height > topbar_height+calendar_border_radius+calendar_inset_radius) {
				$('#calendar-left-inset').show();
				$('#calendar-right-inset').show();
				clearInterval(intervalID);
			}
		}, 10);
		// #calendar-wrapper slide down step action :: slide down calendar below the topbar and then move insets into position
		$('#calendar-wrapper').stop().show().animate({
			top: 0
		}, function() {
			$('#week-calendar-top, #week-calendar-bottom').show();
			$('#calendar-activate-btn.active span').html('关闭');
		});
		$('#modal-overlay').fadeIn(100);
	});
	$('#calendar-wrapper').delegate('#calendar-activate-btn:.active', 'click', function() {
		calendarSizeAjust();
		// setup interval monitor to check slide up action progression
		intervalID = setInterval(function() {
			if (window_height+$('#calendar-wrapper').position().top-window_scroll_height < topbar_height+calendar_border_radius+calendar_inset_radius+40) {
				$('#calendar-left-inset').hide();
				$('#calendar-right-inset').hide();
				clearInterval(intervalID);
			}
		}, 10);
		$('#week-calendar-top, #week-calendar-bottom').hide();
		$('#calendar-wrapper').stop().animate({
			top: 0 - window_height
		}, function() {
			$('#top-wrapper').addClass('reset');
			$('#calendar-activate-btn').removeClass('active');
			$('#calendar-activate-btn span').html('日历');
			$('#modal-overlay').hide();
		});
	});
	// clicking outside of #calendar-wrapper to make it unavailable
	$('#modal-overlay').click(function() {
		calendarSizeAjust();
		// setup interval monitor to check slide up action progression
		intervalID = setInterval(function() {
			if (window_height+$('#calendar-wrapper').position().top-window_scroll_height < topbar_height+calendar_border_radius+calendar_inset_radius+40) {
				$('#calendar-left-inset').hide();
				$('#calendar-right-inset').hide();
				clearInterval(intervalID);
			}
		}, 10);
		$('#week-calendar-top, #week-calendar-bottom').hide();
		$('#calendar-wrapper').stop().animate({
			top: 0 - window_height
		}, function() {
			$('#top-wrapper').addClass('reset');
			$('#calendar-activate-btn').removeClass('active');
			$('#calendar-activate-btn span').html('日历');
			$('#modal-overlay').hide();
		});
	});
	
	// action on window resizing
	$(window).resize(function() {
		setTimeout(calendarSizeAjust, 200);
	});
});

// refresh variables
function refreshVars() {
	// calculating inset elements' position
	//inset_left_x = $('#top-nav').offset().left - 20;
	inset_left_x = $('#calendar').offset().left - 20;
	//inset_right_x = $('#top-nav').offset().left + $('#top-nav').outerWidth();
	inset_right_x = $('#calendar').offset().left + $('#calendar').outerWidth();
	// calculating calendar and components' position
	window_height = $(window).height() - 50;
	if (window_height<500) {
		window_height = 500;
	}
	window_scroll_height = $(window).scrollTop();
	
	calendar_height = $('#calendar').outerHeight(true);
	week_calendar_height = $('#week-calendar').outerHeight(true);
}

// resize calendar
function calendarSizeAjust() {
	refreshVars();
	// #doc height
	$('#doc').css('height', $(window).height());
	// positioning inset elements
	$('#calendar-left-inset').css('left', inset_left_x);
	$('#calendar-right-inset').css('left', inset_right_x);
	// positioning calendar elements
	$('#calendar').css('height', window_height);
	$('#week-calendar-bottom').css('height', calendar_height-week_calendar_height);
	$('#week-calendar-events-left').css('height', calendar_height-week_calendar_height-40);
	$('#week-calendar-lists').css('height', calendar_height-week_calendar_height-40);
	$('#week-calendar-events-right').css('height', calendar_height-week_calendar_height-40);
	$('#week-calendar-details').css('height', calendar_height-week_calendar_height-40);
	$('#calendar-btn').css('left', $('#search').offset().left+$('#search').outerWidth(true)-$(window).scrollLeft());
	if(!$('#calendar-activate-btn').hasClass('active')) {
		$('#calendar-wrapper').css('top', 0-window_height);
	}
	$('#modal-overlay').css({
		width: $(window).outerWidth(),
		height: $(window).outerHeight()
	});
}

// initialize the calendar height
function init_calendar() {
	calendarSizeAjust();
}

// hide the calendar module until page has been fully loaded and calendar module has been properly positioned
$(document).ready(function() {
	$('#calendar-wrapper').show();
});
