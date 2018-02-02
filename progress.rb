10.times do
  10.times do |i|
    print "\r"
    print i.to_s * i
    sleep 0.1
    print "\r"
    print " " * i
  end
end

puts
