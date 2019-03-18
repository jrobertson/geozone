Gem::Specification.new do |s|
  s.name = 'geozone'
  s.version = '0.1.0'
  s.summary = 'Finds the nearest zone location by comparing GPS distances with known locations.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/geozone.rb']
  s.add_runtime_dependency('dynarex', '~> 1.8', '>=1.8.18') 
  s.signing_key = '../privatekeys/geozone.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/geozone'
end
