reverseList :: [a] -> [a]
reverseList [] = []
reverseList (h:t) = reverseList t ++ [h]

colorCombo :: [String] -> [(String, String)]
colorCombo colors = [(a, b) | a <- colors, b <- colors, a < b]

multiplication :: [(Integer, Integer, Integer)]
multiplication  = [(a, b, a * b) | a <- [1..12], b <- [1..12]]

mapColoring :: [String] -> [(String, String, String, String, String)]
mapColoring colors = [(tennessee, mississippi, alabama, georgia, florida) | tennessee <-colors, mississippi<-colors, alabama<-colors, georgia<-colors, florida<-colors, tennessee /= mississippi, tennessee /= alabama, tennessee /= georgia, mississippi /= alabama, alabama /= georgia,alabama /= florida, georgia /= florida  ]