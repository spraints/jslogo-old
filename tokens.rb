readlines.each do |line|
  next unless line =~ /[a-z]/i
  alternatives = line.split(/\|/).collect{|s|s.strip}
  name = alternatives.first.upcase
  alternatives.each do |alternative|
    lower = alternative.downcase
    upper = alternative.upcase
    regex = lower.chars.zip(upper.chars).collect { |opt| "[#{opt.join('')}]" }.join('')
    puts "#{'%-40s' % regex} return '#{name}';"
  end
end
