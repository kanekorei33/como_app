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
  { name:"門脇", nickname:"かどわきくん", email:"test_3@example.com", password: "123456" },
  { name:"金子", nickname:"nekomama", email:"test_4@example.com", password: "123456" , admin: true},
  { name:"齋藤", nickname:"さいとうさ〜ん", email:"test_5@example.com", password: "123456" },
  { name:"佐藤", nickname:"さいきょう〜", email:"test_6@example.com", password: "123456" },
  { name:"鈴木", nickname:"スズキ先生〜", email:"test_7@example.com", password: "123456" },
  { name:"中村", nickname:"中村先生〜", email:"test_8@example.com", password: "123456" },
  { name:"西川", nickname:"西川先生〜", email:"test_9@example.com", password: "123456" },
  { name:"丸岡", nickname:"丸岡ちゃん", email:"test_10@example.com", password: "123456" },
  { name:"森塚", nickname:"森塚ちゃん", email:"test_11@example.com", password: "123456" },
  { name:"山田", nickname:"山田先生〜", email:"test_12@example.com", password: "123456" },
  { name:"吉田", nickname:"吉田くん", email:"test_13@example.com", password: "123456" },
  { name:"ゲストユーザー", nickname:"ゲストさん", email:"test@example.com", password: "123456" },
  { name:"ゲストアドミンユーザー", nickname:"ゲストアドミンさん", email:"test_admin@example.com", password:"123456", admin: true}
  ])

Institution.create!([
  { name:"トイレ", image: File.open("./public/institution_images/トイレ.jpg")},
  { name:"男女兼用トイレ", image: File.open("./public/institution_images/男女兼用トイレ.jpg")},
  { name:"だれでもトイレ", image: File.open("./public/institution_images/だれでもトイレ.jpg")},
  { name:"おむつ替え台", image: File.open("./public/institution_images/おむつ替え台.jpg")},
  { name:"水飲み台", image: File.open("./public/institution_images/水飲み台.jpg")},
  { name:"授乳室", image: File.open("./public/institution_images/授乳室.jpg")},
  { name:"じゃぶじゃぶ池", image: File.open("./public/institution_images/じゃぶじゃぶ池.jpg")},
  { name:"駐車場", image: File.open("./public/institution_images/駐車場.jpg")},
  ])

Playground.create!([
  { name:"ブランコ", image: File.open("./public/playgraund_images/ブランコ.jpg")},
  { name:"すべり台", image: File.open("./public/playgraund_images/すべり台.jpg")},
  { name:"砂場", image: File.open("./public/playgraund_images/砂場.jpg")},
  { name:"うんてい", image: File.open("./public/playgraund_images/うんてい.jpg")},
  { name:"のぼり棒", image: File.open("./public/playgraund_images/のぼり棒.jpg")},
  { name:"シーソー", image: File.open("./public/playgraund_images/シーソー.jpg")},
  { name:"ジャングルジム", image: File.open("./public/playgraund_images/ジャングルジム.jpg")},
  { name:"ターザンロープ", image: File.open("./public/playgraund_images/ターザンロープ.jpg")},
  { name:"コンビネーション遊具", image: File.open("./public/playgraund_images/コンビネーション.jpg")},
  { name:"ボルダリング", image: File.open("./public/playgraund_images/ボルダリング.jpg")},
  { name:"バケット型ブランコ", image: File.open("./public/playgraund_images/バケット型ブランコ.jpg")},
  { name:"鉄棒", image: File.open("./public/playgraund_images/鉄棒.jpg")},
  { name:"スプリング遊具", image: File.open("./public/playgraund_images/スプリング遊具.jpg")},
  ])

Park.create!([
  { name:"伏見もいわ山公園",
    introduction:"2017年にできた比較的新しい公園です。中央に滑り台ができる丘があり、休日や学校終わりなど子供達で賑わっています。",
    address:"北海道札幌市中央区南17条西16丁目6",
    main_image: File.open("./public/park_image/fushimimoiwayama.jpg"),
    institution_ids: [5], playground_ids: [1, 2, 6, 7, 8, 9, 10]},
  { name:"幌西自転車公園",
    introduction:"園内に自転車コースが設置されており、自転車の練習ができます。",
    address:"北海道札幌市中央区南14条西18丁目3",
    main_image: File.open("./public/park_image/horonisijitensya.jpg"),
    institution_ids: [1, 5], playground_ids: [1, 3, 8, 9, 11]},
  { name:"山鼻どんぐり公園",
    introduction:"小さな公園ですが、夏には盆踊りなどのイベントが開催されています",
    address:"北海道札幌市中央区南18条西13丁目2",
    main_image: File.open("./public/park_image/yamahanadonguri.jpg"),
    institution_ids: [5], playground_ids: [1, 3, 8, 9, 13]},
  { name:"旭山記念公園",
    introduction:"藻岩山と円山の中間に位置する見晴らしのよい開放的な公園です。起伏に富んだ丘陵に園路が設けられており、自然歩道「藻岩山ルート」にも通じています。。",
    address:"北海道札幌市中央区界川4丁目",
    main_image: File.open("./public/park_image/旭山記念公園.png"),
    institution_ids: [1, 3, 5, 7, 8], playground_ids: [1, 3, 8, 9, 13]},
  { name:"中島公園",
    introduction:"札幌市のほぼ中心部に位置しながらも、緑と水が豊かな憩いの場として親しまれている総合公園です。また、園内には鴨々川が流れ、鴨などの野鳥や鯉がおります。冬は歩くスキーが楽しめ、身近に自然と触れ合うことが出来る場所として老若男女を問わず年間を通して愛されています。",
    address:"北海道札幌市中央区南14条西5丁目",
    main_image: File.open("./public/park_image/中島公園.png"),
    institution_ids: [1, 3, 5, 7, 8], playground_ids: [1, 2, 6, 9]},
  ])

Category.create!([
  { name:"イベント情報" },
  { name:"周辺情報" },
  { name:"公園情報" },
  { name:"あそぼ〜！" },
])

Comment.create!([
  { content:"９月１０日に、〇〇小学校保護者有志でシャボン玉イベントを行います〜！よかったら遊びに来てくださいね。", park_id: 1, user_id: 1, category_id: 1 },
  { content:"10月20日に、札幌市のイベント秋の山道散策があります。参加者受付中です。詳細はこちら", park_id: 4, user_id: 4, category_id: 1 },
  { content:"近くに「まるっとパン」という美味しそうなパン屋さんがありました。イートインもあります。小さい子供用の椅子もありました", park_id: 2, user_id: 10, category_id: 2 },
  { content:"公園の近くにドラックストアがあり、トイレがとてもきれいです。おむつ替え台もあります", park_id: 3, user_id: 8, category_id: 1 },
  { content:"10月4日に、親子でヨガのイベントをやります。参加者受付中です。詳細はこちら", park_id: 5, user_id: 6, category_id: 1 },
  { content:"明日、息子５歳と公園で氷鬼してくれるお友達を探しています〜！一緒に遊びませんか？", park_id: 1, user_id: 6, category_id: 1 },
  ])

Post.create!([
 { content: "楽しそうなイベントですね！何か持っていくものはありますか？", comment_id: 1, user_id: 3 },
 { content: "情報有難うございます徒歩でどのくらいですか？", comment_id: 3, user_id: 2 },
 { content: "参加者は何人くらいですか？", comment_id: 2, user_id: 5 },
 { content: "情報ありがとうございます", comment_id: 2, user_id: 12 },
 { content: "参加します〜！", comment_id: 2, user_id: 8 },
 { content: "参加します〜！", comment_id: 6, user_id: 9 },
  ])