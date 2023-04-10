return function(a, b)
	if type(a) ~= "number" or type(b) ~= "number" then
		error("Inputs must be numbers")
	end

	return a + b
end
