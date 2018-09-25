file = io.open("./test.txt","r")

for line in file:lines() do
    print(line)
end

file:close()