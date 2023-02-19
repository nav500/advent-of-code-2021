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

function getOxygenSupportRating(arrayOfBinaryCodes)
    arrayOfBinaryCodesLength = length(arrayOfBinaryCodes)
    if (arrayOfBinaryCodesLength > 0)
        binaryCodesLength = length(arrayOfBinaryCodes[1])
    end
    
    for j = 1:binaryCodesLength
        arrayOfBinaryCodesLength = length(arrayOfBinaryCodes)
        if arrayOfBinaryCodesLength == 1
            break
        end
        codesWithOneBit = Array{Array{Int32}}(undef, 0)   # contains codes with bit 1 on jth position
        codesWithZeroBit = Array{Array{Int32}}(undef, 0)   # contains codes with bit 0 on jth position
        countBitOne = 0
        countBitZero = 0
        for i = 1:arrayOfBinaryCodesLength
            if arrayOfBinaryCodes[i][j] == 1
                countBitOne = countBitOne + 1
                push!(codesWithOneBit, arrayOfBinaryCodes[i])
            else
                countBitZero = countBitZero + 1
                push!(codesWithZeroBit, arrayOfBinaryCodes[i])
            end
        end
        if countBitOne >= countBitZero
            arrayOfBinaryCodes = codesWithOneBit
        else
            arrayOfBinaryCodes = codesWithZeroBit
        end
    end
    return binaryToDecimal(arrayOfBinaryCodes[1])
end

function getCo2ScrubberRating(arrayOfBinaryCodes)
    arrayOfBinaryCodesLength = length(arrayOfBinaryCodes)
    if (arrayOfBinaryCodesLength > 0)
        binaryCodesLength = length(arrayOfBinaryCodes[1])
    end
    
    for j = 1:binaryCodesLength
        arrayOfBinaryCodesLength = length(arrayOfBinaryCodes)
        if arrayOfBinaryCodesLength == 1
            break
        end
        codesWithOneBit = Array{Array{Int32}}(undef, 0)   # contains codes with bit 1 on jth position
        codesWithZeroBit = Array{Array{Int32}}(undef, 0)   # contains codes with bit 0 on jth position
        countBitOne = 0
        countBitZero = 0
        for i = 1:arrayOfBinaryCodesLength
            if arrayOfBinaryCodes[i][j] == 1
                countBitOne = countBitOne + 1
                push!(codesWithOneBit, arrayOfBinaryCodes[i])
            else
                countBitZero = countBitZero + 1
                push!(codesWithZeroBit, arrayOfBinaryCodes[i])
            end
        end
        if countBitOne < countBitZero
            arrayOfBinaryCodes = codesWithOneBit
        else
            arrayOfBinaryCodes = codesWithZeroBit
        end
    end
    return binaryToDecimal(arrayOfBinaryCodes[1])
end

function getLifeSupportRating()
    inputFile = open("sample-input2.txt")
    arrayOfBinaryCodes = Array{Array{Int32}}(undef, 0)
    for line in eachline(inputFile)
        temp = Array{Int32}(undef, 0)
        for bit in line
            push!(temp, parse(Int32, bit))
        end
        push!(arrayOfBinaryCodes, temp)
    end

    return getOxygenSupportRating(deepcopy(arrayOfBinaryCodes)) * getCo2ScrubberRating(deepcopy(arrayOfBinaryCodes))
end

println(getLifeSupportRating())