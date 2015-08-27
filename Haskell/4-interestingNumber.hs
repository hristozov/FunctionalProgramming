d :: Int -> Int
d number = d' 0 (number - 1) number
    where
        d' currentSum current number
            | current == 0 = currentSum
            | mod number current == 0 = d' (currentSum + current) (current - 1) number
            | otherwise = d' currentSum (current - 1) number

interestingNumber :: Int -> Bool
interestingNumber number = number == d (d number) 