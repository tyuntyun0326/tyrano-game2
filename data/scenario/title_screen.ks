;==============================
; タイトル画面
;==============================

[hidemenubutton]
[tb_clear_images]
[tb_keyconfig flag=0]

; 標準のメッセージレイヤを非表示
[tb_hide_message_window]

; 背景画像（デフォルトのtitle.jpgを使用）
; ※変更したい場合はここを "cyber_sphere_grid.jpg" 等に変えてください
[bg storage="title.jpg"]

; ★追加：タイトルBGM再生
[playbgm storage="BGM_08_タイトル.mp3" volume="60"]

; ★追加：タイトル文字の表示（ロゴ画像がない場合の代用）
; レイヤー1を表示状態にする
[layopt layer=1 visible=true]

; タイトル名（中央寄せ風の配置）
[ptext layer=1 page=fore text="Routine Cage" x=280 y=150 size=90 color=0xffffff edge="0x000000" bold="bold" shadow="0x000000"]
; サブタイトル
[ptext layer=1 page=fore text="― ルーチンの檻 ―" x=450 y=280 size=30 color=0xcccccc edge="0x000000" bold="bold"]


*title

; ボタン表示（少しリッチに見えるようサイズ等を調整）
[glink color="black" text="はじめから" x=500 y=450 size=24 target="*start" width="200"]
[glink color="black" text="つづきから" x=500 y=550 size=24 target="*load" width="200"]

[s]

;-------ボタンが押されたときの処理

*start

; スタート時はタイトル文字（レイヤー1）を消す
[freeimage layer=1]

[showmenubutton]

[cm]
[tb_keyconfig flag=1]

; プロローグへ移動
@jump storage="scene1.ks"
[s]

;--------ロードが押された時の処理
*load

[cm]
[showload]
[jump target=*title]

[s]
