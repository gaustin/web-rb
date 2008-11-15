require 'rubygems'
require 'mongrel'

module Web
  class HttpHandler < Mongrel::HttpHandler
    def initialize(controller)
      @controller = controller
    end
    
    def process(request, response)
      response.start do |head,out|
        head["Content-Type"] = "text/html"
        results = "<html><body>Yo! Your request:<br /><pre>#{request.params.to_yaml}</pre><a href=\"/files\">View the files.</a>#{@controller.get}</body></html>"
        out << results
      end
    end
  end
  
  class HttpServer
    def initialize(routes, options)
      @options = options
      @routes = routes
    end
    
    def start
      @http_server = Mongrel::HttpServer.new("0.0.0.0", "3000")
      
      @routes.each do |path, controller|
        @http_server.register(path, Web::HttpHandler.new(controller.new))
      end
      
      @http_server.run.join
    end
  end
end