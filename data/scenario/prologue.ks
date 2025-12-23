;=========================================
; プロローグ
;=========================================
[cm]
[clearfix]
[start_keyconfig]
;=========================================
; UIデザイン設定 (AIシステム風カスタム)
;=========================================
; メッセージ枠の基本設定（元の枠画像を非表示にし、透明度を0にする）
[position layer="message0" left=20 top=420 width=1240 height=280 page=fore visible=true frame="none" opacity=0]

; CSSによるデザイン装飾（HTMLタグを使って直接記述）
[html]
<style>
    /* メッセージエリアの背景デザイン（半透明の黒＋青い発光枠線） */
    .message_outer {
        background: rgba(0, 10, 25, 0.85); /* 濃い青黒い半透明背景 */
        border: 2px solid #00ffff;          /* 外枠：シアン色の実線 */
        box-shadow: 0 0 15px rgba(0, 255, 255, 0.4), inset 0 0 10px rgba(0, 255, 255, 0.2); /* 内外に青白い発光(グロー)効果 */
        border-radius: 5px;                 /* 角を少しだけ丸く */
    }
    
    /* 名前欄のデザイン（簡易的に背景色だけ変更を試みる記述） */
    /* ※注意：TyranoScriptのバージョンによっては、この方法では名前欄だけにスタイルを適用できない場合があります。 */
    /* その場合は、この.name_area_boxのブロックは無視してください。 */
    .name_area_box {
        background-color: #00ffff !important;
        color: #000000 !important;
        padding: 2px 10px;
        font-weight: bold;
    }

    /* メッセージテキスト自体の装飾（白文字＋黒フチ） */
    .message_inner {
        color: #ffffff;
        text-shadow: 1px 1px 2px #000000, -1px -1px 2px #000000; /* 簡易的な黒フチ・影 */
        font-family: "メイリオ", sans-serif; /* フォントをメイリオに固定（任意） */
    }
</style>
[endhtml]

; デフォルトの文字設定（白文字、黒フチ）※上記CSSが効かない場合の保険
[deffont color="0xffffff" edge="0x000000" shadow="0x000000"]
[resetfont]

; 名前欄の位置調整（見やすい位置へ移動）
[ptext name="chara_name_area" layer="message0" color="0xffffff" edge="0x000000" size=28 x=60 y=430 top=430]

;=========================================
; UI設定ここまで
;=========================================
;------------------------------------------------
; キャラクター事前登録 (サイズ・位置 最終調整版)
;------------------------------------------------
; ■ ミナ: 幅450, 上から60pxの位置に表示
[chara_new name="ミナ" storage="chara/2/mina_smile.png" jname="ミナ" width="450" top="60"]
[chara_face name="ミナ" face="default" storage="chara/2/mina_smile.png"]
[chara_face name="ミナ" face="trouble" storage="chara/2/mina_trouble.png"]
[chara_face name="ミナ" face="fear" storage="chara/2/mina_fear.png"]

; ■ カナエ: 幅450, 上から60px
[chara_new name="カナエ" storage="chara/3/kanae_normal.png" jname="カナエ" width="450" top="60"]
[chara_face name="カナエ" face="default" storage="chara/3/kanae_normal.png"]
[chara_face name="カナエ" face="sad" storage="chara/3/kanae_sad.png"]
[chara_face name="カナエ" face="smile" storage="chara/3/kanae_smile.png"]
[chara_face name="カナエ" face="angry" storage="chara/3/kanae_angry.png"]

; ■ 主人公: 幅450, 上から60px
[chara_new name="hero" storage="chara/1/hero_normal.png" jname="僕" width="450" top="60"]
[chara_face name="hero" face="default" storage="chara/1/hero_normal.png"]
[chara_face name="hero" face="tired" storage="chara/1/hero_tired.png"]
[chara_face name="hero" face="smile" storage="chara/1/hero_smile.png"]

; ■ tasky: 幅350, 上から100px (少し小さく)
[chara_new name="tasky" storage="chara/4/tasky_normal.png" jname="tasky" width="350" top="100"]
[chara_face name="tasky" face="default" storage="chara/4/tasky_normal.png"]
[chara_face name="tasky" face="warning" storage="chara/4/tasky_warning.png"]
;------------------------------------------------

; 変数初期化
[eval exp="f.dep = 0"]
[eval exp="f.fat = 0"]
[eval exp="f.kanae = 0"]

[layopt layer=message0 visible=true]

; 背景：自室(夜・初期)
[bg storage="blue_screen_night.jpg" time="1000"]

; BGM：導入
[playbgm storage="BGM_01_導入.mp3" volume="50"]

; SE：環境音
[playse storage="SE11 環境音：都会の喧騒.mp3" volume="30" loop="true"]

; モノローグ
[stopse]
[playse storage="その他.mp3/この街は、巨大な監視システムそのものだ。...その圧力は、公的な罰則よりも重く、粘着質な自己否定となって僕の胃を締め上げる。.mp3"]
#モノローグ
窓の外は、暴力的なまでに煌々と輝く〈インデックス・シティ〉のネオン。[p]
その人工的な光は、遮光カーテンの隙間から強引に侵入し、[r]
僕の部屋の暗さを「非生産的な怠惰」という罪として訴えかけているようだった。[p]

#モノローグ
この街は、巨大な監視システムそのものだ。[r]
街頭のカメラ、オフィスのPC、そして手元のスマートフォン。[p]
誰もが画面に映る「ルーチン・スコア」を誇示し、互いの「努力」を監視し合っている。[p]

「今日のスコアは98点だ」「睡眠効率が落ちているぞ」……[r]
そんな会話が挨拶代わりに交わされる世界。[p]
その圧力は、公的な罰則よりも重く、粘着質な自己否定となって僕の胃を締め上げる。[p]

; モノローグ
[stopse]
[playse storage="その他.mp3/僕のスコアは 72 。...このままでは、社会から期待されない『平凡以下の不良資産（バッド・アセット）』として、この都市の光の届かない隅で埋もれてしまうだろう。.mp3"]
#モノローグ
僕のスコアは72。平均以下だ。[p]
同僚たちは着実に昇進リストに名を連ねていく中、[r]
僕は卒業研究のテーマすら決まらず、日々の雑務に忙殺されている。[p]

このままでは、社会から期待されない「平凡以下の不良資産（バッド・アセット）」として、[r]
この都市の光の届かない隅で埋もれてしまうだろう。[p]

; モノローグ
[stopse]
[playse storage="その他.mp3/常に感じる、喉の奥に張り付いたような焦燥感と自己嫌悪。...誰かに、正解を教えて欲しかった。.mp3"]
#モノローグ
常に感じる、喉の奥に張り付いたような焦燥感と自己嫌悪。[p]
「変わりたい」 その思いだけが空回りして、何一つ行動に移せない。[p]
何とかして、この無力な日常の閉塞感から、自分の意志で抜け出したかった。[r]
誰かに、正解を教えて欲しかった。[p]

; SE：ポップアップ
[stopse]
[playse storage="SE08 スマホタップ音.mp3"]

#
スマホ画面に『tasky』のアイコンが不気味に拡大表示される。[p]

; taskyボイス
[stopse]
[playse storage="tasky.mp3/まだ、迷っているのですか？ あなたの内なる可能性を引き出し、埋もれた努力を数値で証明します。...あなたの人生を変える、最初で最後の一歩を.mp3"]
#tasky (広告音声)
『まだ、迷っているのですか？[r]
あなたの内なる可能性を引き出し、埋もれた努力を数値で証明します。[p]
自己管理AIアプリ『tasky』。[r]
今ならインストール無料。あなたの人生を変える、最初で最後の一歩を』[p]

; モノローグ
[stopse]
[playse storage="その他.mp3/SNS のタイムラインが、tasky の広告で埋め尽くされている。...僕は tasky に、僕の人生の主導権を委ねてみようと決めた。.mp3"]
#モノローグ
SNSのタイムラインが、taskyの広告で埋め尽くされている。[r]
まるで、僕の深夜の苦悩を見透かしたかのように。[p]
友人も、同僚も、皆これを使っているという。[p]
これが、最後のチャンスかもしれない。[r]
藁にもすがる思いで、震える指先を画面に伸ばす。[p]
僕はtaskyに、僕の人生の主導権を委ねてみようと決めた。[p]

[glink color="blue" size="24" x="360" width="400" y="250" text="【インストールする】" target="*install_seq"]
[s]

*install_seq
; SE：インストール音
[stopse]
[playse storage="SE01インストール音_起動音.mp3"]

; 演出
[mask effect="fadeIn" color="0xffffff" time="200"]
[bg storage="blue_screen_night.jpg" time="0"]
[mask_off effect="fadeOut" time="1000"]

; ▼ tasky立ち絵
[chara_show name="tasky" time="1000"]

; taskyボイス
[stopse]
[playse storage="tasky.mp3/ようこそ、ユーザーID：404。...完了してください。.mp3"]
#tasky
ようこそ、ユーザーID：404。[p]
私はあなたの生産性を最大限に引き出し、理想の自己へと導くパートナーです。[r]
あなたの無駄を削ぎ落とし、幸福への最短ルートを計算します。[p]

#tasky
初回起動タスク：『自己紹介の承認』を認識しました。[r]
完了してください。[p]

[glink color="blue" size="24" x="360" width="400" y="250" text="【承認する】" target="*approve_seq"]
[s]

*approve_seq
; SE：通知音
[stopse]
[playse storage="SE02通常通知音.mp3"]

; ★追加：スマホ画面表示
[bg storage="bg_smartphone_task_done.jpg" time="500"]

; モノローグ
[stopse]
[playse storage="その他.mp3/「承認」ボタンをタップした瞬間、全身が電流に打たれたように痺れ、そして同時に重荷が消え去ったような浮遊感を覚えた。...新しい僕を。.mp3"]
#モノローグ
「承認」ボタンをタップした瞬間、全身が電流に打たれたように痺れ、[r]
そして同時に重荷が消え去ったような浮遊感を覚えた。[p]

「素晴らしい判断です」……画面に表示されたその文字。[r]
そんなポジティブな肯定の言葉、最近誰からもかけられていなかった。[p]

まるで、生まれたての赤ちゃんのように、世界が輝いて見えた。[r]
これで、僕もあの光を手に入れられる。[p]

さあ、始めよう。新しい僕を。[p]

[jump storage="chapter1.ks"]
[s]