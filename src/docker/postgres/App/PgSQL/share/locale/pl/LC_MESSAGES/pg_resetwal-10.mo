??    l      |  ?   ?      0	     1	  9   K	  -   ?	  :   ?	  -   ?	  4   
  9   Q
  O   ?
  1   ?
  +     O   9  ;   ?  I   ?        +   0  "   \  +        ?  >   ?  !     ,   (  +   U  '   ?  )   ?  6   ?  #   
  <   .  &   k  -   ?  !   ?  1   ?  ?     &   T  !   {  =   ?  "   ?  (   ?     '  S   <  #   ?  \   ?  +     0   =      n  2   ?  @   ?  D     4   H  G   }  &   ?  -   ?       )   *  )   T  )   ~     ?  )   ?  )   ?  )     )   C  )   m  )   ?  )   ?     ?  V     )   _  )   ?  )   ?  ,   ?  )   
  )   4  )   ^  )   ?  )   ?  )   ?  )     )   0  )   Z  )   ?  )   ?  )   ?  )     )   ,  )   V  )   ?  )   ?  )   ?  )   ?  )   (  )   R  )   |  	   ?  )   ?  ?   ?     {  &   ?  !   ?  )   ?  -        3     @     I  )   `     ?  )   ?     ?  )   ?  ?  ?     ?  M   ?  C   @  @   ?  7   ?  <   ?  :   :  `   u  ;   ?  1      b   D   G   ?   \   ?   )   L!  4   v!  &   ?!  (   ?!     ?!  N   "  +   i"  9   ?"  -   ?"  +   ?"  .   )#  D   X#  '   ?#  M   ?#  +   $  3   ?$  (   s$  9   ?$  @   ?$  +   %  *   C%  K   n%  '   ?%  .   ?%     &  ]   '&  &   ?&  g   ?&  -   '  2   B'  )   u'  8   ?'  E   ?'  R   (  4   q(  C   ?(  (   ?(  /   )     C)  5   ^)  5   ?)  4   ?)  !   ?)  4   !*  6   V*  4   ?*  4   ?*  5   ?*  4   -+  4   b+  #   ?+  e   ?+  4   !,  4   V,  4   ?,  7   ?,  4   ?,  4   --  5   b-  4   ?-  5   ?-  5   .  4   9.  4   n.  4   ?.  4   ?.  5   /  8   C/  4   |/  5   ?/  5   ?/  5   0  5   S0  5   ?0  5   ?0  5   ?0  5   +1  5   a1     ?1  5   ?1  ?   ?1     ?2  6   ?2  /   ?2  6   3  7   C3     {3     ?3     ?3  5   ?3     ?3  5   ?3  
   /4  4   :4     7           N      (      ?       I   ^   X   L   ,              @      "   >   W   a   T      S   5         f   R       &                  _         +          O       [      =   e   /       i   ;      !   b   0   Q   	   K          2       `   \             j          c      U                     h            G   '           #   B   
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
 Project-Id-Version: pg_resetxlog (PostgreSQL 9.1)
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2016-07-03 03:14+0000
PO-Revision-Date: 2016-07-03 17:54+0200
Last-Translator: grzegorz <begina.felicysym@wp.eu>
Language-Team: begina.felicysym@wp.eu
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
X-Generator: Virtaal 0.7.1
 

Wartości do zmiany:

 
Jeśli te wartości wydają się do przyjęcia, użyj -f by wymusić reset.
 
Błędy proszę przesyłać na adres <pgsql-bugs@postgresql.org>.
                    (zero w obu wartościach oznacza brak zmian)
   -?, --help       pokazuje ten ekran pomocy i kończy
   -O OFFSET        ustawia następny offset multitransakcji
   -V, --version    wypisuje informacje o wersji i kończy
   -c XID,XID       ustawia najstarszy i najświeższy znacznik czasu wykonywanego zatwierdzenia
   -e XIDEPOCH      ustawia epokę ID następnej transakcji
   -f               wymusza wykonanie modyfikacji
   -l XLOGFILE      wymusza minimalne położenie początkowe WAL dla nowego komunikatu transakcji
   -m XID,MXID      ustawia ID następnej i najstarszej multitransakcji
   -n               bez modyfikacji, po prostu wyświetl co będzie zrobione (do testowania)
   -o OID           ustawia następny OID
   -x XID           ustawia ID następnej transakcji
  [-D] DATADIR      folder bazy danych
 %s resetuje log transakcji PostgreSQL.

 %s: OID (-o) nie może być 0
 %s: OSTRZEŻENIE nie można tworzyć ograniczonych tokenów na tej platformie
 %s: nie może być wykonywane pod "rootem"
 %s: nie udało się przydzielić SIDów: kod błędu %lu
 %s: nie można zmienić katalogu na "%s": %s
 %s: nie można zamknąć katalogu "%s": %s
 %s: nie można utworzyć pliku pg_control: %s
 %s: nie udało się utworzyć ograniczonego tokena: kod błędu %lu
 %s: nie można usunąć pliku "%s": %s
 %s: nie udało uzyskać kodu wyjścia z usługi podrzędnej: kod błędu %lu
 %s: nie można otworzyć katalogu "%s": %s
 %s: nie można otworzyć pliku "%s" do odczytu: %s
 %s: nie można otworzyć pliku "%s": %s
 %s: nie można otworzyć tokenu procesu: kod błędu %lu
 %s: nie udało się ponownie wykonać ograniczonego tokena: %lu
 %s: nie można odczytać katalogu "%s": %s
 %s: nie można odczytać z pliku "%s": %s
 %s: nie udało się uruchomić procesu dla polecenia "%s": kod błędu %lu
 %s: nie można zapisać pliku "%s": %s
 %s: nie można pisać do pliku pg_control: %s
 %s: błąd fsync: %s
 %s: błąd wewnętrzny -- sizeof(ControlFileData) jest zbyt duża ... popraw PG_CONTROL_SIZE
 %s: niepoprawny argument dla opcji %s
 %s: plik blokady "%s" istnieje
Czy serwer działa? Jeśli nie, usuń plik blokady i spróbuj ponownie.
 %s: ID multitransakcji (-m) nie może być 0
 %s: offset multitransakcji (-O) nie może być -1
 %s: katalog danych nie został ustawiony
 %s: najstarszy ID multitransakcji (-m) nie może być 0
 %s: pg_control istnieje ale ma niepoprawne CRC; postępuj ostrożnie
 %s: pg_control istnieje ale jest uszkodzony lub ma nieznaną wersję, zignorowano
 %s: za duża ilość parametrów (pierwszy to "%s")
 %s: ID transakcji (-c) musi być albo 0 albo większa lub równa 2
 %s: ID transakcji (-x) nie może być 0
 %s: epoka ID transakcji (-e) nie może być -1
 64-bit'owe zmienne integer Bloki na segment są w relacji:                   %u
 Bajtów na segment WAL:                           %u
 Katalog w wersji numer:                          %u
 Bieżące wartości pg_control:

 Suma kontrolna strony danych w wersji numer:     %u
 Wielkość bloku bazy danych:                      %u
 Identyfikator systemu bazy danych:               %s
 Typ przechowywania daty/czasu:                   %s
 Pierwszy segment dziennika po resecie:            %s
 Przekazywanie parametru float4:                  %s
 Przekazywanie parametru float8:                  %s
 Odgadnięte wartości pg_control:

 Jeśli jesteś pewien, że ścieżka folder u jest poprawna, wykonaj
  touch %s
i spróbuj ponownie.
 NextMultiOffset najnowszego punktu kontrolnego:  %u
 NextMultiXactId najnowszego punktu kontrolnego:  %u
 NextOID najnowszego punktu kontrolnego:          %u
 NextXID najnowszego punktu kontrolnego:          %u:%u
 TimeLineID najnowszego punktu kontrolnego:       %u
 full_page_writes najnowszego punktu kontrolnego: %s
 newestCommitTsXid najnowszego punktu kontrolnego: %u
 NextXID najnowszego punktu kontrolnego:          %u
 oldestCommitTsXid najnowszego punktu kontrolnego: %u
 DB oldestMulti'u najnowszego punktu kontrolnego:  %u
 oldestMultiXid najnowszego punktu kontrolnego:   %u
 DB oldestXID'u najnowszego punktu kontrolnego:   %u
 oldestXID najnowszego punktu kontrolnego:        %u
 Maksymalna liczba kolumn w indeksie:             %u
 Maksymalne wyrównanie danych:                    %u
 Maksymalna długość identyfikatorów:              %u
 Maksymalny rozmiar fragmentu TOAST:              %u
 NextMultiOffset:                                  %u
 NextMultiXactId:                                  %u
 NextOID:                                          %u
 Epoka NextXID:                                    %u
 NextXID:                                          %u
 DB OldestMulti'u:                                 %u
 OldestMultiXid:                                   %u
 DB OldestXIDu:                                    %u
 OldestXID:                                        %u
 Opcje:
 Rozmiar fragmentu dużego obiektu:                %u
 Serwer bazy danych nie został poprawnie zamknięty.
Zresetowanie dziennika transakcji może spowodować utratę danych.
Jeśli chcesz kontynuować, użyj -f, aby wymusić reset.
 Reset dziennika transakcji
 Spróbuj "%s --help" aby uzyskać więcej informacji.
 Sposób użycia:
  %s [OPCJA]... FOLDERDANYCH

 Wielkość bloku WAL:                              %u
 Musisz uruchomić %s jako superużytkownik PostgreSQL.
 przez referencję przez wartość liczby zmiennoprzecinkowe newestCommitTsXid:                                %u
 wyłączone oldestCommitTsXid:                                %u
 włączone pg_control w wersji numer:                       %u
 