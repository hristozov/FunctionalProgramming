productOfDigits :: Int -> Int
productOfDigits number
    | number < 10 = number
    | otherwise = (mod number 10) * (productOfDigits (div number 10))
