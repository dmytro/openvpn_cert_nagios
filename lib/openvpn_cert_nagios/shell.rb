class CertCheck
  ##
  # Execute shell commands. Simple popen3 wrapper, that returns either
  # STDOUT or exit status, and aborts on non zero status.
  #
  class Shell
    def self.exe(cmd, ignore_status: false, only_status: false)

      puts "DEBUG: #{cmd}" if $debug
      Open3.popen3({"PATH" => "/usr/bin:/bin:/usr/sbin:/sbin"}, cmd) do |stdin, stdout, stderr, process|

        stdin.close
        case
        when only_status
          process.value
        when ignore_status
          stdout.readlines
        when process.value != 0
          abort "#{cmd} FAILED: #{stderr.read} #{ stdout.read }"
        else
          stdout.readlines
        end
      end
    end
  end

end
