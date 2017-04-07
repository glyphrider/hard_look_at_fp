square_list :: (Num a) => [a] -> [a]
square_list [] = []
square_list (x:xs) = (x*x):(square_list xs)

square :: (Num a) => a -> a
square x = x * x

do_list :: (a -> b) -> [a] -> [b]
do_list _ [] = []
do_list f (x:xs) = f x : do_list f xs

-- use list comprehension

square_list_c :: (Num a) => [a] -> [a]
square_list_c xs = [ x*x | x<-xs ]

do_list_c :: (a -> b) -> [a] -> [b]
do_list_c f xs = [ f x | x <- xs]
