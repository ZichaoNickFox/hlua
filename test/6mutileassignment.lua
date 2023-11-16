-- Multiple assignment and string manipulation
local a, b = 10, "foo"
a, b = b, a
print(a, b)  -- foo 10
print(string.upper(b))  -- FOO