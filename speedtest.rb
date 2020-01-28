#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'English'

st = IO.popen('/usr/local/bin/speedtest -f json', &:read)
raise 'Failed to run speedtest' unless $CHILD_STATUS.success?

st_json = JSON.parse(st)
down = st_json['download']['bandwidth']
up = st_json['upload']['bandwidth']
latency = st_json['ping']['latency']
down = (down.to_i / 125_000).round(2)
up = (up.to_i / 125_000).round(2)
result = ''
result += "Download: #{down} Mbps\n"
result += "Upload: #{up} Mbps\n"
result += "Latency: #{latency} ms"
puts result
