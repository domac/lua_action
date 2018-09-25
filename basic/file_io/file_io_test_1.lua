file = io.input("./test.txt")

repeat
    line = io.read()
    if nil == line then
        break
    end

    print(line)

until (false)

io.close(file)