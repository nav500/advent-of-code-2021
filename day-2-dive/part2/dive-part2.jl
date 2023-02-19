function getDive()
    inputFile = open("sample-input2.txt")
    aim::Int32 = 0;
    horizontalPos::Int32 = 0  # starting horizontal position is 0
    depth::Int32 = 0  # starting depth is 0
    for line in eachline(inputFile)
        command = split(line, " ")
        if command[1] == "forward"
            horizontalPos = horizontalPos + parse(Int32, command[2])
            depth = depth + parse(Int32, command[2]) * aim
        elseif command[1] == "up"
            aim = aim - parse(Int32, command[2])
        elseif command[1] == "down"
            aim = aim + parse(Int32, command[2])
        end
    end
    return horizontalPos * depth
end

print(getDive())