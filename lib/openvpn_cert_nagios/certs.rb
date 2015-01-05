class CertCheck
  require 'pry'
  class Cert
    def initialize(path)
      @path = path
    end
    attr_reader :path

    def expires_in
      expiration_date - Date.today
    end

    def message
      "#{File.basename(path, ".crt")}:#{expires_in.to_s}"
    end

    def expiration_date
      Date.parse(expiration_row.split("=", 2)[1])
    end

    def expiration_row
      chk_command.find { |x| x =~ /^notAfter=/ }
    end

    def chk_command
      Shell.exe("openssl x509 -in #{path} -inform PEM -text -noout -enddate -startdate")
    end
  end
end
