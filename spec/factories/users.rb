FactoryBot.define do
  factory :user do
        transient do
        person { Gimei.name }
     end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name_kanji     {person.last.kanji}
    first_name_kanji      {person.first.kanji}
    family_name_kana      {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2019-12-31')}
  end

end