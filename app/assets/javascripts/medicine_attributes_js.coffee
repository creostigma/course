@medicine_attributes = ->
  $('.list-group-item').on 'click', ->
    if (!$(this).hasClass('active'))
      $('#active_list').remove()
      $('.active').removeClass('active')
      content = $(this).data('content')
      $(this).after(content)
      $(this).addClass('active')
    else
      $('#active_list').remove()
      $('.active').removeClass('active')
  false

app_ready_f = ->
  window.medicine_attributes()

$(document).ready app_ready_f
$(document).on 'page:load', app_ready_f