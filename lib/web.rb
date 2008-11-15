$:.unshift File.dirname(__FILE__)
require 'webrb/httpserver'

module Web
  extend self
  
  OPTIONS = {
    :port            => 3000,
    :ip              => "0.0.0.0",
    :server_root     => File.expand_path(File.dirname(__FILE__)),
  }
  
  def start(urls, options = OPTIONS)
    routes = map_urls(urls)
    
    server = Web::HttpServer.new(routes, options)
    server.start
  end
  
  def map_urls(urls)
    routes = {}
    urls.each do |path, controller| 
      routes[path] = instance_eval(controller.capitalize) 
    end
    routes
  end
end