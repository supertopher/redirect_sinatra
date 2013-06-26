require 'faker'
30.times do Url.create(full_url: Faker::Internet.domain_name, 
                        click_counter: 0)
end

30.times do User.create(name: Faker::Name.name, 
        email: Faker::Internet.email, password: "1234")
end
