FactoryGirl.define do

  factory :resort do    
    sequence :name do |n|
      "resort_#{n}"
    end
    sequence :latitude do |n|
      "50.12#{n}"
    end
    sequence :longitude do |n|
      "10.12#{n}"
    end
  end

end