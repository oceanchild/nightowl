var today = new Date();
var current_day = today;
var day_of_week;
var date_array = new Array();

$(document).ready(function() {
	getNewDate(today);
});

function prevWeek() {
	getNewDate(new Date(current_day.getFullYear(), current_day.getMonth(), current_day.getDate()-7));
}

function nextWeek() {
	getNewDate(new Date(current_day.getFullYear(), current_day.getMonth(), current_day.getDate()+7));
}

function getNewDate(aday) {
	current_day = aday;
	day_of_week = aday.getDay();
	for (i=0; i<7; i++) {
		if (day_of_week==i) {
			date_array[i] = aday;
			if (aday.getFullYear()==today.getFullYear() && aday.getMonth()==today.getMonth() && aday.getDate()==today.getDate()) {
				$('.week-calendar-day').eq(i).addClass('week-today');
			} else {
				$('.week-calendar-day').eq(i).removeClass('week-today');
			}
		} else {
			date_array[i] = new Date(aday.getFullYear(), aday.getMonth(), aday.getDate()-day_of_week+i);
		}
	}
	repaintDate();
}

function repaintDate() {
	$('#week-calendar-year').html(date_array[0].getFullYear() + '年');
	for (i=0; i<7; i++) {
		$('.week-day-date').eq(i).html(date_array[i].getMonth()+1 + '月' + date_array[i].getDate() + '日');
		$('#week-calendar input.hidden_date').eq(i).val(date_array[i].getFullYear() + '-' + (date_array[i].getMonth()+1) + '-' + date_array[i].getDate());
	}
}
