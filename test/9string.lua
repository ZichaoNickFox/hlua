local a1 = "double quotes string"
local b1 = "'"
local c1 = "\""
local d1 = "'d1'"
local e1 = "\"e1\""
local f1 = "\'f1\'"
local g1 = "\\"
local h1 = {["\\"]="h1"}

local a2 = 'single quotes string'
local b2 = '\''
local c2 = '"'
local d2 = '"d2"'
local e2 = '\"e2\"'
local f2 = '\'f2\''
local g2 = '\\'
local h2 = {['\\']='h2'}

local a3 = [[long string]]
local b3 = [[']]
local c3 = [["]]
local d3 = [["d3"]]
local e3 = [["e3"]]
local f3 = [['f3']]
local g3 = [[\]]
local h3 = {[ [[\]]]=[[h3]]}
local i3 = [["'\n]]