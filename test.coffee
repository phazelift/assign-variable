assign = require './assign-variable.min.js'


message = {}
assign.onWarn (msg) -> message = msg


test = ->
	result = false

	if assign() isnt undefined
		return 'should return undefined when no arguments are given'

	if (assign '', undefined) isnt ''
		return 'should ignore alt value because it is undefined'

	if (assign '', '?') isnt ''
		return 'should ignore alt value because it is of same type'

	if (assign '', 0) isnt 0
		return "should return the alt type when values' type doesn't match alts' type"

	assign '', 0, 'test'
	if message.text isnt 'type mismatch encountered, returning alt: 0'
		return "should return a correct message events 'text' warning message"
	if message.id isnt 'test'
		return "should return a correct message events 'id' warning message"

	return 'all tests completed successfully'


console.log test()

