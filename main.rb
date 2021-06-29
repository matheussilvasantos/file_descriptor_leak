require "eventmachine"
require "elastic_apm"

puts "Starting..."

ElasticAPM.start

EM.run do
  Signal.trap("INT") do
    EM.add_timer(0) do
      puts "Stopping..."

      ElasticAPM.stop
      EM.stop

      puts "Stopped"
    end
  end

  EM.add_periodic_timer(1) do
    puts "GET /status"

    ElasticAPM.start_transaction("GET /status")
    sleep 1
    ElasticAPM.end_transaction
  end
end
