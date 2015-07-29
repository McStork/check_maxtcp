#!/usr/bin/env ruby

=begin
    You might want to raise ulimit : ulimit -n XXXXX
=end

require 'socket'

host = ARGV[0]
port = ARGV[1]
n = 65535
delay = 100 # max opened TCPSocket per sec

idle_time = 90
sockets = []

puts "Usage : check_maxtcp.rb <host> <port>"

n.times do |n|
    begin
        socket = TCPSocket.new(host,port)
        sockets<<socket
        if n%100 == 0
            puts n.to_s + " sockets created."
        end

        sleep(1/delay)
    rescue Exception => e
        puts "Unable to connect. Stopped at attempt number " + n.to_s
        puts e
        break
    end
end

puts sockets.size().to_s + " sockets created."

#remove quotes to DOS for a period of time
#puts "Going to sleep for " + sleep.to_s + " seconds."
#sleep(idle_time)

sockets.each do |socket|
    socket.close
end

puts "Sockets are now closed
