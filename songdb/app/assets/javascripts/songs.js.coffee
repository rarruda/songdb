# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`
$(document).ready(function(){
	$(".remove-verse").click(function(){
	  $('input[type=hidden]._destroy').val("1");
	  $(this).parent().hide();
	  event.preventDefault();
	});

	$('#verses').sortable({
	  items:'.sortable',
	  revert: 40,
	  //handle: '.handle',
	  //cursor: 'move',
	  cursor: 'crosshair',
	  opacity: 0.6,
	  stop: function () {
	    var inputs = $('input[type=hidden].position');
	    $('input.position').each(function(idx) {
	      $(this).val(idx + 1);
	    });
	  }
	});


});
`
