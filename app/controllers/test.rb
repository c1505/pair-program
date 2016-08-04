def toList(total, subset)
    count = 0
    total.include?(subset[0])
    index_at_start = total.index(subset[0])
    remaining = total.slice(index_at_start..-1)
    
    if remaining.include?(subset[1])
        matching = subset.chars.find_all {|f| f == subset[1]}
        count = count + matching.count
        puts matching
    end
    count
    # total.include?(subset[1])
end

puts toList("abababbbbb", "ab")