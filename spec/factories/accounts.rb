FactoryBot.define do
  factory :account do
    login { 'MyString' }
    password { 'MyString' }
    health { 1 }
    tired { 1 }
    funny { 1 }
    mana { 1 }
    money { 1 }
    points { 1 }
  end
end
