# This file should contain all the record creation needed to seed the database with its default values.
# このファイルには、データベースにデフォルト値をシードするために必要なすべてのレコード作成が含まれている必要があります。
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# その後、rails db：seedコマンドを使用してデータをロードできます（またはdb：setupを使用してデータベースと一緒に作成できます）。
# Examples:
# 例：
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# メインのサンプルユーザーを1人作成する
User.create!(name: "Yoshida Taro",
    email: "yoshida.taro@example.org",
    password: "password",
    password_confirmation: "password",
    # admin: true,
    activated: true,
    activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name: name,
     email: email,
     password: password,
     password_confirmation: password,
     activated: true,
     activated_at: Time.zone.now)
end
