// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_self

$(document).ready(function() {


		$(".profile").hover(
  function () {
  	var $bar=$(this).find('.bar');
  	var $progress=$(this).find('.progress');
    $(this).find('.current_user_icon').animate({opacity: 1}, 100,function(){

    	$progress.animate({opacity: 0.5},300,function(){
	    		$bar.each(function(){
	    		
	    			$(this).animate({height: $(this).data("ratio")*100},500);

	    		});
    	});
    	 
    });
   
   
  },
  function () {
  	var $current_user_icon=$(this).find('.current_user_icon');
  	var $progress=$(this).find('.progress');
    $(this).find('.bar').animate({height: 0},200,function(){
    	$progress.animate({opacity: 0},100);
    	$current_user_icon.animate({opacity: 0},100);
    });
  });
});