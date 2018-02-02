#!/usr/bin/env ruby

require "terminfo"
@term_width = TermInfo.screen_size[1]

def show
  print "\r"
  print @chars.join.strip
  sleep 0.5 + 0.1 * @chars.size
  print "\r"
  print " " * @term_width
end

while line = ARGF.gets
  @chars = []
  line.each_char do |char|
    @chars << char
    if @chars.inject(0) {|sum, c| sum + (c.ascii_only? ? 1 : 2) } >= @term_width - 1
      show
      @chars = []
    end
  end
  show
end

print "\r"
