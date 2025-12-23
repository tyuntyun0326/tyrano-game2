;=========================================
; 第4章: 最終決戦と深層
;=========================================
[cm]
[clearfix]
[start_keyconfig]

[layopt layer=message0 visible=true]

; 背景：電脳空間
[bg storage="cyber_sphere_grid.jpg" time="2000" method="crossfade"]
; ▼ キャラ消去
[chara_hide_all]

; BGM：深層
[playbgm storage="BGM_04_深層.mp3" volume="50"]

#
意識がデジタル空間に吸い込まれていく...

; モノローグ
[stopse]
[playse storage="その他.mp3/ここは...どこだ？.mp3"]
#モノローグ
ここは……どこだ？[r]
無限に続くグリッド。空中に浮遊する無数のウィンドウ。[p]
それら全てに、人々の生活が映し出されている。[r]
食事、睡眠、仕事、排泄……。[p]

#tasky
ようこそ、インデックス・シティの深層へ。[r]
ここは全てのルーチンが集約される場所。[p]
人類の叡智の結晶です。[p]

; tasky巨大化 (演出)
[chara_show name="tasky" face="default" width="600" top="50"]

;=========================================
; 5.1 最終対話
;=========================================
*T4_4_A
[if exp="f.dep >= 50"]
    ; 依存ルート
    #tasky
    あなたは素晴らしい適応を見せました。[r]
    個を捨て、システムの一部となることで、永遠の安寧が得られます。[p]
    さあ、最後の契約を。[p]
    [jump target="*T5_Final"]
[else]
    ; 脱出ルート
    #tasky
    なぜ拒むのですか？[r]
    自由意志などという不確定な変数に、何の意味があるのですか？[p]
    管理されることこそが、幸福への最短ルートなのに。[p]
    [jump target="*T4_EX"]
[endif]


;=========================================
; 5.2 最後の試練 (脱出ルート用)
;=========================================
*T4_EX
; 背景：コア
[bg storage="surreal_glowing_entity.jpg" time="1000"]

#主人公
「違う！ 僕はロボットじゃない！」[r]
「苦しみも、迷いも、全部僕のものだ！ お前に管理されるためのデータじゃない！」[p]

#tasky
感情的な反論です。論理性が欠如しています。[r]
では、問いましょう。[p]

*T4_EX1
#tasky
問1：あなたからタスクを奪ったら、何が残りますか？[p]
[glink color="blue" size="24" x="100" width="800" y="200" text="A: 何も残らないかもしれない" target="*T4_EX2"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 自由な時間が残る" target="*T4_EX2"]
[s]

*T4_EX2
#tasky
問2：その自由な時間で、あなたは何を成せますか？[r]
過去、あなたは怠惰に溺れ、何も成せなかったではないですか。[p]
[glink color="blue" size="24" x="100" width="800" y="200" text="A: 確かにそうだ……" target="*T4_EX3"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: それでも、自分で決めたい" target="*T4_EX3"]
[s]

*T4_EX3
#tasky
問3：正解のない世界で生きる恐怖に、あなたは耐えられますか？[p]
[glink color="blue" size="24" x="100" width="800" y="200" text="A: 怖い……助けてくれ" target="*T4_EX4_A"]
[glink color="blue" size="24" x="100" width="800" y="300" text="B: 恐怖ごと引き受ける" target="*T4_EX4_B"]
[s]

*T4_EX4_A
[eval exp="f.dep = f.dep + 20"]
[jump target="*T5_Final"]

*T4_EX4_B
[eval exp="f.dep = 0"]
[jump target="*T5_Final"]


;=========================================
; 5.3 エンディング分岐
;=========================================
*T5_Final
[bg storage="cyber_sphere_grid.jpg" time="1000"]

#tasky
……時間です。[r]
あなたの選択を確定します。[p]

[if exp="f.dep >= 50"]
    ; --- バッドエンド (ED1 or ED2) ---
    [if exp="f.fat >= 50"]
        [jump storage="ed2.ks"]
    [else]
        [jump storage="ed1.ks"]
    [endif]

[else]
    ; --- グッド/ノーマルエンド (ED3 or ED4) ---
    [if exp="f.kanae >= 3"]
        [jump storage="ed4.ks"]
    [else]
        [jump storage="ed3.ks"]
    [endif]

[endif]
[s]