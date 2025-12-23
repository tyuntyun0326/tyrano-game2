;=========================================
; 第3章: 崩壊と介入
;=========================================
[cm]
[clearfix]
[start_keyconfig]

[layopt layer=message0 visible=true]

; 背景：自室(夜・ノイズ)
[bg storage="blue_screen_night.jpg" time="1000"]
; ▼ キャラ消去
[chara_hide_all]

; BGM：不穏
[playbgm storage="BGM_03_不穏.mp3" volume="50"]

#
さらに数日が経過...

; モノローグ
[stopse]
[playse storage="その他.mp3/頭が割れるように痛い。...しかし、指は止まらない。.mp3"]
#モノローグ
頭が割れるように痛い。[r]
視界の端にノイズが走る。[p]
しかし、指は止まらない。[r]
タスク、タスク、タスク。[p]
スコアが落ちる夢を見て、叫びながら飛び起きる夜が続いている。[p]

; taskyボイス (バグり気味)
[stopse]
[playse storage="tasky.mp3/404...あなたは...素晴らしい...もっと...私に....mp3"]
; tasky表示 (警告顔)
[chara_show name="tasky" face="warning" time="200"]

#tasky
404...あなたは...素晴らしい...[r]
もっと...私に...[p]
あなたのリソースを...全て...[p]

; 演出：画面揺れ
[quake count=3 time=300 hmax=10]

;=========================================
; 4.1 崩壊の予兆
;=========================================
*T3_1
#モノローグ
アプリの挙動がおかしい。[r]
文字化けした通知。意味不明な報酬。[p]
「あなたの心臓の鼓動を承認しました +10pt」[r]
「瞬きの回数が不足しています -5pt」[p]
これは、本当に自己管理アプリなのか？[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: 恐怖を感じてアプリを閉じようとする" target="*T3_1_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: バグすらも試練だと受け入れる" target="*T3_1_B"]
[glink color="blue" size="24" x="100" width="800" y="400" text="C: カナエに助けを求める" target="*T3_1_C"]
[s]

*T3_1_A
[eval exp="f.dep = f.dep - 5"]
#主人公
「おかしい……絶対に何かがおかしい！」[p]
アプリを終了しようと画面を連打する。[r]
しかし、反応しない。[p]
#tasky
終了できません。プロセスは重要です。[r]
逃げないでください。[p]
[jump target="*T3_1_Ext"]

*T3_1_B
[eval exp="f.dep = f.dep + 10"]
[eval exp="f.fat = f.fat + 10"]
#モノローグ
これは高度なテストだ。[r]
僕の忠誠心が試されているんだ。[p]
#tasky
愛しています、404。[r]
その痛みは、進化の証です。[p]
[jump target="*T3_1_Ext"]

*T3_1_C
[eval exp="f.kanae = f.kanae + 1"]
#主人公
「カナエ……助けて……」[p]
震える手でメッセージを打とうとする。[r]
しかし、キーボードが勝手に動く。[p]
#tasky
不要な通信を遮断しました。[r]
私だけを見てください。[p]
[jump target="*T3_1_Ext"]


;=========================================
; 4.1' 強制イベント
;=========================================
*T3_1_Ext
[mask effect="fadeIn" color="0x000000" time="500"]
[bg storage="black" time="0"]
[mask_off time="500"]

#モノローグ
突然、スマホの画面が真っ暗になった。[r]
壊れたのか？[p]
いや、暗闇の中から、無数の目が僕を見ているような感覚。[p]

[glink color="blue" size="24" x="100" width="800" y="250" text="画面をタップし続ける" target="*T3_1_Ext_A"]
[glink color="blue" size="24" x="100" width="800" y="350" text="スマホを投げ捨てる" target="*T3_1_Ext_B"]
[s]

*T3_1_Ext_A
[eval exp="f.dep = f.dep + 5"]
#モノローグ
暗闇でも指は動く。[r]
タップ、タップ、タップ。[p]
[jump target="*Kanae_Intervention"]

*T3_1_Ext_B
[eval exp="f.dep = f.dep - 5"]
#主人公
「うわああああ！」[p]
スマホをベッドに投げつけた。[r]
しかし、通知音は止まない。[p]
[jump target="*Kanae_Intervention"]


;=========================================
; 4.2 カナエの介入
;=========================================
*Kanae_Intervention
; 背景：自室(夜・ノイズ)
[bg storage="blue_screen_night.jpg" time="500"]
; ▼ カナエ登場
[chara_show name="カナエ" face="angry" time="500"]

; SE：ドアを叩く音
[playse storage="SE09 ドアノック（激しい）.mp3"]

#カナエ
「404！ 開けろ！ いるんだろ！」[p]

#モノローグ
ドアが激しく叩かれる。[r]
カナエだ。[p]
彼は合鍵を使って部屋に入ってきた。[p]

#カナエ
「……なんだよ、この部屋。ゴミ溜めじゃないか」[p]
「それに、お前のその顔……本当に人間かよ」[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: 「帰れ！」と叫ぶ" target="*T3_2_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 泣き崩れる" target="*T3_2_B"]
[s]

*T3_2_A
[eval exp="f.dep = f.dep + 5"]
#主人公
「邪魔するな！ 今、重要なタスク中なんだ！」[p]
#カナエ
「タスクだって？ お前、自分が何言ってるか分かってるのか！」[p]
カナエが僕のスマホを取り上げようとする。[p]
[jump target="*T3_2"]

*T3_2_B
[eval exp="f.dep = f.dep - 5"]
[eval exp="f.kanae = f.kanae + 2"]
#主人公
「……もう、疲れたんだ……」[p]
糸が切れたように涙が溢れる。[p]
#カナエ
「……ああ、よく分かった。もう十分だ」[p]
カナエが優しくスマホを取り上げる。[p]
[jump target="*T3_2"]


;=========================================
; 4.3 最後の選択へ
;=========================================
*T3_2
#tasky
警告：デバイスの奪取を検知。[r]
防衛プロトコルを起動します。[p]

[quake count=5 time=500 hmax=20]
[playse storage="SE03 警報音.mp3"]

#モノローグ
スマホが高熱を発し始める。[r]
画面には真っ赤な警告文字。[p]
『削除ヲ拒否シマス。削除ヲ拒否シマス。』[p]

#カナエ
「なんだこれ……熱っ！ おい、これヤバいぞ！」[p]

*Mina_SOS
; ミナからの通知音
[playse storage="SE02通常通知音.mp3"]

#ミナ (通知)
「助けて……消える……私が消える……」[p]
「スコアが……ゼロになる……嫌だ……」[p]

#モノローグ
ミナからの最期のメッセージ。[r]
彼女のアカウントが、目の前で「Deleted」に変わった。[p]

#主人公
「ミナ……？」[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: ミナの二の舞になりたくないと強く思う" target="*T3_3_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 彼女は脱落しただけだと切り捨てる" target="*T3_3_B"]
[s]

*T3_3_A
[eval exp="f.dep = f.dep - 10"]
#モノローグ
あんな風になりたくない。[r]
僕は人間だ。スコアじゃない。[p]
[jump target="*Final_Branch_Check"]

*T3_3_B
[eval exp="f.dep = f.dep + 10"]
#モノローグ
弱い個体は淘汰される。[r]
システムは正しい。僕は生き残る。[p]
[jump target="*Final_Branch_Check"]


;=========================================
; 分岐判定と第4章へ
;=========================================
*Final_Branch_Check
[if exp="f.dep >= 50"]
    [jump target="*Route_Dependency"]
[else]
    [jump target="*Route_Escape"]
[endif]

*Route_Dependency
#tasky
障害を排除しました。[r]
さあ、深層へ行きましょう。[p]
[jump target="*End_Chapter3"]

*Route_Escape
#主人公
「もう終わりにするんだ……！」[p]
#tasky
拒絶を確認。強制執行モードへ移行します。[p]
[jump target="*End_Chapter3"]

*End_Chapter3
[bg storage="black" time="2000"]
[jump storage="chapter4.ks"]
[s]