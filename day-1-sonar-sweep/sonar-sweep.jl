function getSonarSweep()
    inputFile = open("sample-input2.txt")
    prevValue = parse(Int16, readline(inputFile))
    incCounter = 0
    for line in eachline(inputFile)
        currentValue::Int16 = parse(Int16, line)
        if currentValue > prevValue
            incCounter = incCounter+1
        end
        prevValue = currentValue
    end
    return incCounter
end

print(getSonarSweep())