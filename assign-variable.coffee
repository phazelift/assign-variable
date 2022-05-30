#
# assign a dynamically type checked value using an optional alternative value
#
# MIT License
#
# Copyright (c) 2022 Dennis Raymondo van der Sluis
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

types				= require 'types.js'
MessageEvents	= require 'message-events'


message = new MessageEvents 'warn', (id, text...) ->
	sender	: 'assign-var'
	type		: 'warn'
	id			: id
	text		: text.join ' '


#	value can be of any type
#	alt can be of any type
#	id should be of type string, preferable the identifier of the variable being set by this function
assign = ( value, alt, id ) ->
	if types.notUndefined(alt) and (( types.typeof value ) isnt ( types.typeof alt ))
		message.warn types.forceString(id), 'type of value is not equal to type of alt, returning alt'
		return alt
	return value


assign.onWarning = (handler) -> message.on 'warn', handler


module.exports = assign
