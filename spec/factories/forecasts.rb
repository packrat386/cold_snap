FactoryGirl.define do
  factory :forecast do
    time_accessed Time.now.to_i
curr_precip_chance 1
curr_temp 1
zipcode "60604"
  end

end
