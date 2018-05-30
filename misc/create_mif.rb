#! /usr/bin/env ruby

require 'optparse'
require 'pp'

options = {}
OptionParser.new do |opts| 
    opts.banner = "Usage: create_mif.rb [options]"
    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v| 
        options[:verbose] = v
    end

    opts.on("-c", "--coe", "Create Xilinx .coe file instead .mif") do |c|
        options[:coe] = c
    end

    opts.on("-dDEPTH", "--depth=DEPTH", Integer, "Memory depth") do |d|
        options[:depth] = d
    end

    opts.on("-wWIDTH", "--width=WIDTH", Integer, "Memory width") do |w|
        options[:width] = w
    end

end.parse!


bin = File.open(ARGV[0], "rb").read
bytes = bin.unpack("C*")

depth = options[:depth] || bytes.size
width = options[:width] || 8
coe   = options[:coe]   || false
bytes_per_word = (width+7)>>3
nr_addr_bits = Math.log2(depth).ceil

if options[:verbose]
    STDERR.puts "depth         : #{depth}"
    STDERR.puts "width         : #{width}"
    STDERR.puts "bytes per word: #{bytes_per_word}"
    STDERR.puts "output format : %s" % [ coe ? "coe" : "mif" ]
end

if !coe
    puts %{
-- Created by create_mif.rb
DEPTH         = #{depth};
WIDTH         = #{width};
ADDRESS_RADIX = HEX;
DATA_RADIX    = HEX;
CONTENT
BEGIN
    }
    
    addr_fmt_string = "%%0%dx" % ((nr_addr_bits+3)>>2)
    data_fmt_string = "%%0%dx" % (bytes_per_word * 2)
    
    fmt_string = "#{addr_fmt_string}: #{data_fmt_string};"
    
    words = bytes.each_slice(bytes_per_word)
    words.each_with_index do |w, addr|
        value = 0
        w.reverse.collect { |b| value = value * 256 + b }
        puts fmt_string % [addr, value]
    end
    
    if words.size < depth
        puts "[#{addr_fmt_string}..#{addr_fmt_string}]: #{data_fmt_string};" % [ words.size, depth-1, 0 ]
    end
    
    puts "END;"
    puts
else
    puts %{
; Created by create_mif.rb
; block memory configuration:
; DEPTH         = #{depth};
; WIDTH         = #{width};
memory_initialization_radix=16;
memory_initialization_vector=}
    
    words = bytes.each_slice(bytes_per_word).collect do |w|
        value = 0
        w.reverse.collect { |b| value = value * 256 + b }
        value
    end

    (depth - words.size).times { words << 0 }
    data_fmt_string = "%%0%dx" % (bytes_per_word * 2)
    str = words.collect{ |w| data_fmt_string % w }.join(",\n") + ";"
    
    puts str
end
