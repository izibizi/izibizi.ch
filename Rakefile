desc 'Build the page'
task :build do
  system 'bundle exec jekyll build'
end

desc 'Deploy the site'
task :deploy => [:build] do
  exec 'rsync -av --delete _site/ test.izibizi.ch:public_html/test.izibizi.ch/'
end
