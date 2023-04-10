it("should print the sum of 1 and 2", function()
	-- Given

	-- Lest will have a helper to mock globals for the duration of a test suite in the future (LEST-63)
	local mockPrint = lest.fn():mockName("print")
	local realPrint = print
	print = mockPrint

	-- When
	dofile("src/main.lua")

	print = realPrint

	-- Then
	expect(mockPrint).toHaveBeenCalledWith(3)
end)
