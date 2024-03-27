class RateLimiter
  RATE_LIMIT = 10.seconds
  RATE_LIMIT_MESSAGE = { code: 429, message: 'Too many requests. Please try again later.' }.to_json

  def initialize(app)
    @app = app
    @request_counts = {}
  end

  def call(env)
    request = Rack::Request.new(env)

    if request.path.start_with?('/api')
      ip_address = request.ip

      @request_counts[ip_address] ||= { count: 0, last_request_at: nil }

      if @request_counts[ip_address][:last_request_at] &&
          @request_counts[ip_address][:last_request_at] > Time.now - RATE_LIMIT
        @request_counts[ip_address][:count] += 1
      else
        @request_counts[ip_address][:count] = 1
        @request_counts[ip_address][:last_request_at] = Time.now
      end

      if @request_counts[ip_address][:count] > 1
        return [429, { 'Content-Type' => 'application/json' }, [RATE_LIMIT_MESSAGE]]
      end
    end

    @app.call(env)
  end
end
