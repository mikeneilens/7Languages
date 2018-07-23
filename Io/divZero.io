oldDivide := Number getSlot("/")
Number / := method(d, if( d == 0, 0, self oldDivide (d) ))


"10 divided by 3 =  #{10/3}" interpolate println
"10 divided by zero = #{10/0}" interpolate println