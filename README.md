画像URL：https://gyazo.com/56974b5bebc2d7c251ec067f3d5a0e19

以下の画面、処理が実装されていること
  ・トップ画面(エリア検索、フリーワードで検索できること)
  ・ユーザ登録機能(プロフィール情報として、アイコン・自己紹介・名前を登録できること。一つのアカウントで貸す機能、借りる機能どちらもできること)
  ・貸したい物件を登録できること(住所、価格、フリーテキスト、画像を登録できる)
  ・借りたい物件を予約できること(予約画面で入力された宿泊日数、人数に応じた料金を表示すること、決済処理は実装しなくて良いです)
  ・予約履歴を参照できること

モデル     rails g model
  ・ユーザー(User)：名前(name)、パスワード(pass)、メール(mail)、自己紹介(text)、アイコン(image)
  ・貸物件(rental)：タイトル(title)、料金(price)、宿泊可能人数(max_user)、説明文(description)、エリア(Aria)、住所(address)、画像(image)、ユーザーID(user_id)
  ・借り物件(borrowed)：宿泊開始日(lodgment_start)、宿泊終了日(lodgment_end)、貸物件ID(property_id)、宿泊人数(user)、支払い料金(price)、ユーザーID(user_id)
