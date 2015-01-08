class CertCheck
  include NagiosCheck

  enable_warning :mandatory
  enable_critical :mandatory

  on "--path PATH", "-P PATH", String, :mandatory

  enable_timeout

  def check

    result = certs.reduce({days: 9999, message: []}) do |memo, file|
      cert = Cert.new(file)
      memo[:message] << cert.message
      memo[:days] = [cert.expires_in, memo[:days]].min
      memo
    end

    store_value :expires, result[:days]
    store_message result[:message].sort.join(",").delete(' ')
  end

  def certs
    @certs ||= Dir.new(options.path).entries.find_all{ |f| f =~ /.*\.crt$/ }.map { |f| "#{ options.path }/#{ f }" }
  end

end
