# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([
  { name:"青野", nickname:"あおえもん", email:"test_1@example.com", password: "123456" },
  { name:"遠藤", nickname:"太郎さ〜ん", email:"test_2@example.com", password: "123456" },
  { name:"門脇", nickname:"ケントくん", email:"test_3@example.com", password: "123456" },
  { name:"金子", nickname:"nekomama", email:"test_4@example.com", password: "123456" },
  { name:"齋藤", nickname:"さいとうさ〜ん", email:"test_5@example.com", password: "123456" },
  { name:"佐藤", nickname:"さいきょう〜", email:"test_6@example.com", password: "123456" },
  { name:"鈴木", nickname:"スズキ先生〜", email:"test_7@example.com", password: "123456" },
  { name:"中村", nickname:"中村先生〜", email:"test_8@example.com", password: "123456" },
  { name:"西川", nickname:"西川先生〜", email:"test_9@example.com", password: "123456" },
  { name:"丸岡", nickname:"丸岡ちゃん", email:"test_10@example.com", password: "123456" },
  { name:"森塚", nickname:"森塚ちゃん", email:"test_11@example.com", password: "123456" },
  { name:"山田", nickname:"山田先生〜", email:"test_12@example.com", password: "123456" },
  { name:"吉田", nickname:"吉田くん", email:"test_13@example.com", password: "123456" },
])

Park.create!([
  { name:"伏見もいわ山公園",introduction:"2017年にできた比較的新しい公園です。中央に滑り台ができる丘があり、休日や学校終わりなど子供達で賑わっています。", address:"北海道札幌市中央区南17条西16丁目6", main_image: File.open("./public/park_image/fushimimoiwayama.jpg")},
  { name:"幌西自転車公園",introduction:"自転車の練習ができます。", address:"北海道札幌市中央区南14条西18丁目3", main_image: File.open("./public/park_image/horonisijitensya.jpg")},
  { name:"山鼻どんぐり公園",introduction:"小さな公園", address:"北海道札幌市中央区南18条西13丁目2", main_image: File.open("./public/park_image/yamahanadonguri.jpg")},
])

Category.create!([
  { name:"イベント情報" },
  { name:"周辺情報" },
  { name:"公園情報" },
  { name:"あそぼ〜！" },
])

Playground.create!([
  { name:"ブランコ", image: File.open("./public/playgraund_image/ブランコ.png")},
  { name:"シーソー", image: File.open("./public/playgraund_image/シーソー.png")},
])

Institution.create!([
  { name:"トイレ", image: File.open("./public/playgraund_image/うんてい.png")},
  { name:"授乳室", image: File.open("./public/playgraund_image/鉄棒.png")},
  { name:"じゃぶじゃぶ池", image: File.open("./public/playgraund_image/砂場.png")},
])

