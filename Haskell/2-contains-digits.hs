containsOneDigit :: Int -> Int -> Bool
containsOneDigit 0 digit = digit == 0 || False
containsOneDigit number digit = (mod number 10 == digit) || containsOneDigit (div number 10) digit 

containsDigits :: Int -> Int -> Bool
containsDigits number 0 = True
containsDigits number number2 = containsOneDigit number (mod number2 10) && containsDigits number (div number2 10)
