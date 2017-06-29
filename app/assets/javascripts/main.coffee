loader_f = ->
  $('.long, .longpaginate .page a, .longpaginate .next a, .longpaginate .prev a, .longpaginate .last a, .longpaginate .first a').on 'click', ->
    $('#loader').modal('show')
    true
  true
@datepicker_activation = ->
  window.datepicker_activation_by_item($(document))
@datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})
  
@cb_new = ->
  $('[name = "check_box_new"]').change ->
    if $(this).is(':checked')
      $('[name = "check_box_select"]').prop("checked", false)
      if !!!$('#nested_attributes_false').data('content')
        html = $('#nested_attributes_false').html()
        $('#nested_attributes_false').data('content', html)
      $('#nested_attributes_false').empty()
      content = $(this).data('content')
      $('#new_or_select_area').html(content)
    else
      $('#new_or_select_area').empty()
      content = $('#nested_attributes_false').data('content')
      $('#nested_attributes_false').html(content)
      if !$('[name = "check_box_select"]').is(':checked')
        $('[name = "remove"][type = "checkbox"]').prop("checked", false)
        $('[name = "information[remove_medicine]"]').val('false')
      
@cb_select = ->
  $('[name = "check_box_select"]').change ->
    if $(this).is(':checked')
      $('[name = "check_box_new"]').prop("checked", false)
      content = $(this).data('content')
      $('#new_or_select_area').html(content)
      if !!!$('#nested_attributes_false').data('content')
        html = $('#nested_attributes_false').html()
        $('#nested_attributes_false').data('content', html)
      $('#nested_attributes_false').empty()
    else
      $('#new_or_select_area').empty()
      content = $('#nested_attributes_false').data('content')
      $('#nested_attributes_false').html(content)
      if !$('[name = "check_box_new"]').is(':checked')
        $('[name = "remove"][type = "checkbox"]').prop("checked", false)
        $('[name = "information[remove_medicine]"]').val('false')
      
@cb_remove = ->
  $('[name = "remove"][type = "checkbox"]').change ->
    if $(this).is(':checked')
      if (!$('[name = "check_box_select"]').is(':checked') && !$('[name = "check_box_new"]').is(':checked'))
        alert 'Предварительно необходимо создать новое или выбрать имеющееся лекарство'
        $(this).prop("checked", false)
        return false
      if (($('[name = "information[relation_count]"]')).val() > 1)
        alert 'Нельзя удалить препарат который связан с другими аптеками'
        $(this).prop("checked", false)
        return false
      $('[name = "information[remove_medicine]"]').val('true')
      if !!!$('#nested_attributes_false').data('content')
        html = $('#nested_attributes').html()
        $('#nested_attributes_false').data('content', html)
      $('#nested_attributes_false').empty()
    else
      $('[name = "information[remove_medicine]"]').val('false')
      if (!$('[name = "check_box_select"]').is(':checked') && !$('[name = "check_box_new"]').is(':checked'))
        content = $('#nested_attributes_false').data('content')
        $('#nested_attributes_false').html(content)
      
@initial = ->
  if $('[name = "check_box_select"]').is(':checked')
    window.cb_select()
  if $('[name = "check_box_new"]').is(':checked')
    window.cb_new()
  if $('[name = "remove"][type = "checkbox"]').is(':checked')
    window.cb_remove()
    
app_ready_f = ->
  loader_f()
  window.datepicker_activation()
  window.cb_new()
  window.cb_select()
  window.cb_remove()

  
$(document).ready app_ready_f
$(document).on 'page:load', app_ready_f
 