# This file should contain all the record creation needed to seed the database with its default values.
# このファイルには、データベースにデフォルト値をシードするために必要なすべてのレコード作成が含まれている必要があります。
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# その後、rails db：seedコマンドを使用してデータをロードできます（またはdb：setupを使用してデータベースと一緒に作成できます）。
# Examples:
# 例：
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# メインのサンプルユーザーを1人作成する
User.create!(name: "吉田 一郎",
    email: "yoshida.ichiro@example.org",
    password: "password",
    password_confirmation: "password",
    # admin: true,
    activated: true,
    activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = Faker::Internet.email
password = "password"
User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
    product_name = Faker::Food.ingredient
    order_number = Faker::String.random.(length: 6)
    delivery_date = Faker::Date.between(from: '2021-02-17', to: '2021-2-26')
    # quantity = "quantity"
    remarks = Faker::Lorem.sentence(word_count: 5)
    users.each { |user| user.taskmemos.create!(product_name: product_name,
                                                order_number: order_number,
                                                remarks: remarks) }
end

10.times do |n|
    product_name = Faker::Food.ingredient
    order_number = Faker::String.random.(length: 6)
    delivery_date = Faker::Date.between(from: '2021-02-17', to: '2021-2-26')
    quantity = "quantity"
    process = "process"
    remarks = "remarks"
    Taskmemo.create!(product_name: product_name,
        order_number: order_number,
        delivery_date: delivery_date,
        quantity: quantity,
        remarks: remarks,
        created_at: Time.zone.now,
        updated_at: Time.zone.now)
    end
