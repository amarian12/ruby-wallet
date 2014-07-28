class Coind::API
  attr_reader :options
  attr_reader :params

  def user; options[:user]; end
  def pass; options[:pass]; end
  def host; options[:host]; end
  def port; options[:port]; end
  def ssl;  options[:ssl];  end
  def ssl?; options[:ssl];  end
  def user=(a); options[:user] = a; end
  def pass=(a); options[:pass] = a; end
  def host=(a); options[:host] = a; end
  def port=(a); options[:port] = a; end
  def ssl=(a);  options[:ssl]  = a; end

  def initialize(options)
    @options = {
      :rpc_host => 'localhost',
      :rpc_port => 8332,
      :rpc_ssl  => false
    }
  end

  def to_hash
    @options.dup
  end

  def request(service_name, *params)
    req = Coind::Request.new(service_name, params)
    req.to_json
    Coind::RPC.new(to_hash).dispatch(req)
  end
end
