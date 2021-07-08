desc "To populate Status to false column in user table"

task :populate_column => :environment do
  @users=User.all
  @users.each do |user|
    user.update(ban:false)
  end
end