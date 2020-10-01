FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"abc123"}
    password_confirmation {password}
    first_name_kanji      {"名字"}
    last_name_kanji       {"名前"}
    first_name_kana       {"ミョウジ"}
    last_name_kana        {"ナマエ"}
    birthday              {"2020-09-01"}
  end
end