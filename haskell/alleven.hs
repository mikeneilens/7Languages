alleven :: [Integer] -> [Integer]
alleven [] = []
alleven (h:t) = if even h then h:alleven t else alleven t