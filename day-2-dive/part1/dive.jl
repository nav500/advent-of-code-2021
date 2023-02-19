function getDive()
    inputFile = open("sample-input2.txt")
    horizontalPos = 0  # starting horizontal position is 0
    depth = 0  # starting depth is 0
    for line in eachline(inputFile)
        command = split(line, " ")
        if command[1] == "forward"
            horizontalPos = horizontalPos + parse(Int16, command[2])
        elseif command[1] == "up"
            depth = depth - parse(Int16, command[2])
        elseif command[1] == "down"
            depth = depth + parse(Int16, command[2])
        end
    end
    return horizontalPos * depth
end

print(getDive())