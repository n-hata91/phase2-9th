if Rails.env == "development"

  3.times do |n|
    name = "Name#{n}"
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    content = "#{n}*n"
    User.create!(name: name,
      email: email,
      password: password,
      introduction: content,
      created_at: Time.zone.now,
      updated_at: Time.zone.now)
    end
    
    3.times do |n|
      content = "#{n}.TITLE"
      content2 = "#{n}.BODY"
      users = User.order(:created_at).take(5)
      users.each { |user| user.books.create!(
        title: content,
        body: content2,
        created_at: Time.zone.now,
        updated_at: Time.zone.now)}
    end
    
  end