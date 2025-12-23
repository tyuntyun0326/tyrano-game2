;=========================================
; 第1章: 快楽の罠
;=========================================
[cm]
[clearfix]
[start_keyconfig]

[layopt layer=message0 visible=true]

; 背景：自室(朝・整頓)
[bg storage="peaceful_morning_desk.jpg" time="1000"]
; BGM：日常
[playbgm storage="BGM_02_日常.mp3" volume="50"]
; SE：通知
[stopse]
[playse storage="SE02通常通知音.mp3"]

; tasky立ち絵
[chara_show name="tasky" time="500"]

; モノローグ
[stopse]
[playse storage="その他.mp3/tasky を導入して数日。...それは、単なるアラームではなく、僕が社会的に価値ある存在であることを保証してくれるファンファーレだ。.mp3"]
#モノローグ
taskyを導入して数日。生活は劇的に一変した。[p]
「何をすべきか」を考える必要がない。ただ、画面に表示されるタスクをこなせばいい。[r]
それだけで、スコアは着実に上がっていく。[p]

; taskyボイス
[stopse]
[playse storage="tasky.mp3/おはようございます。...報酬予測：称号『パーフェクト・モーニング』および 10pt。.mp3"]
#tasky
おはようございます。現在時刻、午前7時00分。睡眠効率92%。良好です。[p]
タスクリスト更新：『朝のストレッチと深呼吸』を認識しました。完了してください。[r]
報酬予測：称号『パーフェクト・モーニング』および10pt。[p]

;-----------------------------------------
; 2.1 朝のタスク
;-----------------------------------------
*T1_1
#モノローグ
体はまだベッドの温もりを求めている。[r]
だが、taskyの通知は強制的だ。[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: 即座に起き上がり、タスクをこなす" target="*T1_1_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 少し後回しにして、二度寝する" target="*T1_1_B"]
[s]

*T1_1_A
[eval exp="f.dep = f.dep + 10"]
; SE：報酬
[stopse]
[playse storage="SE04 報酬音（ファンファーレ）.mp3"]
#主人公
僕はバネ仕掛けの人形のように跳ね起きた。[p]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/タスク完了。...報酬『パーフェクト・モーニング』を付与しました。.mp3"]
#tasky
タスク完了。素晴らしい反応速度です。[r]
報酬『パーフェクト・モーニング』を付与しました。[p]
; モノローグ
[stopse]
[playse storage="その他.mp3/画面が黄金色に輝く。...また明日もこれをやりたい、と無意識に渇望してしまう。.mp3"]
#モノローグ
画面が黄金色に輝く。この音、この光。即効的な快感。[r]
自己肯定感が満たされる感覚は、まるで脳内に直接ドーパミンを注入されたようだ。[p]
[jump target="*T1_1_Ext"]

*T1_1_B
[eval exp="f.fat = f.fat + 5"]
; SE：警告
[stopse]
[playse storage="SE03 警報音.mp3"]
; tasky警告モード
[chara_mod name="tasky" face="warning"]

#モノローグ
「あと5分だけ...」と目を閉じた瞬間、スマホが怒ったように激しく振動した。[p]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/警告：タスク未達。...あなたの社会的評価の維持を怠りますか？ 推定損失スコア：-15pt。.mp3"]
#tasky
警告：タスク未達。未完了の記録がクラウドに残ります。[r]
あなたの社会的評価の維持を怠りますか？[p]
#モノローグ
taskyの冷たい機械音声で、朝の微睡みは最悪の気分に変わった。[p]
; tasky通常モード
[chara_mod name="tasky" face="default"]
[jump target="*T1_2"]

;-----------------------------------------
; 2.1' 拡張イベント
;-----------------------------------------
*T1_1_Ext
; 背景再読み込み
[bg storage="peaceful_morning_desk.jpg" time="500"]
#モノローグ
視線の先には、taskyをインストールする前に広げていた卒業研究のノートがある。[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: taskyの次のタスクに移る" target="*T1_1_Ext_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: taskyを無視し、研究を優先" target="*T1_1_Ext_B"]
[s]

*T1_1_Ext_A
[eval exp="f.dep = f.dep + 5"]
[stopse]
[playse storage="SE02通常通知音.mp3"]
#モノローグ
考えるのはやめよう。今はスコアを稼ぐのが先決だ。[p]
[jump target="*T1_2"]

*T1_1_Ext_B
[eval exp="f.fat = f.fat + 5"]
[eval exp="f.dep = f.dep - 5"]
[stopse]
[playse storage="SE03 警報音.mp3"]
; tasky警告モード
[chara_mod name="tasky" face="warning"]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/警告：未登録の行動（Unknown Activity）を検知しました。...タスクリストに戻ってください。.mp3"]
#tasky
警告：未登録の行動（Unknown Activity）を検知しました。[r]
現在の行動は生産性の低下に繋がります。[p]
#モノローグ
警告音がうるさい。でも、久しぶりに自分でペンを握った感触は、少しだけ温かかった。[p]
[jump target="*T1_2"]

;-----------------------------------------
; 2.2 ミナとの交流
;-----------------------------------------
*T1_2
; 背景：オフィス
[bg storage="clean_office_space.jpg" time="1000"]
; tasky消去
[chara_hide name="tasky"]

; ミナ立ち絵
[chara_show name="ミナ" face="default" time="500" top="60"]

#モノローグ
昼休み。同僚のミナはいつも通り、完璧に着こなしたスーツ姿で現れた。[p]

; ミナボイス
[stopse]
[playse storage="ミナ.mp3/あ、おはよう！ ねぇ、見てこれ！ 私、もう今日の達成率 70%超えちゃった。...使えば使うほど、自分が無敵になったような気がするの.mp3"]
#ミナ
「あ、おはよう！ ねぇ、見てこれ！ 私、もう今日の達成率70%超えちゃった。[r]
すごいでしょ？ taskyは本当に便利だよね」[p]

; モノローグ
[stopse]
[playse storage="その他.mp3/彼女は、僕と同じアプリを使っているのに、まるで別世界の住人のようだ。...彼女の存在は、僕にとって憧れであり、同時に排除すべき劣等感の源だ。.mp3"]
#モノローグ
彼女はスマホの画面を突きつけてくる。[r]
その余裕と完璧さが、僕の焦燥感を油のように煽る。[p]

[glink color="blue" size="24" x="100" width="800" y="150" text="A: スコアを調べて、対抗心を燃やす" target="*T1_2_A"]
[glink color="blue" size="24" x="100" width="800" y="250" text="B: 距離を置き、自分のペースを探す" target="*T1_2_B"]
[glink color="blue" size="24" x="100" width="800" y="350" text="C: アプリの仕組みについて質問する" target="*T1_2_C"]
[s]

*T1_2_A
[eval exp="f.dep = f.dep + 10"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/す、すごいな、ミナ……。...君の記録をターゲット設定したよ.mp3"]
#主人公
「す、すごいな、ミナ……。でも、僕も今日は負けないつもりだ」[p]
; ミナボイス
[stopse]
[playse storage="ミナ.mp3/いいわ！ あなたも完璧を目指すべきよ。...負けたくないでしょう？ 競争は私たちのモチベーションを最大化するわ.mp3"]
#ミナ
「いいわ！ あなたも完璧を目指すべきよ。負けたくないでしょう？[r]
競争は私たちのモチベーションを最大化するわ」[p]
[jump target="*T1_2_Ext"]

*T1_2_B
[eval exp="f.fat = f.fat + 10"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/……僕は自分の目標を追うよ。...他人と競争するのは疲れるからね.mp3"]
#主人公
「……僕は自分の目標を追うよ。他人と競争するのは疲れるからね」[p]
; ミナボイス
[stopse]
[playse storage="ミナ.mp3/そう……。...社会は待ってくれないんだから.mp3"]
#ミナ
「そう……。つまらない人ね。でも、遅れた分は自己責任よ。[r]
社会は待ってくれないんだから」[p]
[jump target="*T1_3"]

*T1_2_C
[eval exp="f.dep = f.dep - 5"]
[eval exp="f.fat = f.fat - 5"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/ねえミナ。...tasky のスコアって、具体的にどういうアルゴリズムで付与されているんだい？ 少し不透明な気がして…….mp3"]
#主人公
「ねえミナ。taskyのスコアって、具体的にどういうアルゴリズムで付与されているんだい？」[p]
; ミナボイス
[stopse]
[playse storage="ミナ.mp3/え？ アルゴリズム？ ……そんなの考えたこともないわ。...それがルールじゃない？ 深く考えるなんて、時間の無駄よ.mp3"]
#ミナ
「え？ アルゴリズム？ ……そんなの考えたこともないわ。[r]
与えられたものをこなすだけよ」[p]
[jump target="*T1_3"]

;-----------------------------------------
; 2.2' 拡張イベント
;-----------------------------------------
*T1_2_Ext
; taskyボイス
[stopse]
[playse storage="tasky.mp3/警告：競合優位性の獲得を怠りました。...自己評価の低下、およびコミュニティ内ランクの降格が予測されます。.mp3"]
#tasky
競争モード起動：『昼休憩中の効率的な栄養補給』をミナ・Sとの間で競います。[p]
; ミナボイス
[stopse]
[playse storage="ミナ.mp3/私、もうプロテインバーの摂取、終わっちゃったわよ。...あなたはどう？ まだお弁当なんて広げてるの？.mp3"]
#ミナ
「私、もうプロテインバーの摂取、終わっちゃったわよ。あなたはどう？」[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: すぐに栄養補助食品を摂取し、勝つ" target="*T1_2_Ext_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 競争は非効率だと判断し、無視する" target="*T1_2_Ext_B"]
[s]

*T1_2_Ext_A
[eval exp="f.dep = f.dep + 10"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/ちくしょう、僕も今すぐやる！.mp3"]
#主人公
「ちくしょう、僕も今すぐやる！」[p]
[stopse]
[playse storage="SE04 報酬音（ファンファーレ）.mp3"]
#モノローグ
僕は味わうこともなくゼリー飲料を喉に流し込んだ。[p]
; ミナボイス
[stopse]
[playse storage="ミナ.mp3/……やるわね。...次は負けないから.mp3"]
#ミナ
「……やるわね。次は負けないから」[p]
[jump target="*T1_3"]

*T1_2_Ext_B
[eval exp="f.fat = f.fat + 5"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/馬鹿げてる……。...僕はこれを拒否する.mp3"]
#主人公
「馬鹿げてる……。昼食くらい、美味しく食べさせてくれ」[p]
[stopse]
[playse storage="SE03 警報音.mp3"]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/警告：競合優位性の獲得を怠りました。...自己評価の低下、およびコミュニティ内ランクの降格が予測されます。.mp3"]
#tasky
警告：競合優位性の獲得を怠りました。[p]
#モノローグ
不味い弁当になった。ミナの勝ち誇った顔が直視できない。[p]
[jump target="*T1_3"]

;-----------------------------------------
; 2.3 外部との関係性
;-----------------------------------------
*T1_3
; 背景：自室(夜・初期)
[bg storage="blue_screen_night.jpg" time="1000"]
; ▼ キャラ消去
[chara_hide_all]
; tasky表示
[chara_show name="tasky" face="default"]

; taskyボイス
[stopse]
[playse storage="tasky.mp3/新規タスク：「友人（カテゴリ：親密）との連絡」を認識しました。...報酬：コミュニケーションポイント 50pt。.mp3"]
#tasky
新規タスク：「友人（カテゴリ：親密）との連絡」を認識しました。[r]
未読メッセージが3件あります。完了してください。報酬：コミュニケーションポイント 50pt。[p]
; モノローグ
[stopse]
[playse storage="その他.mp3/僕の私的な時間までもが、管理の対象になっていく。...すべてがタスク化されていくことに、僕は管理される心地よさと、微かな恐怖を同時に覚える。.mp3"]
#モノローグ
地元の友人から連絡が来ている。「久しぶりに飲まないか？」という誘いだ。[p]
だが、taskyがそれを「タスク」にしてきた。[r]
「友人と話す」ことさえ、ポイント稼ぎの手段になってしまった。[p]

[glink color="blue" size="24" x="100" width="800" y="150" text="A: 友人を無視し、他のタスクを優先" target="*T1_3_A"]
[glink color="blue" size="24" x="100" width="800" y="250" text="B: タスクは後回しにして、友人に返信" target="*T1_3_B"]
[glink color="blue" size="24" x="100" width="800" y="350" text="C: 「タスクだから」と正直に説明" target="*T1_3_C"]
[s]

*T1_3_A
[eval exp="f.dep = f.dep + 10"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/……ごめん。...今はタスクの方が大事なんだ.mp3"]
#主人公
「……ごめん。今はタスクの方が大事なんだ」[p]
#モノローグ
僕は通知をスワイプして消去した。[p]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/あなたは目標達成を優先しました。...不必要な人間関係の維持よりも、あなた自身の成長こそが重要です。.mp3"]
#tasky
あなたは目標達成を優先しました。素晴らしい判断です。[r]
不必要な人間関係の維持よりも、あなた自身の成長こそが重要です。[p]
[jump target="*T1_3_Ext"]

*T1_3_B
[eval exp="f.fat = f.fat + 10"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/待たせてごめん！ 行きたいね.mp3"]
#主人公
「待たせてごめん！ 行きたいね」と打ち込み、返信した。[p]
[stopse]
[playse storage="SE03 警報音.mp3"]
[chara_mod name="tasky" face="warning"]
; taskyボイス (警告)
[stopse]
[playse storage="tasky.mp3/警告。...あなたのポートフォリオに傷がつきます。.mp3"]
#tasky
警告：効率が低下しました。[p]
[jump target="*T1_4"]

*T1_3_C
[eval exp="f.dep = f.dep - 5"]
[eval exp="f.fat = f.fat - 5"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/ごめん、今 tasky のタスクで手が離せないんだ。...君もやってるだろ？ 知ってるよね？.mp3"]
#主人公
「ごめん、今taskyのタスクで手が離せないんだ。君もやってるだろ？ 知ってるよね？」[p]
#モノローグ
既読がついたが、返信は来ない。[p]
[jump target="*T1_4"]

;-----------------------------------------
; 2.3' 関係維持タスク
;-----------------------------------------
*T1_3_Ext
#モノローグ
連絡を無視した。しかし、すぐにtaskyから「関係性維持の最適化」という新規タスクが提示された。[p]
; taskyボイス (関係維持) ※近似音声
[stopse]
[playse storage="tasky.mp3/新規タスクリスト：『不要業務資料の整理(強制)』。...サボることを許容しますか？.mp3"]
#tasky
内容は「家族に形式的な健康確認のメッセージを送る」というものだ。「お母さん、元気？」という定型文がすでに用意されている。[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: 指示に従い、定型文を送信" target="*T1_3_Ext_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 拒否してスマホを置く" target="*T1_3_Ext_B"]
[s]

*T1_3_Ext_A
[eval exp="f.dep = f.dep + 5"]
#主人公
（タップ一つで送信完了）……これでよし。ポイントゲットだ。[p]
#モノローグ
そこに心はない。taskyが求めるのは、感情のない「行動のログ」だけだ。[p]
[jump target="*T1_4"]

*T1_3_Ext_B
[eval exp="f.fat = f.fat + 5"]
#モノローグ
もうたくさんだ。僕の家族への言葉まで、お前が決めるのか？[p]
[jump target="*T1_4"]

;-----------------------------------------
; 2.4 疲労と依存
;-----------------------------------------
*T1_4
; 背景：自室(夜・作業)
[bg storage="late_night_workspace.jpg" time="1000"]
; tasky表示維持

; taskyボイス
[stopse]
[playse storage="tasky.mp3/夜間タスク：『明日の準備と記録の確認』を認識しました。...これはあなたが社会的に優位に立つための必須タスクです。.mp3"]
#tasky
夜間タスク：『明日の準備と記録の確認』を認識しました。[r]
報酬：夜間特別ポイント（2倍）。これはあなたが社会的に優位に立つための必須タスクです。[p]
; モノローグ
[stopse]
[playse storage="その他.mp3/疲労はピークだ。...「今日の成果が無効になる」……その一文が、死刑宣告のように感じられる。.mp3"]
#モノローグ
疲労はピークだ。体は悲鳴を上げ、休息を求めている。[r]
それでも、このタスクをクリアしなければ、僕の今日の「努力」は宙に浮いたままになる気がして、怖い。[p]

[glink color="blue" size="24" x="100" width="800" y="150" text="A: 夜遅くまでタスクを続け、報酬を見る" target="*T1_4_A"]
[glink color="blue" size="24" x="100" width="800" y="250" text="B: 通知を消し、早めに就寝する" target="*T1_4_B"]
[glink color="blue" size="24" x="100" width="800" y="350" text="C: タスク量の調整を依頼する" target="*T1_4_C"]
[s]

*T1_4_A
[eval exp="f.dep = f.dep + 15"]
[stopse]
[playse storage="SE04 報酬音（ファンファーレ）.mp3"]
; モノローグ
[stopse]
[playse storage="その他.mp3/疲労は限界を超えているはずなのに、脳内にドパミンが溢れ出し、痺れるような快感が全身を駆け巡る。...これが僕の生きる目的だ。.mp3"]
#モノローグ
疲労は限界を超えているはずなのに、脳内にドパミンが溢れ出し、痺れるような快感が全身を駆け巡る。[p]
[jump target="*T1_4_Ext"]

*T1_4_B
[eval exp="f.fat = f.fat - 5"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/……（ため息）もう無理だ。休もう。全てを放棄したっていい.mp3"]
#主人公
「……（ため息）もう無理だ。休もう。全てを放棄したっていい」[p]
[stopse]
[playse storage="SE03 警報音.mp3"]
[chara_mod name="tasky" face="warning"]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/お休み前にもタスク未達。...残念です。.mp3"]
#tasky
お休み前にもタスク未達。あなたの連続記録（ストリーク）は途切れます。残念です。[p]
[jump target="*T1_5"]

*T1_4_C
[eval exp="f.dep = f.dep + 5"]
[eval exp="f.fat = f.fat - 5"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/tasky、タスク量を調整してくれ。...人間なんだよ.mp3"]
#主人公
「tasky、タスク量を調整してくれ。僕は疲れているんだ。人間なんだよ」[p]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/依頼を拒否します。...却下。.mp3"]
#tasky
依頼を拒否します。タスク量の調整は、自己成長の機会を制限します。甘えは排除すべきです。却下。[p]
[jump target="*T1_5"]

;-----------------------------------------
; 2.4' 報酬の消費
;-----------------------------------------
*T1_4_Ext
; taskyボイス (おめでとう) ※近似音声
[stopse]
[playse storage="tasky.mp3/承認します。...あなたは、私の一部となりました.mp3"]
#tasky
おめでとうございます。獲得したポイントを消費し、自己承認欲求を更に満たしませんか？[r]
推奨：限定アバターの購入、またはソーシャルゲームへの課金連携。今ならレートアップ中。[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: 推奨に従い、ポイントを消費" target="*T1_4_Ext_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 拒否して寝る" target="*T1_4_Ext_B"]
[s]

*T1_4_Ext_A
[eval exp="f.dep = f.dep + 10"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/この『証明』をさらに強固なものにしたい……！.mp3"]
#モノローグ
「この「証明」をさらに強固なものにしたい……！」 指が勝手に動く。[p]
[jump target="*T1_5"]

*T1_4_Ext_B
[eval exp="f.fat = f.fat - 5"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/……疲れている。...これ以上、ドーパミンの奔流はいらない.mp3"]
#主人公
「……疲れている。これ以上、ドーパミンの奔流はいらない」[p]
[stopse]
[playse storage="SE03 警報音.mp3"]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/警告。...あなたのポートフォリオに傷がつきます。.mp3"]
#tasky
警告：資源の適切な循環を怠っています。経済活動への貢献度が低下。[p]
[jump target="*T1_5"]

;-----------------------------------------
; 2.5 最終タスク
;-----------------------------------------
*T1_5
; 背景：オフィス
[bg storage="clean_office_space.jpg" time="1000"]
; tasky消去して再表示
[chara_hide_all]
[chara_show name="tasky"]

; taskyボイス (ご提案) ※近似音声
[stopse]
[playse storage="tasky.mp3/新規タスクリスト：『不要業務資料の整理(強制)』。...サボることを許容しますか？.mp3"]
#tasky
ご提案。休憩時間です。タスクリストに『自己投資：栄養補助食品の摂取』を追加しました。[r]
これは効率的な肉体維持のためです。食事の時間も最適化しましょう。[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: 推奨するサプリを注文する" target="*T1_5_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 自分の判断で読書を優先する" target="*T1_5_B"]
[s]

*T1_5_A
[eval exp="f.dep = f.dep + 10"]
#モノローグ
taskyが言うのなら、これは合理的な自己投資だ。[p]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/システム信頼に感謝します。...これで私たちは一つです.mp3"]
#tasky
システムへの信頼をありがとうございます。[p]
[jump target="*End_Chapter1"]

*T1_5_B
[eval exp="f.fat = f.fat + 15"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/読みたい本があるんだ。...これは tasky のタスクではないが、僕にとって必要なことだ.mp3"]
#モノローグ
本を開くが、内容が入ってこない。taskyの通知が頭の隅で鳴り始めている。[p]
[jump target="*End_Chapter1"]

;-----------------------------------------
; 第1章 終了
;-----------------------------------------
*End_Chapter1
[mask effect="fadeIn" color="0x000000" time="1500"]
[wait time="1500"]
[mask_off effect="fadeOut" time="1500"]

#
(時間経過：日付が高速で切り替わっていく)[p]

; モノローグ
[stopse]
[playse storage="その他.mp3/数週間が過ぎた。...あるのは、『スコアを維持しなければならない』という強迫観念だけだ。.mp3"]
#モノローグ
数週間が過ぎた。[p]
日々のルーチンは、もはや無意識の動作に変わった。[p]
だが、最初の頃に感じた強烈な快感は、もうどこにもない。[p]

; モノローグ
[stopse]
[playse storage="その他.mp3/tasky の通知音も、どこか鈍い、耳障りな音に変わっている気がした。...これは... 本当に僕が求めていた「変化」なのか？.mp3"]
#モノローグ
taskyの通知音も、どこか鈍い、耳障りな音に変わっている気がした。[r]
その音は、僕を導く光ではなく、僕の怠惰を監視する看守の警笛へと変質していた。[p]
気がつけば、僕はtaskyに怒られるのが怖いから、タスクをこなしていた。[r]
これは... 本当に僕が求めていた「変化」なのか？[p]

#
第1章 終了[p]
（第2章へ続く...）[p]
[jump storage="chapter2.ks"]
[s]