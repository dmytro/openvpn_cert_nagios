class CertCheck
  ##
  # Execute shell commands. Simple popen3 wrapper, that returns either
  # STDOUT or exit status, and aborts on non zero status.
  #
  class Shell
    def self.exe(cmd)

      puts "DEBUG: #{cmd}" if $debug
      Open3.popen3({"PATH" => "/usr/bin:/bin:/usr/sbin:/sbin"}, cmd) do |stdin, stdout, stderr, process|

        stdin.close
        raise "#{cmd} FAILED: #{stderr.read} #{ stdout.read }" if process.value != 0
        stdout.readlines

      end
    end
  end

end
