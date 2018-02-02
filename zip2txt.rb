#!/usr/bin/env ruby

require "zip"
require "nkf"

path = ARGV[0]

Zip::File.open(path) do |zip_file|
  zip_file.each do |entry|
    case entry.name
    when /\.txt\z/
      text = entry.get_input_stream.read
      puts text.encode("UTF-8", NKF.guess(text))
    end
  end
end
