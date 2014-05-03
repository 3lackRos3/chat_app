namespace :db do
  desc "Erase and fill test data"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Meeting, User, ApiKey].each(&:delete_all)

    ApiKey.populate 3 do |api|
      api.app_name = Faker::Company.name
      api.access_token = SecureRandom.hex
    end

    i = 1000

    User.populate 10 do |callers|
      callers.name  = Faker::Name.first_name
      callers.number = Faker::Number.number(10)
      callers.uniq_id = "myapp#{i}ef"
      callers.api_key_id = [1,2,3]
      callers.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
      i+=1
    end

    i = 1

    Meeting.populate 10 do |meeting|
      meeting.caller_id = User.all.map{ |c| c.id }
      meeting.receiver_id = User.all.map{ |c| c.id }.reject{ |x| x == meeting.caller_id } 
      puts "===============> Meeting Caller Id   #{meeting.caller_id}   <======================="
      puts "===============> Meeting Receiver id #{meeting.receiver_id} <======================="
      meeting.order_id = i
      meeting.duration = [15, 30, 45, 60, 75, 90]
      meeting.start_time = Time.now..(Time.now+1.month)
      meeting.start_date = Date.today..(Date.today+1.month)
      call_type = [ "Browser" , "Phone"]
      meeting.caller_call_type = call_type
      meeting.receiver_call_type = call_type
      i+=1
    end

  end
end
