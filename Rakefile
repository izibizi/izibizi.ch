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

namespace :images do
  desc 'optimize all images'
  task :optimize => ['images:optimize:jpg', 'images:optimize:png']

  namespace :optimize do
    desc 'optimize all JPEGs'
    task :jpg do
      system 'jpegoptim --strip-all --totals img/**/*.jpg'
    end

    desc 'optimize all PNGs'
    task :png do
      Dir.glob('img/**/*.png') do |png|
        system "optipng -o7 -zm1-9 #{png}"
      end
    end
  end

  desc 'generate missing thumbnail images'
  task :generate_tn do
    Dir.glob('img/mitglieder/*.jpg') do |img|
      name = img.match(%r{([^/]+).jpg$})[1]
      out = "img/mitglieder/tn-#{name}.jpg"

      next if name =~ /^tn-/ || File.exist?(out)

      cmd = "convert #{img} -resize '280x280^' -gravity center -extent 280x280 #{out}"
      puts "----> #{cmd}"
      system cmd
    end
  end

  desc 'list unused images'
  task :cleanup do
    Dir.glob('img/mitglieder/*.jpg') do |img|
      name = img.match(%r{([^/]+).jpg$})[1]
      puts img unless File.exist? "_mitglieder/#{name}.md"
    end
  end
end
