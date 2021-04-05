console.log 'Inside portfolios coffeescript'

ready = undefined

ready = ->
	$('.sortably').sortable()
	return

$(document).ready ready