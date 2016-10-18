desc 'Build the page'
task :build do
  system 'bundle exec jekyll build'
end

desc 'Deploy the site'
task :deploy => [:build] do
  exec 'rsync -av --delete _site/ test.izibizi.ch:public_html/test.izibizi.ch/'
end

namespace :members do
  desc 'Convert a mitglieder.yml into individual .md files'
  task :convert do
    raise ArgumentError, 'Missing env var IN' if ENV['IN'].nil?

    require 'yaml'
    data = YAML.load open(ENV['IN'])
    outdir = File.expand_path('../_mitglieder', __FILE__)

    data.each do |m|
      fpath = File.join(outdir, "#{m.delete('id')}.md")
      puts "--> writing #{fpath}"
      File.open(fpath, 'w') do |f|
        f.write m.to_yaml
        f.write '---'
      end
    end

  end
end
