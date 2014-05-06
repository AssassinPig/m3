namespace :db do
  desc "Fill database with sample data"
    task :populate => :environment do 
      #Rake::Task['db:reset'].invoke
      make_users
      make_about_contents
  end
end

def make_users
  user = User.create!(:name=>"admin",
                     :email=>"zhufengShao2011@gmail.com",
                     :password=>"m3.123456")
end

def make_about_contents
  2.times do |i|
    content = AboutContent.create!(:title=>"about_content#{i}", :summary=>"summary", :content=>"content")
  end
end
