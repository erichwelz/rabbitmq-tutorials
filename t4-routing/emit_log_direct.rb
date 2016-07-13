#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new
conn.start

channel    = conn.create_channel
exchange   = channel.direct("direct_logs")
severity   = ARGV.shift || "info"
message    = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

exchange.publish(message, routing_key: severity)
puts " [x] Sent #{message}"

conn.close