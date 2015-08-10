FactoryGirl.define do
  factory :project do 
    sequence(:name) { |n| "MyProject #{n}" }
	client "My Client"
	archived false
  end
end
