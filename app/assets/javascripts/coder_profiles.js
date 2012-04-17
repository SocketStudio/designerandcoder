
$(document).ready(function() {

	$('.designer_icon').css({ opacity: 0 });

		$(".coder_profile").hover(
  function () {
    $(this).find('.designer_icon').animate({opacity: 1}, 100);
  },
  function () {
    $(this).find('.designer_icon').animate({opacity: 0},100);
  }
);
});




