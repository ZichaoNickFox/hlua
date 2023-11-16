-- Complex nested structures
local complex = {
    number = 42,
    str = "hello",
    nested = {
        anotherNumber = 10,
        anotherStr = "world",
    }
}

print(complex.nested.anotherStr)  -- world