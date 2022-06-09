{ assert }	= require 'chai'
assign = require '../assign-variable.js'


validator	= null
warn			= null


assign.onWarn (msg) -> warn = msg

beforeEach ->
	warn = null



describe 'assign tests', ->

	it 'should return undefined when no arguments are given', ->
		assert.equal assign(), undefined


	it 'should ignore alt value because it is undefined', ->
		assert.equal assign('', undefined), ''


	it 'should ignore alt value because it is of same type', ->
		assert.equal assign('', '?'), ''


	it "should return the alt type when values' type doesn't match alts' type", ->
		assert.equal assign('', 0), 0


	it "should generate correct warninging message", ->
		assign undefined, 0, 'test'
		assert.deepEqual warn,
			sender: "assign-variable"
			text: "type mismatch"
			id: "test"
			type: "warn"
			value: undefined

	it "should generate correct warninging message", ->
		assign '0', 0, 'test'
		assert.deepEqual warn,
			sender: "assign-variable"
			text: "type mismatch"
			id: "test"
			type: "warn"
			value: '0'

