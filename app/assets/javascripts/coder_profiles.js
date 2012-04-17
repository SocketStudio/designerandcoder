
$(document).ready(function() {

	$('.designer_icon').css({ opacity: 0 });

		$(".coder_profile").hover(
  function () {
    $('.designer_icon').animate({opacity: 1});
  },
  function () {
    $('.designer_icon').animate({opacity: 0});
  }
);
});




