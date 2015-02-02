require 'httparty'
require 'hashie'
require 'time'
  
class Array
  def self.wrap(object)
    if object.nil?
      []
    elsif object.respond_to?(:to_ary)
      object.to_ary || [object]
    else
      [object]
    end
  end
end

module PIT
  class Busomatic
    include HTTParty
    base_uri 'http://realtime.portauthority.org/bustime/api/v2/'
    format :xml
    @@key = nil
    
    def self.time(options={})
      options.merge!({
        :key => @@key
      })
      response = get("/gettime", :query => options)['bustime_response']
      check_for_errors response['error']

      Time.parse response['tm']
    end
    
    def self.vehicles(options={})
      options.merge!({
        :key => @@key
      })
      options[:vid] = options[:vid].join(',') if options[:vid].kind_of?(Array)
      options[:rt] = options[:rt].join(',') if options[:rt].kind_of?(Array)

      response = get("/getvehicles", :query => options)['bustime_response']
      check_for_errors response['error']

      results = Array.wrap response['vehicle']
      results.map { |result| Hashie::Mash.new result } unless results.nil?
    end
    
    def self.routes(options={})
      options.merge!({
        :key => @@key
      })
      response = get("/getroutes", :query => options)['bustime_response']
      check_for_errors response['error']

      results = Array.wrap response['route']
      Hash[ results.map { |result| [result['rt'], result['rtnm']] } ] unless results.nil?
    end

    def self.directions(options={})
      options.merge!({
        :key => @@key
      })
      response = get("/getdirections", :query => options)['bustime_response']
      check_for_errors response['error']

      results = Array.wrap response['dir']
      results.map { |direction| direction.split(/ /)[0] } unless results.nil?
    end
    
    def self.stops(options={})
      options.merge!({
        :key => @@key
      })
      response = get("/getstops", :query => options)['bustime_response']
      check_for_errors response['error']

      results = Array.wrap response['stop']
      results.map { |result| Hashie::Mash.new result } unless results.nil?
    end
    
    def self.patterns(options={})
      options.merge!({
        :key => @@key
      })
      options[:pid] = options[:pid].join(',') if options[:pid].kind_of?(Array)

      response = get("/getpatterns", :query => options)['bustime_response']
      check_for_errors response['error']

      results = Array.wrap response['ptr']
      results.map { |result| Hashie::Mash.new result } unless results.nil?
    end
    
    def self.predictions(options={})
      options.merge!({
        :key => @@key
      })
      options[:stpid] = options[:stpid].join(',') if options[:stpid].kind_of?(Array)
      options[:rt] = options[:rt].join(',') if options[:rt].kind_of?(Array)
      options[:vid] = options[:vid].join(',') if options[:vid].kind_of?(Array)

      response = get("/getpredictions", :query => options)['bustime_response']
      check_for_errors response['error']

      results = Array.wrap response['prd']
      results.map { |result| Hashie::Mash.new result } unless results.nil?
    end
    
    def self.bulletins(options={})
      options.merge!({
        :key => @@key
      })
      options[:rt] = options[:rt].join(',') if options[:rt].kind_of?(Array)
      options[:stpid] = options[:stpid].join(',') if options[:stpid].kind_of?(Array)

      response = get("/getservicebulletins", :query => options)['bustime_response']
      check_for_errors response['error']

      results = Array.wrap response['sb']
      results.map { |result| Hashie::Mash.new result } unless results.nil?
    end

    def self.key=(key)
      @@key = key
    end
    
    private

    def self.check_for_errors(error)
      puts "API ERROR: #{error['msg']}" if error
    end
    
  end
end