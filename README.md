# アプリケーション名  
おこずかいカレンダー  
# アプリケーション概要  
・子供のお手伝いの回数とお小遣いを管理できるアプリケーション  
# URL  
https://okozukaiapp-39790.onrender.com  
# テスト用アカウント  
・Basic認証パスワード： yuji  
・Basic認証ID：0328  
・メールアドレス：  test@gmail.com
・パスワード：  yuji0328
# 利用方法  
1・トップページのユーザー名をクリックし、目標金額とお手伝いの単価を設定する  
2・トップページのカレンダーにて、お手伝いをした日をクリック  
3・リロードすると合計金額が反映され、お手伝いをした日に印がつく  
# アプリケーションを作成した背景  
我が家では日々、お手伝いをした日を忘れてしまう低学年の息子と、お小遣いを渡し忘れてしまう親の喧嘩が勃発している。  
そんな2人の喧嘩を少しでも無くそうと思い、こちらのアプリケーションを考案した。  
# 洗い出した要件  
https://docs.google.com/spreadsheets/d/10kQS-mpnNJ1VIe1ISuoI2JF_Pf9wiKf2-Nm2TZLM1vA/edit?usp=sharing  
# 実装した機能について  
## カレンダー機能  
・カレンダーのお手伝いをした日付をクリックすることで、印を付けれる  
[![Image from Gyazo](https://i.gyazo.com/503564fc600ffc4d973d8ec40fbe8380.gif)](https://gyazo.com/503564fc600ffc4d973d8ec40fbe8380)
## おこずかい管理機能  
・印の数を一覧表示する  
・印の数を足した合計額をヘッダーに表示する  
・ユーザー編集画面で設定した目標金額をヘッダーに表示する  
[![Image from Gyazo](https://i.gyazo.com/6e8145d0ce751f9bfe4f172ce5d5824b.gif)](https://gyazo.com/6e8145d0ce751f9bfe4f172ce5d5824b)  
## ユーザー管理機能  
### ユーザー登録  
・nickname・email・password・子供のnicknameを登録する  
### マイページ機能  
・nickname・email・password・目標の金額・単価を編集できる  
# 実装予定の機能  
現在、おこづかいを渡す日にポップアップが表示される機能を実装中  
今後は前月との比較値などの表示を実装予定  
# データベース設計  
[![Image from Gyazo](https://i.gyazo.com/3f5052586390a4f2888046ab5b22b54f.png)](https://gyazo.com/3f5052586390a4f2888046ab5b22b54f)  
# 画面遷移図  
  [![Image from Gyazo](https://i.gyazo.com/391ac11b48b48b33ecc3b096d9b2a2be.png)](https://gyazo.com/391ac11b48b48b33ecc3b096d9b2a2be)
# 開発環境  
・HTML  
・css  
・ruby on rails  
・JavaScript  
・simple calendar  
# ローカル環境での動作方法  
% git clone https://github.com/yujimiya/okozukai-app-39790-.git  
% cd okozukai-app-39790-  
% rails db:create
% rails db:migrate
% rails s
# 工夫したポイント  
工夫した点は、低学年の子どもをターゲットとしている為シンプルな操作を一番に考えた。
子供の操作は指一本でワンクリックのみの操作ということ。  
# 改善点  
・アカウント編集画面への遷移を親のみできるようにする  
・子供むけアプリの為トップページを子供らしい表示に装飾していく  
・通知機能の実装
# 制作時間  
80時間







