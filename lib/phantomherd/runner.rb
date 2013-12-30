require "em-synchrony"
require "em-synchrony/fiber_iterator"

module Phantomherd
  class Runner

    attr_reader :sample_count, :concurrency, :casper_script
    attr_accessor :results

    def initialize(options)
      @sample_count = options[:sample_count]
      @concurrency = options[:concurrency]
      @casper_script = options[:casper_script]
      @results = []
    end

    def run
      requests = (1..sample_count.to_i).to_a
      EM.synchrony do
        EM::Synchrony::FiberIterator.new(requests, concurrency).each do |request|
          stime = Time.now
          out, status = EM::Synchrony.system("casperjs --ignore-ssl-errors=yes #{casper_script}")
          print "."
          @results << Time.now - stime
        end
        print "\n"
        EventMachine.stop
      end
      print_results
    end

    private

    def print_results
      avg = @results.inject{ |sum, el| sum + el}.to_f / @results.size
      puts "=" * 80
      puts "phantomherd: #{casper_script} (#{sample_count} samples, #{concurrency} concurrent)"
      puts "=" * 80
      puts "Average: #{avg.round(3)} sec"
      puts "Min: #{@results.min.round(3)} sec"
      puts "Max: #{@results.max.round(3)} sec"
      puts "=" * 80
      puts "\nRaw results: \n#{@results.join(",")}"
    end

  end
end
