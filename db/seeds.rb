grades = Grade.create([{name: "事務"}, {name: "きりん"}, {name: "ぞう"}, {name: "くま"}, {name: "うさぎ"}, {name: "りす"}, {name: "ひよこ"}])

User.create!(
  name: '管理者', 
  login_id: 'admin', 
  password: 'admin1234', 
  password_confirmation: 'admin1234', 
  comment: 'よろしくお願いします。',
  teacher: true,
  grade_id: 1
)