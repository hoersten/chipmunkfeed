# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.AutoComplete =
  init: ->
    $('#search_text').autocomplete({
      source: '/search/autocomplete'
      minLength: 2
      select: (event, ui) ->
        if (ui.item)
          $('#search_text').val(ui.item.value);
          $('#auto_select').val(true);
          $('#search_form').submit();
    })

jQuery ->
  if ($('#search_text').length > 0)
    window.AutoComplete.init()
