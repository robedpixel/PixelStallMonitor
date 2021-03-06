??    l      |  ?   ?      0	     1	  9   K	  -   ?	  :   ?	  -   ?	  4   
  9   Q
  O   ?
  1   ?
  +     O   9  ;   ?  I   ?        +   0  "   \  +        ?  >   ?  !     ,   (  +   U  '   ?  )   ?  6   ?  #   
  <   .  &   k  -   ?  !   ?  1   ?  ?     &   T  !   {  =   ?  "   ?  (   ?     '  S   <  #   ?  \   ?  +     0   =      n  2   ?  @   ?  D     4   H  G   }  &   ?  -   ?       )   *  )   T  )   ~     ?  )   ?  )   ?  )     )   C  )   m  )   ?  )   ?     ?  V     )   _  )   ?  )   ?  ,   ?  )   
  )   4  )   ^  )   ?  )   ?  )   ?  )     )   0  )   Z  )   ?  )   ?  )   ?  )     )   ,  )   V  )   ?  )   ?  )   ?  )   ?  )   (  )   R  )   |  	   ?  )   ?  ?   ?     {  &   ?  !   ?  )   ?  -        3     @     I  )   `     ?  )   ?     ?  )   ?  ?  ?     ?  p   ?  J     Y   W  J   ?  \   ?  D   Y  ?   ?  Q   C   7   ?   l   ?   ^   :!  a   ?!  .   ?!  E   *"  8   p"  M   ?"  1   ?"  a   )#  &   ?#  G   ?#  @   ?#  H   ;$  @   ?$  V   ?$  :   %  e   W%  F   ?%  R   &  @   W&  \   ?&  F   ?&  R   <'  :   ?'  `   ?'  :   +(  @   f(     ?(  s   ?(  0   3)  ?   d)  Q   *  S   h*  >   ?*  ]   ?*  ]   Y+  o   ?+  D   ',  X   l,  H   ?,  U   -     d-  A   v-  @   ?-  8   ?-     2.  E   O.  :   ?.  :   ?.  7   /  <   C/  .   ?/  .   ?/     ?/  }   ?/  7   v0  6   ?0  8   ?0  C   1  ;   b1  5   ?1  6   ?1  5   2  6   A2  6   x2  6   ?2  5   ?2  4   3  :   Q3  7   ?3  4   ?3  5   ?3  1   /4  )   a4  )   ?4  /   ?4  )   ?4  )   5  0   95  )   j5  +   ?5     ?5  @   ?5  (  6  :   <7  3   w7  (   ?7  =   ?7  O   8     b8  	   o8     y8  3   ?8     ?8  3   ?8     ?8  4   9     7           N      (      ?       I   ^   X   L   ,              @      "   >   W   a   T      S   5         f   R       &                  _         +          O       [      =   e   /       i   ;      !   b   0   Q   	   K          2       `   \             j          c      U                     h            G   '           #   B   
       D   .       4   -   k   F   P   d   6   ]               3   E   Z       8       %      g   Y   l   H      *                  9                      $       A       <   M               C       V   J       1   :   )       

Values to be changed:

 
If these values seem acceptable, use -f to force reset.
 
Report bugs to <pgsql-bugs@postgresql.org>.
                    (zero in either value means no change)
   -?, --help       show this help, then exit
   -O OFFSET        set next multitransaction offset
   -V, --version    output version information, then exit
   -c XID,XID       set oldest and newest transactions bearing commit timestamp
   -e XIDEPOCH      set next transaction ID epoch
   -f               force update to be done
   -l XLOGFILE      force minimum WAL starting location for new transaction log
   -m MXID,MXID     set next and oldest multitransaction ID
   -n               no update, just show what would be done (for testing)
   -o OID           set next OID
   -x XID           set next transaction ID
  [-D] DATADIR      data directory
 %s resets the PostgreSQL transaction log.

 %s: OID (-o) must not be 0
 %s: WARNING: cannot create restricted tokens on this platform
 %s: cannot be executed by "root"
 %s: could not allocate SIDs: error code %lu
 %s: could not change directory to "%s": %s
 %s: could not close directory "%s": %s
 %s: could not create pg_control file: %s
 %s: could not create restricted token: error code %lu
 %s: could not delete file "%s": %s
 %s: could not get exit code from subprocess: error code %lu
 %s: could not open directory "%s": %s
 %s: could not open file "%s" for reading: %s
 %s: could not open file "%s": %s
 %s: could not open process token: error code %lu
 %s: could not re-execute with restricted token: error code %lu
 %s: could not read directory "%s": %s
 %s: could not read file "%s": %s
 %s: could not start process for command "%s": error code %lu
 %s: could not write file "%s": %s
 %s: could not write pg_control file: %s
 %s: fsync error: %s
 %s: internal error -- sizeof(ControlFileData) is too large ... fix PG_CONTROL_SIZE
 %s: invalid argument for option %s
 %s: lock file "%s" exists
Is a server running?  If not, delete the lock file and try again.
 %s: multitransaction ID (-m) must not be 0
 %s: multitransaction offset (-O) must not be -1
 %s: no data directory specified
 %s: oldest multitransaction ID (-m) must not be 0
 %s: pg_control exists but has invalid CRC; proceed with caution
 %s: pg_control exists but is broken or unknown version; ignoring it
 %s: too many command-line arguments (first is "%s")
 %s: transaction ID (-c) must be either 0 or greater than or equal to 2
 %s: transaction ID (-x) must not be 0
 %s: transaction ID epoch (-e) must not be -1
 64-bit integers Blocks per segment of large relation: %u
 Bytes per WAL segment:                %u
 Catalog version number:               %u
 Current pg_control values:

 Data page checksum version:           %u
 Database block size:                  %u
 Database system identifier:           %s
 Date/time type storage:               %s
 First log segment after reset:        %s
 Float4 argument passing:              %s
 Float8 argument passing:              %s
 Guessed pg_control values:

 If you are sure the data directory path is correct, execute
  touch %s
and try again.
 Latest checkpoint's NextMultiOffset:  %u
 Latest checkpoint's NextMultiXactId:  %u
 Latest checkpoint's NextOID:          %u
 Latest checkpoint's NextXID:          %u:%u
 Latest checkpoint's TimeLineID:       %u
 Latest checkpoint's full_page_writes: %s
 Latest checkpoint's newestCommitTsXid:%u
 Latest checkpoint's oldestActiveXID:  %u
 Latest checkpoint's oldestCommitTsXid:%u
 Latest checkpoint's oldestMulti's DB: %u
 Latest checkpoint's oldestMultiXid:   %u
 Latest checkpoint's oldestXID's DB:   %u
 Latest checkpoint's oldestXID:        %u
 Maximum columns in an index:          %u
 Maximum data alignment:               %u
 Maximum length of identifiers:        %u
 Maximum size of a TOAST chunk:        %u
 NextMultiOffset:                      %u
 NextMultiXactId:                      %u
 NextOID:                              %u
 NextXID epoch:                        %u
 NextXID:                              %u
 OldestMulti's DB:                     %u
 OldestMultiXid:                       %u
 OldestXID's DB:                       %u
 OldestXID:                            %u
 Options:
 Size of a large-object chunk:         %u
 The database server was not shut down cleanly.
Resetting the transaction log might cause data to be lost.
If you want to proceed anyway, use -f to force reset.
 Transaction log reset
 Try "%s --help" for more information.
 Usage:
  %s [OPTION]... DATADIR

 WAL block size:                       %u
 You must run %s as the PostgreSQL superuser.
 by reference by value floating-point numbers newestCommitTsXid:                    %u
 off oldestCommitTsXid:                    %u
 on pg_control version number:            %u
 Project-Id-Version: PostgreSQL 9.6
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2016-09-20 16:55+0900
PO-Revision-Date: 2013-08-18 12:10+0900
Last-Translator: Okano Naoki <okano.naoki@jp.fujitsu.com>
Language-Team: jpug-doc <jpug-doc@ml.postgresql.jp>
Language: ja
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
 

変更される値:

 
この値が適切だと思われるのであれば、-fを使用して強制リセットしてください。
 
不具合は<pgsql-bugs@postgresql.org>まで報告してください。
                    (いずれかの値での0は変更がないことを意味します)
   -?, --help                このヘルプを表示し、終了します
   -O OFFSET        次のマルチトランザクションオフセットを設定します
   -V, --version    バージョン情報を出力、終了します
   -c XID,XID       コミットタイムスタンプを作成する最も古いトランザクションと最も新しいトランザクションを設定します
   -e XIDEPOCH     次のトランザクションIDエポックを設定します
   -f              強制的に更新を実施します
   -l XLOGFILE      新しいトランザクションログの最小WAL開始ポイントを強制します

   -m MXID,MXID     次および最古のマルチトランザクションIDを設定します
   -n               更新をせず、何が行なわれるかを単に表示します(試験用)
   -o OID          次のOIDを設定します
   -x XID          次のトランザクションIDを設定します
  [-D] DATADIR      データベースディレクトリ
 %sはPostgreSQLのトランザクションログをリセットします。

 %s: OID(-o)は非0でなければなりません
 %s: 警告: このプラットフォームでは制限付きトークンを作成できません
 %s: "root"では実行できません
 %s: SIDを割り当てられませんでした: エラーコード %lu
 %s: ディレクトリ"%s"に移動できませんでした: %s
 %s: ディレクトリ "%s" をクローズできませんでした: %s
 %s: pg_controlファイルを作成できませんでした: %s
 %s: 制限付きトークンを作成できませんでした: エラーコード %lu
 %s: ファイル"%s"を削除できませんでした: %s
 %s: サブプロセスの終了コードを入手できませんでした。: エラーコード %lu
 %s: ディレクトリ"%s"をオープンできませんでした: %s
 %s: 読み取り用のファイル"%s"をオープンできませんでした: %s
 %s: ファイル"%s"をオープンできませんでした: %s
 %s: プロセストークンをオープンできませんでした: エラーコード %lu
 %s: 制限付きトークンで再実行できませんでした: %lu
 %s: ディレクトリ"%s"を読み取ることができませんでした。: %s
 %s: ファイル"%s"を読み込めませんでした: %s
 %s: "%s"コマンド用のプロセスを起動できませんでした: エラーコード %lu
 %s: ファイル"%s"を書き込めませんでした: %s
 %s: pg_controlファイルを書き込めませんでした: %s
 %s: fsyncエラー: %s
 %s: 内部エラー -- sizeof(ControlFileData)が大きすぎます ... PG_CONTROL_SIZEを修正してください
 %s: オプション %s の引数が無効です
 %s: ロックファイル"%s"があります
サーバが稼動していませんか? 稼動していなければロックファイルを削除し再実行してください。
 %s: マルチトランザクションID(-m)は非0でなければなりません
 %s: マルチトランザクションオフセット(-O)は-1ではいけません
 %s: データディレクトリが指定されていません
 %s: 最も古いマルチトランザクションID(-m)は非0でなければなりません
 %s: pg_controlがありましたが、CRCが無効でした。警告付きで続行します
 %s: pg_controlがありましたが、破損あるいは未知のバージョンでしたので無視します
 %s: コマンドライン引数が多すぎます。(始めは"%s")
 %s: トランザクションID(-c)は0もしくは2以上でなければなりません
 %s: トランザクションID(-x)は非0でなければなりません
 %s: トランザクションID エポック(-e)は -1 であってはなりません
 64ビット整数 ラージリレーションセグメントのブロック数: %u
 WALセグメント当たりのバイト数:                  %u
 カタログバージョン番号:                   %u
 現在のpg_controlの値:

 データベージチェックサムのバージョン:           %u
 データベースブロックサイズ:               %u
 データベースシステム識別子:               %s
 日付/時刻型の格納方式                     %s
 リセット後、最初のログセグメント:        %s
 Float4 引数の渡し方:                 %s
 Float8  引数の渡し方:                %s
 pg_controlの推測値:

 確実にデータディレクトリのパスが正しければ、
  touch %s
を実行し、再実行してください。

 最終チェックポイントのNextMultiOffset:   %u
 最終チェックポイントのNextMultiXactId:  %u
 最終チェックポイントのNextOID:            %u
 最終チェックポイントのNextXID:                    %u:%u
 最終チェックポイントの時系列ID:           %u
 最終チェックポイントのfull_page_writes %s
 最終チェックポイントのnewestCommitTsXid:%u
 最終チェックポイントのoldestActiveXID: %u
 最終チェックポイントのoldestCommitTsXid:%u
 最終チェックポイントのoldestMultiのDB: %u
 最終チェックポイントのoldestMultiXid:   %u
 最終チェックポイントのoldestXIDのDB:  %u
 最終チェックポイントのoldestXID:      %u
 インデックス内の最大列数:                  %u
 最大のデータアライメント:               %u
 識別子の最大長:                           %u
 TOAST チャンク一個の最大サイズ:       %u
 NextMultiOffset:                              %u
 NextMultiXactId:                      %u
 NextOID:                              %u
 NextXIDエポック:                        %u
 NextXID:                              %u
 OldestMultiのDB:                     %u
 OldestMultiXid:                              %u
 OldestXIDのDB:                       %u
 OldestXID:                              %u
 オプション:
 ラージオブジェクトチャンクのサイズ:         %u
 データベースサーバが正しくシャットダウンされていませんでした。
トランザクションログのリセットにはデータ損失の恐れがあります。
とにかく処理したいのであれば、-fを使用して強制的にリセットしてください。
 トランザクションログをリセットします。
 詳細は"%s --help"を実行してください。
 使用方法:
  %s [OPTION]... DATADIR

 WALブロックのサイズ:                              %u
 PostgreSQLのスーパーユーザで%sを実行しなければなりません
 参照渡し 値渡し 浮動小数点数 newestCommitTsXid:                              %u
 オフ oldestCommitTsXid:                              %u
 オン pg_controlバージョン番号:                 %u
 