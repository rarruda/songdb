# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`
$(document).ready(function(){
	$(".remove-verse").click(function(){
	  $(this).prev("input[type=hidden]").val("1");
	  $(this).parent().hide();
	  event.preventDefault();
	});
});
`

`
$(document).ready(function() {
  $('#verses').sortable({
    items:'.sortable',
    //axis:'y',
    //handle: '.handle',
    //cursor: 'move',
  });
});
`
