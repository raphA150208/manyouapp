FactoryBot.define do
  factory :admin_user, class: User do
    name {'admin_name'}
    email {'admin_email@email.com'}
    password {'adminuser'}
    password_confirmation {'adminuser'}
    admin {true}
  end
  factory :admin_user2, class: User do
    name {'admin_name2'}
    email {'admin_email2@email.com'}
    password {'adminuser2'}
    password_confirmation {'adminuser2'}
    admin {true}
  end
  factory :general_user, class: User do
    name {'general_name'}
    email {'general_email@email.com'}
    password {'generaluser'}
    password_confirmation {'generaluser'}
    admin {false}
  end
  factory :general_user2, class: User do
    name {'general_user2_name'}
    email {'general_user2@email.com'}
    password {'generaluser2'}
    password_confirmation {'generaluser2'}
    admin {false}
  end
end