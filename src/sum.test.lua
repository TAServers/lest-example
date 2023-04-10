local sum = require("src.sum")

test.each({ { 1, 2, 3 }, { 1, -1, 0 }, { math.huge, math.huge, math.huge } })(
	"should return the sum of %s and %s",
	function(a, b, expected)
		-- When
		local result = sum(a, b)

		-- Then
		expect(result).toBe(expected)
	end
)

it("should throw an error when the first argument is not a number", function()
	-- Given
	local shouldThrow = function()
		sum("1", 2)
	end

	-- Then
	expect(shouldThrow).toThrow("Inputs must be numbers")
end)

it("should throw an error when the second argument is not a number", function()
	-- Given
	local shouldThrow = function()
		sum(1, "2")
	end

	-- Then
	expect(shouldThrow).toThrow("Inputs must be numbers")
end)
