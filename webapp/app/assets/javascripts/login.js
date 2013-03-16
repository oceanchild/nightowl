$(document).ready(function() {

/* ================================================
// LOGIN PAGE :: Position div class 'form-step' //
// =============================================
*/
var top_margin = $(window).height()/2 - $('.float-box-wrapper').height()/2;
$('.float-box-wrapper').css('margin-top', top_margin);
$(window).resize(function() {
	top_margin = $(window).height()/2 - $('.float-box-wrapper').height()/2;
	$('.float-box-wrapper').css('margin-top', top_margin);
});
$('input.input-text').focus(function() {
	if ($(this).val() === this.defaultValue) {
		$(this).val('');
	}
});
$('input.input-text').blur(function() {
	if (!$(this).val()) {
		$(this).val(this.defaultValue);
	}
});
$('.float-box .button.replace').click(function() {
	$('.float-box #login').css('display', 'none');
	$('.float-box #register').css('display', 'block');
});

});
