module Logger
  def self.log(msg)
    puts "#{Time.now}: #{msg}"
  end
end
