require 'faker'
30.times do Url.create(full_url: Faker::Internet.domain_name, 
                        click_counter: 0)
end
