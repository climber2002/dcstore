FactoryGirl.define do
  factory :category do
    name 'Category'

    factory :category_cameras do
      name 'Cameras'
    end

    factory :category_audio do
      name 'Audio'
    end
  end
end