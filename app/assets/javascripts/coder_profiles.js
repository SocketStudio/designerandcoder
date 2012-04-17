
$(document).ready(function() {

	$('.designer_icon').css({ opacity: 0 });

		$(".coder_profile").hover(
  function () {
    $(this).animate({opacity: 0}, 100);
  },
  function () {
    $(this).animate({opacity: 1},100);
  }
);
});




