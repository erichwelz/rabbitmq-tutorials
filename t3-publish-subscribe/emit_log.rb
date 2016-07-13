#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new
conn.start

channel  = conn.create_channel
exchange   = channel.fanout("logs")

message = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

exchange.publish(message)
puts " [x] Sent #{message}"

conn.close
