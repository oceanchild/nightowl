var MultiSteps = {}; // Exposes the forward() method publicly so finch tests can grab it

$(function() {

  var currentStepIdx = 0;
  /* defined on instance basis */
  //var stepClasses = ["step-one", "step-two", "step-three"];
  var animating = false;
  var resizing = false;
  var resizeTimer = null;
  var subscriptionRequestPending = false;
  var placesRequestPending = false;
  // enable background shifting var
  var bgOffset = 0;

  $(".step-one .button.continue").click(function(e) {
    forward();
  });
  $(".step-two .button.continue").click(function(e) {
    forward();
  });

  $(window).resize(function() {
    resizing = true;
    if (resizeTimer !== null) {
      window.clearTimeout(resizeTimer);
    }
    resizeTimer = window.setTimeout(pageRedraw, 200);
  });

  animateSteps(false);

  function forward() {
    if (!animating) {
      animating = true;
      currentStepIdx++;
      animateSteps(1000);

		// enable background shifting
		if (true) {
			bgOffset-=200
			$("body").animate({ backgroundPosition: bgOffset + 'px 0' }, { duration: 1000, complete: false });
		}
    }
  }

  function getSteps() {
    var oldStep = (currentStepIdx == (stepClasses.length - 1)) ? stepClasses[0] : null;
    var currentStep = stepClasses[currentStepIdx];
    var prevStep = (currentStepIdx > 0) ? stepClasses[currentStepIdx - 1] : null;
    var nextStep = (currentStepIdx < (stepClasses.length - 1)) ? stepClasses[currentStepIdx + 1] : null;
    var superStep = (currentStepIdx == 0) ? stepClasses[stepClasses.length - 1] : null;
    return { old: oldStep, curr: currentStep, prev: prevStep, next: nextStep, supr: superStep };
  }

  function pageRedraw() {
    resizing = false;
    animateSteps(300);
  }

  function animateSteps(speed) {
    var pos = calculatePositions();
    var steps = getSteps();
    var animCallback = function() { };
    var animSpeed = speed;

    if (!speed) {
      animSpeed = 1;
      animCallback = function() {
        animating = false;
      };
    } else {
      animCallback = function() {
        //$("." + steps.curr + " input:first").focus();
      };
    }

    $("." + steps.old).animate({ left: pos.offLeft + "px", opacity: 0.3 }, animSpeed);
    $("." + steps.prev).animate({ left: pos.left + "px", opacity: 0.3 }, animSpeed);
    $("." + steps.curr).animate({ left: pos.center + "px", opacity: 0.8 }, { duration: animSpeed, complete: animCallback });
    $("." + steps.next).animate({ left: pos.right + "px", opacity: 0.3 }, animSpeed);
    $("." + steps.supr).animate({ left: pos.offRight + "px", opacity: 0.3 }, animSpeed);

    if (speed) { animating = false; }
  }

  function clearAnimateFlag() {
    animating = false;
  }

  function calculatePositions() {
    var offset = 20;
    var step_width = $(".form-step").width() / 2;
    var window_width = $(window).width();

    var offLeft = -3 * step_width;
    var leftPos = offset - step_width;
    var centerPos = window_width / 2;
    var rightPos = window_width - offset + step_width;
    var offRight = rightPos + (3 * step_width);
    return { offLeft: offLeft, left: leftPos, center: centerPos, right: rightPos, offRight: offRight };
  }
});
