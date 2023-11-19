-- Error handling
local function mightFail()
    error("Something went wrong")
end

local status, err = pcall(mightFail)
if not status then
    print("Caught an error: " .. err)
end