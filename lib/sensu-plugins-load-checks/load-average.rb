class LoadAverage
  def initialize
    @cores = cpu_count
    @avg = load_avg
  end

  def load_avg
    if File.exist?('/proc/loadavg')
      # linux
      File.read('/proc/loadavg').split.take(3).map { |a| (a.to_f / @cores).round(2) } rescue nil # rubocop:disable RescueModifier
    else
      # fallback for FreeBSD
      `uptime`.split(' ')[-3..-1].map(&:to_f).map { |a| (a.to_f / @cores).round(2) } rescue nil # rubocop:disable RescueModifier
    end
  end

  def cpu_count
    if File.exist?('/proc/cpuinfo')
      File.read('/proc/cpuinfo').scan(/^processor/).count
    else
      `sysctl -n hw.ncpu`.to_i
    end
  rescue StandardError
    0
  end

  def failed?
    @avg.nil? || @cores.zero?
  end

  def exceed?(thresholds)
    @avg.zip(thresholds).any? { |a, t| a >= t }
  end

  def to_s
    @avg.join(', ')
  end

  def total
    @avg.map { |a| (a / @cores) }.join(', ')
  end
end
