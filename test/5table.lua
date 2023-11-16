-- Table operations
local fruits = {"apple", "banana", "cherry"}
table.insert(fruits, "orange")
print(fruits[2])  -- banana

for k, v in pairs(fruits) do
    print(k, v)
end