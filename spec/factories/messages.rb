FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |item|
      #after(:build)とすることで、インスタンスがbuildされた後に指定の処理↓↓を実行できる。
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
                         #指定したパスのファイルを、test_image.pngというファイル名で保存している。
           #.imageでitemのimageカラムにattachで画像を添付するという記述。(実際にはimageカラムは存在しないがactivestorageのおかげでこれで紐付けられる)
           #itemの中身は↑のFactoryBotで生成(build)したインスタンス
    end
  end
end