def valueAt(position, cycles, previous, current)
    
    if position == cycles 
        puts previous
    else
        valueAt(position, cycles + 1, current, previous + current)
    end
    
end

valueAt(1, 1, 1, 1)
valueAt(2, 1, 1, 1)
valueAt(3, 1, 1, 1)
valueAt(4, 1, 1, 1)
valueAt(5, 1, 1, 1)
valueAt(6, 1, 1, 1)
valueAt(7, 1, 1, 1)
