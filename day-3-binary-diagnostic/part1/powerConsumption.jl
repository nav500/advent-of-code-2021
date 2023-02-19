function binaryToDecimal(code)
    codeLength = length(code)
    exponent = codeLength - 1
    decimalValue = 0
    for bit in code
        decimalValue = decimalValue + (bit * (2 ^ exponent))
        exponent = exponent - 1
    end
    return decimalValue
end

function powerConsumption()
    inputFile = open("sample-input2.txt")
    arrayOfBinaryCodes = Array{Array{Int32}}(undef, 0)
    gammaRateCode = Array{Int32}(undef, 0)
    epsilonRateCode = Array{Int32}(undef, 0)
    for line in eachline(inputFile)
        temp = Array{Int32}(undef, 0)
        for bit in line
            push!(temp, parse(Int32, bit))
        end
        push!(arrayOfBinaryCodes, temp)
    end
    arrayOfBinaryCodesLength = length(arrayOfBinaryCodes)
    if (arrayOfBinaryCodesLength > 0)
        binaryCodesLength = length(arrayOfBinaryCodes[1])
    end
    for i = 1:binaryCodesLength
        countOne = 0
        countZero = 0
        for j = 1:arrayOfBinaryCodesLength
            if (arrayOfBinaryCodes[j][i] == 0)
                countZero = countZero+1
            else
                countOne = countOne+1
            end
        end
        if (countZero > countOne)
            push!(gammaRateCode, 0)
            push!(epsilonRateCode, 1)
        else
            push!(gammaRateCode, 1)
            push!(epsilonRateCode, 0)
        end
    end
    gammaRate = binaryToDecimal(gammaRateCode)
    epsilonRate = binaryToDecimal(epsilonRateCode)
    return gammaRate * epsilonRate
end
        
print(powerConsumption())