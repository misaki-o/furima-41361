class Category < ActiveHash::Base
    self.data = [
      { id: 1, name: 'メンズ' },
      { id: 2, name: 'レディース' },
      { id: 3, name: 'ベビー' },
      { id: 4, name: 'キッズ' },
      { id: 5, name: 'インテリア・住まい・小物' },
      { id: 6, name: '本・音楽・ゲーム' },
      { id: 7, name: 'おもちゃ・ホビー・グッズ' },
      { id: 8, name: '家電・スマホ・カメラ' },
      { id: 9, name: 'スポーツ・レジャー' },
      { id: 10, name: 'ハンドメイド' },
      { id: 11, name: 'その他' }
    ]
end
