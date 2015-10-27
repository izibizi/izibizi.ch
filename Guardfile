guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^(boot\.rb|config\.ru)$})  { 'spec' }
  watch(%r{app/.+\.(rb|slim)})       { 'spec' }
  watch('spec/spec_helper.rb')        { 'spec' }
end
