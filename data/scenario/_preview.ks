[_tb_system_call storage=system/_preview.ks ]

[mask time=10]
[mask_off time=10]

;=========================================
; プロローグ
;=========================================


[cm  ]
[clearfix]

[start_keyconfig]


;------------------------------------------------
; キャラクター事前登録
;------------------------------------------------


[chara_new name="ミナ" storage="chara/2/mina_smile.png" jname="ミナ" width="520" top="40"]

[chara_face name="ミナ" face="default" storage="chara/2/mina_smile.png"]

[chara_face name="ミナ" face="trouble" storage="chara/2/mina_trouble.png"]

[chara_face name="ミナ" face="fear" storage="chara/2/mina_fear.png"]

[chara_new name="カナエ" storage="chara/3/kanae_normal.png" jname="カナエ" width="520" top="40"]

[chara_face name="カナエ" face="default" storage="chara/3/kanae_normal.png"]

[chara_face name="カナエ" face="sad" storage="chara/3/kanae_sad.png"]

[chara_face name="カナエ" face="smile" storage="chara/3/kanae_smile.png"]

[chara_face name="カナエ" face="angry" storage="chara/3/kanae_angry.png"]

[chara_new name="hero" storage="chara/1/hero_normal.png" jname="僕" width="520" top="40"]

[chara_face name="hero" face="default" storage="chara/1/hero_normal.png"]

[chara_face name="hero" face="tired" storage="chara/1/hero_tired.png"]

[chara_face name="hero" face="smile" storage="chara/1/hero_smile.png"]

[chara_new name="tasky" storage="chara/4/tasky_normal.png" jname="tasky" width="380" top="100"]

[chara_face name="tasky" face="default" storage="chara/4/tasky_normal.png"]

[chara_face name="tasky" face="warning" storage="chara/4/tasky_warning.png"]


;------------------------------------------------
; 変数初期化


[eval exp="f.dep = 0"]

[eval exp="f.fat = 0"]

[eval exp="f.kanae = 0"]

[layopt layer=message0 visible=true]


; 背景：自室(夜・初期)


[bg  storage="blue_screen_night.jpg"  time="1000"  ]

; BGM：導入


[playbgm  storage="BGM_01_導入.mp3"  volume="50"  ]

; SE：環境音


[playse  storage="SE11&nbsp;環境音：都会の喧騒.mp3"  volume="30"  loop="true"  ]

; モノローグ


[playse  storage="この街は、巨大な監視システムそのものだ。...その圧力は、公的な罰則よりも重く、粘着質な自己否定となって僕の胃を締め上げる。.mp3"  ]

#モノローグ
窓の外は、暴力的なまでに煌々と輝く〈インデックス・シティ〉のネオン。[p]
その人工的な光は、遮光カーテンの隙間から強引に侵入し、[p]


[r]


僕の部屋の暗さを「非生産的な怠惰」という罪として訴えかけているようだった。[p]
#モノローグ
この街は、巨大な監視システムそのものだ。[p]


[r]


街頭のカメラ、オフィスのPC、そして手元のスマートフォン。[p]
誰もが画面に映る「ルーチン・スコア」を誇示し、互いの「努力」を監視し合っている。[p]
「今日のスコアは98点だ」「睡眠効率が落ちているぞ」……[p]


[r]


そんな会話が挨拶代わりに交わされる世界。[p]
その圧力は、公的な罰則よりも重く、粘着質な自己否定となって僕の胃を締め上げる。[p]
; モノローグ


[playse  storage="僕のスコアは&nbsp;72&nbsp;。...このままでは、社会から期待されない『平凡以下の不良資産（バッド・アセット）』として、この都市の光の届かない隅で埋もれてしまうだろう。.mp3"  ]

#モノローグ
僕のスコアは72。平均以下だ。[p]
同僚たちは着実に昇進リストに名を連ねていく中、[p]


[r]


僕は卒業研究のテーマすら決まらず、日々の雑務に忙殺されている。[p]
このままでは、社会から期待されない「平凡以下の不良資産（バッド・アセット）」として、[p]


[r]


この都市の光の届かない隅で埋もれてしまうだろう。[p]
; モノローグ


[playse  storage="常に感じる、喉の奥に張り付いたような焦燥感と自己嫌悪。...誰かに、正解を教えて欲しかった。.mp3"  ]

#モノローグ
常に感じる、喉の奥に張り付いたような焦燥感と自己嫌悪。[p]
「変わりたい」 その思いだけが空回りして、何一つ行動に移せない。[p]
何とかして、この無力な日常の閉塞感から、自分の意志で抜け出したかった。[p]


[r]


誰かに、正解を教えて欲しかった。[p]
; SE：ポップアップ


[stopse  ]
[playse  storage="SE08&nbsp;スマホタップ音.mp3"  ]

#
スマホ画面に『tasky』のアイコンが不気味に拡大表示される。[p]
; taskyボイス


[playse  storage="まだ、迷っているのですか？&nbsp;あなたの内なる可能性を引き出し、埋もれた努力を数値で証明します。...あなたの人生を変える、最初で最後の一歩を.mp3"  ]

#tasky (広告音声)
『まだ、迷っているのですか？[p]


[r]


あなたの内なる可能性を引き出し、埋もれた努力を数値で証明します。[p]
自己管理AIアプリ『tasky』。[p]


[r]


今ならインストール無料。あなたの人生を変える、最初で最後の一歩を』[p]
; モノローグ


[playse  storage="SNS&nbsp;のタイムラインが、tasky&nbsp;の広告で埋め尽くされている。...僕は&nbsp;tasky&nbsp;に、僕の人生の主導権を委ねてみようと決めた。.mp3"  ]

#モノローグ
SNSのタイムラインが、taskyの広告で埋め尽くされている。[p]


[r]


まるで、僕の深夜の苦悩を見透かしたかのように。[p]
友人も、同僚も、皆これを使っているという。[p]
これが、最後のチャンスかもしれない。[p]


[r]


藁にもすがる思いで、震える指先を画面に伸ばす。[p]
僕はtaskyに、僕の人生の主導権を委ねてみようと決めた。[p]


[glink  color="blue"  size="24"  x="360"  width="400"  y="250"  text="【インストールする】"  target="*install_seq"  ]
[s  ]
*install_seq


; SE：インストール音


[playse  storage="SE01インストール音_起動音.mp3"  ]

; 演出


[mask  effect="fadeIn"  color="0xffffff"  time="200"  ]
[bg  storage="blue_screen_night.jpg"  time="0"  ]
[mask_off  effect="fadeOut"  time="1000"  ]

; ▼ tasky立ち絵


[chara_show  name="tasky"  time="1000"  ]

; taskyボイス


[playse  storage="ようこそ、ユーザーID：404。...完了してください。.mp3"  ]

#tasky
ようこそ、ユーザーID：404。[p]
私はあなたの生産性を最大限に引き出し、理想の自己へと導くパートナーです。[p]


[r]


あなたの無駄を削ぎ落とし、幸福への最短ルートを計算します。[p]
#tasky
初回起動タスク：『自己紹介の承認』を認識しました。[p]


[r]


完了してください。[p]


[glink  color="blue"  size="24"  x="360"  width="400"  y="250"  text="【承認する】"  target="*approve_seq"  ]
[s  ]
*approve_seq


; SE：通知音


[playse  storage="SE02通常通知音.mp3"  ]

; モノローグ


[playse  storage="「承認」ボタンをタップした瞬間、全身が電流に打たれたように痺れ、そして同時に重荷が消え去ったような浮遊感を覚えた。...新しい僕を。.mp3"  ]

#モノローグ
「承認」ボタンをタップした瞬間、全身が電流に打たれたように痺れ、[p]


[r]


そして同時に重荷が消え去ったような浮遊感を覚えた。[p]
「素晴らしい判断です」……画面に表示されたその文字。[p]


[r]


そんなポジティブな肯定の言葉、最近誰からもかけられていなかった。[p]
まるで、生まれたての赤ちゃんのように、世界が輝いて見えた。[p]


[r]


これで、僕もあの光を手に入れられる。[p]
さあ、始めよう。新しい僕を。[p]


[jump  storage="chapter1.ks"  target=""  ]
[s  ]
