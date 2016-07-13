#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new
conn.start

ch = conn.create_channel

q = ch.queue("hello")
message = "Hello world, it's me!"
ch.default_exchange.publish(message, :routing_key => q.name)
puts " [x] Sent #{message}"

conn.close
