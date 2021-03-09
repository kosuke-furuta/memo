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
             email: "test@example.com",
             password: "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
name = Faker::Name.name
email = "test-#{n+1}@example.com"
password = "password"
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             activated: true,
             activated_at: Time.zone.now)
end

# 20.times do |n|
# product_name = Faker::Food.ingredient
# order_number = Faker::String.random(length: 6)
# delivery_date = Faker::Date.between(from: '2021-02-17', to: '2021-2-26')
# quantity = "quantity"
# process = "process"
# remarks = "remarks"
# Taskmemo.create!(product_name: product_name,
#                order_number: order_number,
#                delivery_date: delivery_date,
#                quantity: quantity,
#                process: process,
#                remarks: remarks,
#                created_at: Time.zone.now)
# end

# ユーザーの一部を対象タスクメモを生成する
users = User.order(:created_at).take(6)
50.times do
    order_number = "B20010"
    product_name = "BS皮むきポークウインナー"
    delivery_date = "3/31"
    quantity = "4000m"
    process = "印刷・ラミ・スリット"
    remarks = "在版。特になし。"
    created_at = Faker::Date.in_date_period(year: 2021, month: 2)
    users.each { |user| user.taskmemos.create!(order_number: order_number,
                                               product_name: product_name,
                                               delivery_date: delivery_date,
                                               quantity: quantity,
                                               process: process,
                                               remarks: remarks,
                                               created_at: Time.zone.now) }
end

# 以下のリレーションシップを作成する
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
