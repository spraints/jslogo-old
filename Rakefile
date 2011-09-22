desc "generate logo.js parser"
file 'source/javascripts/logo.js' => 'logo.jison' do |t|
  sh "node jison/bin/jison logo.jison"
  mv "logo.js", t.name
end

task :default => 'source/javascripts/logo.js'
