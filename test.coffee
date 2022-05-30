assign = require './assign-variable.min.js'


message = {}
assign.onWarning (msg) -> message = msg


test = ->
	result = false

	if assign() isnt undefined
		return 'should return undefined when no arguments are passed'

	if (assign '', '?') isnt ''
		return 'should ignore alt value because it is of same type'

	if (assign '', 0) isnt 0
		return 'should return the alt type when values\' type doesnt match alts\' type'

	assign '', 0, 'test'
	if message.text isnt 'type of value is not equal to type of alt, returning alt'
		return 'should return a correct message events text warning message'
	if message.id isnt 'test'
		return 'should return a correct message events id warning message'

	return 'all tests completed successfully'


console.log test()
