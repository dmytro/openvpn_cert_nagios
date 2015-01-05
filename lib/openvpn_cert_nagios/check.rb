class CertCheck
  include NagiosCheck

  enable_warning :mandatory
  enable_critical :mandatory

  on "--path PATH", "-P PATH", String, :mandatory

  enable_timeout

  def check
    expiration, messages = 9999 , []

    certs.each do |file|
      cert = Cert.new(file)

      expiration = [cert.expires_in, expiration].min
      messages << cert.message
    end
    store_value :expires, expiration
    store_message messages.join(",")
  end

  def certs
    @certs ||= Dir.glob("#{ options.path }/*.crt")
  end

end
