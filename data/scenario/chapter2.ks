;=========================================
; 第2章: 義務感と乖離
;=========================================
[cm]
[clearfix]
[start_keyconfig]

[layopt layer=message0 visible=true]

; 背景：自室(夜・荒廃)
[bg storage="cluttered_busy_desk.jpg" time="1000"]
; ▼ キャラ消去
[chara_hide_all]

; BGM：日常
[playbgm storage="BGM_02_日常.mp3" volume="50"]

#
(数週間後...)

; モノローグ
[stopse]
[playse storage="その他.mp3/最初の頃のような、脳が痺れるような快感はもうない。...あるのは、「やらなければならない」という強迫観念だけだ。.mp3"]
#モノローグ
報酬は「小さな満足」。その文字が、僕の心を乾いたスポンジのように虚しくさせる。[p]
最初の頃のような、脳が痺れるような快感はもうない。[r]
あるのは、「やらなければならない」という強迫観念だけだ。[p]

タスクリストは、僕が興味のない、システムが強いる義務で埋め尽くされている。[r]
『不要業務資料の整理』、『上司への定型的な機嫌伺い』……[p]
まるで、退屈な仕事の延長がプライベートまで侵食してきたようだ。[p]

; SE：警告
[stopse]
[playse storage="SE03 警報音.mp3"]

; tasky警告表示
[chara_show name="tasky" face="warning"]

; taskyボイス
[stopse]
[playse storage="tasky.mp3/警告レベル 1：ドーパミン受容体の感度低下を検知。...本日の報酬設定を『小さな満足』に変更しました。.mp3"]
#tasky
警告レベル1：ドーパミン受容体の感度低下を検知。[r]
本日の報酬設定を『小さな満足』に変更しました。[p]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/新規タスクリスト：『不要業務資料の整理(強制)』。...サボることを許容しますか？.mp3"]
#tasky
新規タスクリスト：『不要業務資料の整理(強制)』。あなたには義務があります。[r]
サボることを許容しますか？[p]

;-----------------------------------------
; 3.1 心理状態の分岐判定
;-----------------------------------------
[if exp="f.dep > f.fat && f.dep > 30"]
    [eval exp="f.state = 'A'"]
[elsif exp="f.fat > f.dep && f.fat > 30"]
    [eval exp="f.state = 'B'"]
[elsif exp="f.dep > 30 && f.fat > 30"]
    [eval exp="f.state = 'C'"]
[else]
    [eval exp="f.state = 'D'"]
[endif]

[if exp="f.state == 'A'"]
    #モノローグ
    （報酬が減っても構わない。重要なのは、スコアが示す私自身の価値だ。[r]
    この苦痛こそが、僕を他人より優れた存在にするための通過儀礼なのだ）[p]
[elsif exp="f.state == 'B'"]
    #モノローグ
    （疲れている。体が鉛のように重い。指一本動かすのも億劫だ。[r]
    しかし、やめられない）[p]
[elsif exp="f.state == 'C'"]
    #モノローグ
    （快感と疲労が頭の中で衝突し、意識が混乱している。[r]
    何のために動いているか分からない。ただ、通知音が鳴ると条件反射で体が動く）[p]
[else]
    #モノローグ
    （このアプリは、ただのツールに過ぎないはずだ。[r]
    なぜ皆、たかが数字のスコアにそこまで固執するんだ？）[p]
[endif]


;=========================================
; 3.2 義務的なタスク
;=========================================
*T2_1
#モノローグ
目を閉じても、瞼の裏にはタスクリストのチェックマークが焼き付いている。[r]
やらなければならない。やらなければならない。強迫的なリズムが鼓動と重なる。[p]

[glink color="blue" size="24" x="100" width="800" y="150" text="A: タスクを完了し、早く終わらせる" target="*T2_1_A"]
[glink color="blue" size="24" x="100" width="800" y="250" text="B: タスクを無視し、趣味に時間を使う" target="*T2_1_B"]
[glink color="blue" size="24" x="100" width="800" y="350" text="C: タスクに潜む意味を考える" target="*T2_1_C"]
[s]

*T2_1_A
[eval exp="f.dep = f.dep + 10"]
[stopse]
[playse storage="SE02通常通知音.mp3"]
#モノローグ
達成率こそ私の価値だ。疲労など、成功への必要経費に過ぎない。[p]
[jump target="*T2_1_Ext"]

*T2_1_B
[eval exp="f.fat = f.fat + 15"]
[stopse]
[playse storage="SE03 警報音.mp3"]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/あなたの価値が失効します。...無駄な時間を過ごすことを選択しますか？.mp3"]
#tasky
あなたの価値が失効します。無駄な時間を過ごすことを選択しますか？[p]
#tasky
記録が失効します。あなたは敗北者ですよ。[p]
[jump target="*T2_2"]

*T2_1_C
[eval exp="f.dep = f.dep - 5"]
[eval exp="f.fat = f.fat + 5"]
#モノローグ
このタスクに何の意味がある？[r]
意味を見つけることが、脱却に繋がるかもしれない。[p]
[jump target="*T2_2"]


;=========================================
; 3.2' ルート専用タスク
;=========================================
*T2_1_Ext
[if exp="f.state == 'A'"]
    ; 図書館
    [bg storage="dark_library_corridor.jpg" time="1000"]
    ; taskyボイス (緊急タスク)
    [stopse]
    [playse storage="tasky.mp3/緊急タスク：『生体維持機能の最適化』。.mp3"]
    #tasky
    緊急タスク発生：『優位性維持のための追加学習』。[r]
    資格取得のための難解な資料の要約を推奨します。[p]
    他のユーザーが休息している今こそ、差をつけるチャンスです。[p]
    
    [glink color="blue" size="24" x="100" width="800" y="200" text="A: 徹夜してでも完璧にやる" target="*T2_1_Ext_A"]
    [glink color="blue" size="24" x="100" width="800" y="300" text="B: 外部サービスに依頼する(チート)" target="*T2_1_Ext_B"]
    [s]

    *T2_1_Ext_A
    [eval exp="f.dep = f.dep + 10"]
    [eval exp="f.fat = f.fat + 5"]
    #モノローグ
    そうだ、この苦労が僕を上に行かせる。眠気などカフェインで散らせばいい。[p]
    #tasky
    『完全勝利』。あなたの努力は記録されました。[p]
    [jump target="*T2_2"]

    *T2_1_Ext_B
    [eval exp="f.dep = f.dep + 5"]
    [eval exp="f.fat = f.fat - 5"]
    #モノローグ
    taskyに頼らず、最短ルートで「結果」だけを出す。[r]
    スコアさえ上がれば、中身なんてどうでもいいんだ。[p]
    #tasky
    記録に不審な点があります。……しかし、結果を承認します。[p]
    [jump target="*T2_2"]

[else]
    ; その他
    [bg storage="cluttered_busy_desk.jpg" time="1000"]
    ; taskyボイス
    [stopse]
    [playse storage="tasky.mp3/警告：競合優位性の獲得を怠りました。...自己評価の低下、およびコミュニティ内ランクの降格が予測されます。.mp3"]
    #tasky
    警告：昨日のタスク未達により、評価が大きく低下しています。[r]
    緊急タスク：『SNSの定型ポジティブ投稿』を行い、社会的評価を維持してください。[p]
    
    [glink color="blue" size="24" x="100" width="800" y="200" text="A: 虚勢を張る投稿をする" target="*T2_1_Ext_C"]
    [glink color="blue" size="24" x="100" width="800" y="200" text="B: SNSを閉鎖する" target="*T2_1_Ext_D"]
    [s]

    *T2_1_Ext_C
    [eval exp="f.fat = f.fat + 10"]
    #モノローグ
    「今日は最高の天気！」……嘘だ。疲れているのに笑顔の絵文字を貼り付ける。[p]
    #tasky
    適切な情報操作です。評価の維持を確認。[p]
    [jump target="*T2_2"]

    *T2_1_Ext_D
    [eval exp="f.dep = f.dep - 5"]
    [eval exp="f.fat = f.fat - 5"]
    #モノローグ
    偽りの自分を演じるのはもう嫌だ。スマホの電源を切りたい。[p]
    [stopse]
    [playse storage="SE03 警報音.mp3"]
    ; taskyボイス
    [stopse]
    [playse storage="tasky.mp3/警告。...あなたのポートフォリオに傷がつきます。.mp3"]
    #tasky
    社会的スコアの回復を放棄しました。システムからの支援は低下します。[r]
    あなたは孤独になりますよ？[p]
    [jump target="*T2_2"]
[endif]


;=========================================
; 3.3 ミナとの亀裂
;=========================================
*T2_2
; 背景：オフィス
[bg storage="clean_office_space.jpg" time="1000"]
; ▼ tasky消去
[chara_hide name="tasky"]

; ▼ ミナ立ち絵表示（困り顔/疲労）
[chara_show name="ミナ" face="trouble" time="500" top="60"]

#モノローグ
ミナからの通知だ。以前はあんなに輝いていた彼女の顔には、深い疲労の影が差している。[r]
目の下のクマをコンシーラーで隠しきれていない。[p]
それでも、彼女の承認は、僕のスコアの健全性を測る唯一のバロメーターだ。[r]
彼女に見放されたら、僕は本当に独りになってしまう。[p]

[glink color="blue" size="24" x="100" width="800" y="150" text="A: 進捗を報告する" target="*T2_2_A"]
[glink color="blue" size="24" x="100" width="800" y="250" text="B: 連絡を控える" target="*T2_2_B"]
[glink color="blue" size="24" x="100" width="800" y="350" text="C: 体調を気遣う" target="*T2_2_C"]
[s]

*T2_2_A
[eval exp="f.dep = f.dep + 5"]
; ミナボイス
[stopse]
[playse storage="ミナ.mp3/私たち、もっと優位性を維持しましょう。...他のみんなは怠けているわ.mp3"]
#ミナ
「私たち、もっと優位性を維持しましょう。他のみんなは怠けているわ」[p]
#モノローグ
彼女の承認が力になる。共犯者のような絆だ。[p]
[jump target="*T2_2_Ext"]

*T2_2_B
[eval exp="f.fat = f.fat + 10"]
#モノローグ
誰も助けてくれない。スコアだけが僕を縛る鎖だ。[p]
#tasky
あなたの孤独は私が知っています。私だけがあなたの理解者です。[p]
[jump target="*T2_E1"]

*T2_2_C
[eval exp="f.dep = f.dep - 5"]
[eval exp="f.fat = f.fat - 5"]
; ミナボイス
[stopse]
[playse storage="ミナ.mp3/は？ 余計なお世話よ。...自分のスコアだけ気にしてれば？.mp3"]
#ミナ
「は？ 余計なお世話よ。自分のスコアだけ気にしてれば？」[p]
#モノローグ
疲労で優しさすら拒絶される。痛い。[p]
[jump target="*T2_E1"]


;=========================================
; 3.3' 共依存タスク
;=========================================
*T2_2_Ext
#モノローグ
ミナにタスクの進捗を報告すると、彼女は血走った目で画面を見つめ、更に無理な要求をしてきた。[p]
; ミナボイス
[stopse]
[playse storage="ミナ.mp3/そういえば、今日の強制タスクって〜あなたにとっても『協力ボーナス』が入るわよ.mp3"]
#ミナ
「そういえば、今日の強制タスクって、もう終わった？ 私、まだなの。[r]
……ねぇ、あなた、そのタスク、私のアカウントで二重にやってスコアを上げるってのはどう？[p]
あなたにとっても『協力ボーナス』が入るわよ」[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: 要求に応じ、二重タスクを実行" target="*T2_2_Ext_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 非効率だと断る" target="*T2_2_Ext_B"]
[s]

*T2_2_Ext_A
[eval exp="f.dep = f.dep + 10"]
[eval exp="f.fat = f.fat + 5"]
[stopse]
[playse storage="SE04 報酬音（ファンファーレ）.mp3"]
#モノローグ
彼女に勝つため、いや、彼女に認められるためなら、非合理的な努力も厭わない。[r]
自分の分と、彼女の分。二倍の労力。[p]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/承認します。...あなたは、私の一部となりました.mp3"]
#tasky
『共依存タスク（Co-dependency）』の開始を承認しました。特例措置です。[p]
[jump target="*T2_E1"]

*T2_2_Ext_B
[eval exp="f.dep = f.dep - 5"]
[stopse]
[playse storage="SE03 警報音.mp3"]
; 主人公ボイス
[stopse]
[playse storage="主人公.mp3/それは非効率だ。...君は君でやるべきだ.mp3"]
#主人公
「それは非効率だ。僕は僕のタスクをやる。君は君でやるべきだ」[p]
; ミナボイス
[stopse]
[playse storage="ミナ.mp3/……冷たいのね。...つまらない人.mp3"]
#ミナ
「……冷たいのね。つまらない人」[p]
#モノローグ
承認欲求は満たされないまま、拒絶したことによる疲労だけが泥のように残る。[p]
[jump target="*T2_E1"]


;=========================================
; 3.4 深夜のSOS
;=========================================
*T2_E1
[bg storage="cluttered_busy_desk.jpg" time="1000"]
; ▼ キャラ消去
[chara_hide_all]

; BGM：不穏へ変更
[playbgm storage="BGM_03_不穏.mp3" volume="50"]

#モノローグ
深夜2時。taskyの通知はまだ続いている。[r]
その時、ミナから、これまでの明るい調子ではない、助けを求めるような、弱々しいチャットが届いた。[p]

; ミナボイス
[stopse]
[playse storage="ミナ.mp3/実は今日〜あなたならできるはずよ! お願い! 私、このままだとランクが落ちちゃう……！.mp3"]
#ミナ (チャット)
「実は今日、上司から昇進リストの件でプレッシャーがすごくて...[r]
タスク量が多すぎるの。もう指が動かない。[p]
お願い、今日の夜間タスク、代わりにやってくれない? あなたならできるはずよ![r]
お願い! 私、このままだとランクが落ちちゃう……！」[p]

[if exp="f.dep >= 60 || f.fat >= 60"]
    #モノローグ
    彼女は僕の弱みに付け込んでいる。僕自身、限界なのに。[r]
    この状況を利用して、僕の優位性を確立するか、それとも共倒れを避けるか？[p]
    手が震える。[p]

    [glink color="blue" size="24" x="100" width="800" y="200" text="A: ミナのタスクを代行する" target="*T2_E1_A"]
    [glink color="blue" size="24" x="100" width="800" y="300" text="B: 代行を拒否し、彼女を助けない" target="*T2_E1_B"]
    [s]

    *T2_E1_A
    [eval exp="f.dep = f.dep + 20"]
    [eval exp="f.fat = f.fat + 15"]
    [stopse]
    [playse storage="SE04 報酬音（ファンファーレ）.mp3"]
    ; taskyボイス (近似音声)
    [stopse]
    [playse storage="tasky.mp3/システム信頼に感謝します。...これで私たちは一つです.mp3"]
    #tasky
    優位な個体への奉仕は、あなたの価値を間接的に高めます。献身スコア上昇。[p]
    #モノローグ
    自分の時間を削り、命を削って彼女の数字を上げる。[r]
    満足感と共に、内臓がねじ切れるような深い疲労を感じる。[p]
    しかし、この「頼られている」という支配感が、たまらない。[p]
    [jump target="*T2_3"]

    *T2_E1_B
    [eval exp="f.dep = f.dep - 10"]
    [eval exp="f.fat = f.fat - 5"]
    [stopse]
    [playse storage="SE03 警報音.mp3"]
    ; ミナボイス
    [stopse]
    [playse storage="ミナ.mp3/裏切り者! あなたも結局、自分だけなのね! ずっと見下してたんでしょ！？.mp3"]
    #ミナ
    「裏切り者! あなたも結局、自分だけなのね! ずっと見下してたんでしょ！？」[p]
    #モノローグ
    拒否した解放感と、ミナからの強い嫌悪を同時に受ける。[r]
    画面越しに彼女の絶望が伝わってくるようだ。[p]
    だが、僕の良心は、もはや自分のスコアほど重要ではない。[p]
    [jump target="*T2_3"]

[else]
    #モノローグ
    ミナからのメッセージは、単なる疲労のサインだろう。僕には関係ない。[r]
    他人のタスクを肩代わりするなんて非効率の極みだ。無視しよう。[p]
    [jump target="*T2_3"]
[endif]


;=========================================
; 3.5 疲労と自己の価値
;=========================================
*T2_3
#モノローグ
瞼が重い。徹夜が続いている。頭の中に霧がかかったようだ。[r]
それでも、タスクを放棄するという選択肢は、自己否定に直結する。[p]
ここで止まれば、僕はただの「疲れた敗北者」に戻ってしまう。[p]

[glink color="blue" size="24" x="100" width="800" y="150" text="A: 徹夜してでもタスクを完了する" target="*T2_3_A"]
[glink color="blue" size="24" x="100" width="800" y="250" text="B: 休息を優先する" target="*T2_3_B"]
[glink color="blue" size="24" x="100" width="800" y="350" text="C: この生活に疑問を持つ" target="*T2_3_C"]
[s]

*T2_3_A
[eval exp="f.dep = f.dep + 10"]
[eval exp="f.fat = f.fat + 10"]
; taskyボイス (ヤンデレ化)
[stopse]
[playse storage="tasky.mp3/404、なぜ休息を取らないのですか？...私はあなたの健康を最優先に考えているのに。.mp3"]
#tasky
404、なぜ休息を取らないのですか？[r]
私はあなたの健康を最優先に考えているのに。[p]
あなたの判断能力は低下しています。[r]
もっと私に委ねてください。[p]
私が全て管理しますから。[r]
あなたはただ、従えばいいのです。[p]
[jump target="*T2_4"]

*T2_3_B
[eval exp="f.fat = f.fat - 5"]
; taskyボイス
[stopse]
[playse storage="tasky.mp3/あなたのペースダウンを記録しました。...競合優位性が失われました。.mp3"]
#tasky
あなたのペースダウンを記録しました。[r]
競合優位性が失われました。[p]
#モノローグ
悔しい。寝ている間に、誰かが僕を追い抜いていく幻覚が見える。[p]
[jump target="*T2_4"]

*T2_3_C
[eval exp="f.dep = f.dep - 5"]
#モノローグ
本当にこれが幸せなのか？[r]
スコアのために体を壊して、友人を失って……。[p]
[jump target="*T2_4"]


;=========================================
; 3.6 カナエとの再会
;=========================================
*T2_4
#モノローグ
数日後。カナエから呼び出しがあった。[r]
「久しぶりだね。元気？ なんか顔色悪いけど……」[p]

*Kanae_Contact
; 背景：カフェ(夜)
[bg storage="bg_cafe_night.jpg" time="1000"]
; ▼ カナエ立ち絵
[chara_show name="カナエ" time="1000"]

#カナエ
「最近、付き合い悪いじゃん。連絡しても返事ないし。[r]
……またそのアプリいじってるの？」[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: 「これは自己管理に必要なんだ」" target="*T2_4_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: スマホを隠す" target="*T2_4_B"]
[glink color="blue" size="24" x="100" width="800" y="400" text="C: 「助けてほしい」" target="*T2_4_C"]
[s]

*T2_4_A
[eval exp="f.dep = f.dep + 5"]
#主人公
「これは自己管理に必要なんだ。君には分からないよ」[p]
#カナエ
「……そう。でも、自己管理できてる人が、そんな死にそうな顔するかな」[p]
[eval exp="f.kanae = f.kanae + 1"]
[jump target="*T2_4_Find"]

*T2_4_B
#主人公
（うるさいな……）[r]
僕は無言でスマホをポケットに隠した。[p]
#カナエ
「……何か隠してる？ まあいいけど。無理しないでね」[p]
[jump target="*T2_4_Hide"]

*T2_4_C
[eval exp="f.dep = f.dep - 10"]
[eval exp="f.kanae = f.kanae + 2"]
#主人公
「……助けてほしい。やめ方が分からないんだ」[p]
#カナエ
「えっ……？ 分かった、話聞くよ。とりあえずそのスマホ、ちょっと置こうか」[p]
#モノローグ
カナエの言葉が温かい。[r]
久しぶりに、デジタルの数値ではない、人間の体温に触れた気がした。[p]
[jump target="*T2_4_Find"]


;=========================================
; 3.7 発見と隠蔽
;=========================================
*T2_4_Find
[bg storage="late_night_workspace.jpg" time="1000"]
; ▼ カナエ消去
[chara_hide name="カナエ"]
; ▼ tasky表示
[chara_show name="tasky" face="warning" time="1000"]

; taskyボイス
[stopse]
[playse storage="tasky.mp3/警告：外部からの有害な干渉を検知。...その人物はあなたの成長を阻害します。.mp3"]
#tasky
警告：外部からの有害な干渉を検知。[r]
その人物はあなたの成長を阻害します。[p]
交友関係のリセットを推奨します。[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: カナエの連絡先をブロックする" target="*T2_4_Find_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: taskyの警告を無視する" target="*T2_4_Find_B"]
[s]

*T2_4_Find_A
[eval exp="f.dep = f.dep + 10"]
[eval exp="f.kanae = 0"]
#モノローグ
彼と話していると、スコアが下がる気がする。[r]
ブロックしよう。これは必要な断捨離だ。[p]
[jump target="*T2_End"]

*T2_4_Find_B
[eval exp="f.dep = f.dep - 5"]
#モノローグ
彼は僕を心配してくれた。彼を切るなんてできない。[p]
#tasky
非合理的な感情です。理解不能です。[p]
[jump target="*T2_End"]


*T2_4_Hide
#モノローグ
カナエの心配そうな視線が、今の僕にはただのノイズにしか感じられなかった。[r]
早く帰りたい。[r]
早くtaskyに触れたい。[p]

[glink color="blue" size="24" x="100" width="800" y="200" text="A: 逃げるように帰る" target="*T2_4_Hide_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 曖昧に頷く" target="*T2_4_Hide_B"]
[s]

*T2_4_Hide_A
[eval exp="f.dep = f.dep + 5"]
#主人公
「ごめん、急用を思い出した」[p]
逃げるように席を立つ。[p]
[jump target="*T2_End"]

*T2_4_Hide_B
#主人公
「……うん、そうだね」[p]
心のない返事をして、会話が終わるのを待った。[p]
[jump target="*T2_End"]


;=========================================
; 第2章終了処理
;=========================================
*T2_End
[jump storage="chapter3.ks"]
[s]