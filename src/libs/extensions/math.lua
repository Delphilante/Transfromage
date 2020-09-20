-- Optimization --
local math_ceil = math.ceil
local math_floor = math.floor
------------------

--[[@
	@name math.normalizePoint
	@desc Normalizes a Transformice coordinate point value.
	@param n<number> The coordinate point value.
	@returns int The normalized coordinate point value.
]]
math.normalizePoint = function(n)
	n = n * (8 / 27)
	return (n > 0 and math_floor(n) or n < 0 and math_ceil(n) or n)
end