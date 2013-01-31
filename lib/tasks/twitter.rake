namespace :twitter  do
  desc "Streaming..."
  task :listen => :environment do
    t = TwitterStream.new
    t.run
  end
end