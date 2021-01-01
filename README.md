# RADIRU-Vim

Radiru Client for Vim

# Usage

`:RadiruPlay (R1 | R2 | FM)`  
上記のコマンドでらじるらじるの放送を再生できます。
放送局は東京から3局選べます。（省略はできません）

`:RadiruStop`  
再生を停止します。

`g:radiru#playing_station()`  
再生中の放送局の名前を取得できます。
以下のようにstatuslineで確認できます。
```
let g:lightline = {
 . . .
\   'component_function': {
\     'radiru': 'radiru#playing_station',
\   },
\ }
```
![lightline](misc/lightline.png)

# Requirement

ffmpeg (ffplay)

# Author

kato-k (kota kato)

# License

MIT
