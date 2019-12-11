require_relative './protos/api_pb'
require_relative './protos/api_services_pb.rb'

module Client
  class Client
    def initialize(clients)
      @clients = clients
    end
    
    def login(userid, password)
      req = Api::LoginRequest.new(userid, password)
      stub = clients[0].login(req)
    end
  end
end

puts Api::LoginRequest.new(:userid => 'user', :password => 'pass')
puts Client::Client.new(Api::Dgraph::Stub.new('localhost', '9080')).login