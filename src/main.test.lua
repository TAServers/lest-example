local sumMock

-- This is required to prevent breaking other test suites due to a bug in Lest (LEST-64)
beforeAll(function()
	lest.mock("src.sum")

	-- This is the same function as main.lua will import because as with normal require, the require mock caches
	-- You would need to use a factory for loadfile/dofile to use this mock in tests
	sumMock = require("src.sum")
end)

afterEach(function()
	lest.resetAllMocks()
end)

it("should call sum", function()
	-- When
	dofile("src/main.lua")

	-- Then
	expect(sumMock).toHaveBeenCalled()
end)

it("should print the value returned by sum once", function()
	-- Given
	local expected = 42
	sumMock:mockReturnValue(expected)

	-- Lest will have a helper to mock globals for the duration of a test suite in the future (LEST-63)
	local mockPrint = lest.fn():mockName("print")
	local realPrint = print
	print = mockPrint

	-- When
	dofile("src/main.lua")

	print = realPrint

	-- Then
	expect(mockPrint).toHaveBeenCalledTimes(1)
	expect(mockPrint).toHaveBeenCalledWith(expected)
end)
