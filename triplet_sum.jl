#=
    Given an array of integers and a target we have to check if there exists 
    a triplet such that their combined sum is equal to the given target.
=#
## Normal triple sum
function tripletSum(arr, target)
    r = length(arr)
    normCount = 0 
    for i = 1:r
        for j = (i + 1):r
            for k = (j + 1):r
                if(arr[i] + arr[j] + arr[k] == target)
                    normCount += 1
                end
            end
        end
    end
    println(normCount)
end

## Triple sum with binary search
#=
    This algorithm only produces the same results as the one above as long as 
    the array passed has unique elements only.
=#
function tripletSumWithBinarySearch(arr, target)
    r = length(arr)
    binCount = 0
    for i = 1:r
        for j = (i + 1):r
            ## Binary Search for the answer
            thirdNumberIndex = binarySearch(arr[(j + 1): end], target - (arr[i] + arr[j]))
            if thirdNumberIndex != -1
                binCount += 1
            end
        end
    end
    println(binCount)
end

## Binary search algorithm (return the found index)
function binarySearch(arr, target)
    left = 1
    right = length(arr)

    while(left <= right)
        mid = left + div((right - left), 2)
        if target > arr[mid]
            left = mid + 1
        elseif target < arr[mid]
            right = mid - 1
        else
            return mid
        end
    end
    return -1
end

## Generate a random array to be used
function generateArray(lowerbound, upperbound, arraysize)
    return rand(lowerbound:upperbound, arraysize)
end

arr = generateArray(-50, 50, 50)
target = 0

## Normal tripple loop
tripletSum(arr, target)  
## Sort the array
sort!(arr)

## Perform the operation with binary search
tripletSumWithBinarySearch(arr, target)


