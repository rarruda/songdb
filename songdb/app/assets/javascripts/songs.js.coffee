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


jQuery ($) ->
  $(document).ready ->
    nestedForm = $('.duplicatable_nested_form').last().clone()

    $('.duplicate_nested_form').click (e) ->
        e.preventDefault()

        lastNestedForm = $('.duplicatable_nested_form').last()
        newNestedForm  = $(nestedForm).clone()
        formsOnPage    = $('.duplicatable_nested_form').length

        $(newNestedForm).find('label').each ->
          oldLabel = $(this).attr 'for'
          newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
          $(this).attr 'for', newLabel

        $(newNestedForm).find('select, input, textarea').each ->
          oldId = $(this).attr 'id'
          newId = oldId.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
          $(this).attr 'id', newId

          oldName = $(this).attr 'name'
          newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[#{formsOnPage}]")
          $(this).attr 'name', newName

        $( newNestedForm ).insertAfter( lastNestedForm )



