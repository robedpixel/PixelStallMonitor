??    y      ?  ?   ?      8
  ~   9
  -   ?
  0   ?
  +     g   C     ?  4   ?  7      s   8  .   ?  G   ?  4   #  )   X  w   ?  4   ?     /  @   B  7   ?  ,   ?  !   ?     
  ,   (  1   U  *   ?  -   ?  1   ?  '     &   :  +   a  "   ?  #   ?     ?  )   ?  =     	   D     N  &   j  <   ?  !   ?  	   ?  -   ?  +   (  "   T     w  ,   ?     ?     ?  *   ?  "   (  '   K     s     ?  !   ?     ?  !   ?     ?        3   5  /   i  '   ?  5   ?  I   ?  ,   A  /   n  *   ?  T   ?  '        F     a     }     ?     ?  -   ?  ,   ?  ,     5   H     ~  )   ?  ?   ?  8     ?   =     ?  0   ?  5        U  A   j  L   ?  +   ?     %  6   3  '   j  #   ?     ?  (   ?  4   ?  )   !     K  /   h     ?      ?  $   ?     ?  "     ,   2     _     w  '   ?     ?     ?  $   ?  D     +   c  ?   ?  0   ?        8        X     v  &   ?      ?  ?  ?  ?   z   ,   !  6   A!  6   x!  ?   ?!     @"  6   `"  3   ?"  ?   ?"  0   Y#  O   ?#  :   ?#  *   $  ?   @$  3   ?$     %  K   *%  0   v%  :   ?%  #   ?%  #   &  8   *&  6   c&  /   ?&  2   ?&  6   ?&  ,   4'  +   a'  0   ?'  &   ?'  2   ?'     (  .   !(  M   P(     ?(     ?(  A   ?(  Y   )  $   f)     ?)  7   ?)  5   ?)  0   *     3*  2   S*     ?*     ?*  +   ?*  2   ?*  1   +     P+  )   f+  4   ?+  '   ?+  0   ?+     ,     /,  ;   O,  ;   ?,  '   ?,  =   ?,  Q   --  2   -  @   ?-  :   ?-  n   ..  1   ?.  $   ?.     ?.     /     +/     B/  *   [/  )   ?/  )   ?/  8   ?/     0  '   30  B   [0  4   ?0  S   ?0     '1  9   B1  F   |1     ?1  Z   ?1  T   =2  ?   ?2     ?2  O   ?2  2   33  J   f3     ?3  /   ?3  8   ?3  0   (4     Y4  P   y4  "   ?4  1   ?4  /   5      O5  ,   p5  1   ?5     ?5  (   ?5  *   6  +   >6  +   j6  '   ?6  Q   ?6  3   7  G   D7  (   ?7  "   ?7  5   ?7     8  "   .8  )   Q8     {8     Y   *         -   <          ?      "   9   M   O           =   ^      0   w      y   ,   P                2   l          t   )   G   v   5   x   C       :      e   F       Z       ]       X             %   k   J   H   ;   [           U       i      d       
   E              N       $   a   b       T           !       6      D      h   (   &   g   f   u   A   K          W       #   1       V   n   B           I   +   o   _   8   s          Q                 4      /   7                                  S   `   L   c   >   \       m   p   '                 3   	      @       q   R   j           r             .    
If no output file is specified, the name is formed by adding .c to the
input file name, after stripping off .pgc if present.
 
Report bugs to <pgsql-bugs@postgresql.org>.
   --regression   run in regression testing mode
   -?, --help     show this help, then exit
   -C MODE        set compatibility mode; MODE can be one of
                 "INFORMIX", "INFORMIX_SE"
   -D SYMBOL      define SYMBOL
   -I DIRECTORY   search DIRECTORY for include files
   -V, --version  output version information, then exit
   -c             automatically generate C code from embedded SQL code;
                 this affects EXEC SQL TYPE
   -d             generate parser debug output
   -h             parse a header file, this option includes option "-c"
   -i             parse system include files as well
   -o OUTFILE     write result to OUTFILE
   -r OPTION      specify run-time behavior; OPTION can be:
                 "no_indicator", "prepare", "questionmarks"
   -t             turn on autocommit of transactions
 %s at or near "%s" %s is the PostgreSQL embedded SQL preprocessor for C programs.

 %s, the PostgreSQL embedded C preprocessor, version %s
 %s: could not locate my own executable path
 %s: could not open file "%s": %s
 %s: no input files specified
 %s: parser debug support (-d) not available
 AT option not allowed in CLOSE DATABASE statement AT option not allowed in CONNECT statement AT option not allowed in DISCONNECT statement AT option not allowed in SET CONNECTION statement AT option not allowed in TYPE statement AT option not allowed in VAR statement AT option not allowed in WHENEVER statement COPY FROM STDIN is not implemented CREATE TABLE AS cannot specify INTO ERROR:  EXEC SQL INCLUDE ... search starts here:
 Error: include path "%s/%s" is too long on line %d, skipping
 Options:
 SHOW ALL is not implemented Try "%s --help" for more information.
 Unix-domain sockets only work on "localhost" but not on "%s" Usage:
  %s [OPTION]... FILE...

 WARNING:  arrays of indicators are not allowed on input could not open include file "%s" on line %d could not remove output file "%s"
 cursor "%s" does not exist cursor "%s" has been declared but not opened cursor "%s" is already defined descriptor "%s" does not exist descriptor header item "%d" does not exist descriptor item "%s" cannot be set descriptor item "%s" is not implemented end of search list
 expected "://", found "%s" expected "@" or "://", found "%s" expected "@", found "%s" expected "postgresql", found "%s" incomplete statement incorrectly formed variable "%s" indicator for array/pointer has to be array/pointer indicator for simple data type has to be simple indicator for struct has to be a struct indicator variable "%s" is hidden by a local variable indicator variable "%s" is hidden by a local variable of a different type indicator variable must have an integer type initializer not allowed in EXEC SQL VAR command initializer not allowed in type definition internal error: unreachable state; please report this to <pgsql-bugs@postgresql.org> interval specification not allowed here invalid bit string literal invalid connection type: %s invalid data type key_member is always 0 missing "EXEC SQL ENDIF;" missing identifier in EXEC SQL DEFINE command missing identifier in EXEC SQL IFDEF command missing identifier in EXEC SQL UNDEF command missing matching "EXEC SQL IFDEF" / "EXEC SQL IFNDEF" more than one EXEC SQL ELSE multidimensional arrays are not supported multidimensional arrays for simple data types are not supported multidimensional arrays for structures are not supported multilevel pointers (more than 2 levels) are not supported; found %d level multilevel pointers (more than 2 levels) are not supported; found %d levels nested /* ... */ comments nested arrays are not supported (except strings) no longer supported LIMIT #,# syntax passed to server nullable is always 1 only data types numeric and decimal have precision/scale argument only protocols "tcp" and "unix" and database type "postgresql" are supported operator not allowed in variable definition out of memory pointer to pointer is not supported for this data type pointers to varchar are not implemented subquery in FROM must have an alias syntax error syntax error in EXEC SQL INCLUDE command too many levels in nested structure/union definition too many nested EXEC SQL IFDEF conditions type "%s" is already defined type name "string" is reserved in Informix mode unmatched EXEC SQL ENDIF unrecognized data type name "%s" unrecognized descriptor item code %d unrecognized token "%s" unrecognized variable type code %d unsupported feature will be passed to server unterminated /* comment unterminated bit string literal unterminated hexadecimal string literal unterminated quoted identifier unterminated quoted string using unsupported DESCRIBE statement using variable "%s" in different declare statements is not supported variable "%s" is hidden by a local variable variable "%s" is hidden by a local variable of a different type variable "%s" is neither a structure nor a union variable "%s" is not a pointer variable "%s" is not a pointer to a structure or a union variable "%s" is not an array variable "%s" is not declared variable "%s" must have a numeric type zero-length delimited identifier Project-Id-Version: ecpg (PostgreSQL) 10
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2017-08-02 13:57+0900
PO-Revision-Date: 2017-08-17 13:21+0900
Last-Translator: Ioseph Kim <ioseph@uri.sarang.net>
Language-Team: Korean Team <pgsql-kr@postgresql.kr>
Language: ko
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
 
출력 파일 이름을 지정하지 않으면 입력 파일 이름에 .pgc가 있을 경우 제거하고
.c를 추가하여 이름이 지정됩니다.
 
오류보고: <pgsql-bugs@postgresql.org>.
   --regression   회귀 테스트 모드에서 실행
   -?, --help     이 도움말을 보여주고 마침
   -C MODE        호환성 모드를 설정합니다. MODE는 다음 중 하나일 수 있습니다.
                 "INFORMIX", "INFORMIX_SE"
   -D SYMBOL      SYMBOL 정의
   -I DIRECTORY   DIRECTORY에서 포함 파일 검색
   -V, --version  버전 정보 보여주고 마침
   -c             포함된 SQL 코드에서 자동으로 C 코드를 생성합니다.
                 EXEC SQL TYPE에 영향을 줍니다.
   -d             파서 디버그 출력 생성
   -h             헤더 파일 구문 분석. 이 옵션은 "-c" 옵션 포함
   -i             시스템 포함 파일도 구문 분석
   -o OUTFILE     OUTFILE에 결과 쓰기
   -r OPTION      런타임 동작을 지정합니다. 사용 가능한 OPTION은 다음과 같습니다.
                 "no_indicator", "prepare", "questionmarks"
   -t             트랜잭션 자동 커밋 설정
 %s, "%s" 부근 %s은(는) C 프로그램용 PostgreSQL 포함 SQL 전처리기입니다.

 %s, PostgreSQL 포함 C 전처리기, 버전 %s
 %s: 실행 가능한 경로를 지정할 수 없습니다
 %s: "%s" 파일 열 수 없음: %s
 %s: 지정된 입력 파일 없음
 %s: 파서 디버그 지원(-d)을 사용할 수 없음
 CLOSE DATABASE 문에 AT 옵션이 허용되지 않음 CONNECT 문에 AT 옵션이 허용되지 않음 DISCONNECT 문에 AT 옵션이 허용되지 않음 SET CONNECTION 문에 AT 옵션이 허용되지 않음 TYPE 문에 AT 옵션이 허용되지 않음 VAR 문에 AT 옵션이 허용되지 않음 WHENEVER 문에 AT 옵션이 허용되지 않음 COPY FROM STDIN이 구현되지 않음 CREATE TABLE AS에서 INTO를 지정할 수 없음 오류:  EXEC SQL INCLUDE ... 여기서 검색 시작:
 오류: 포함 경로 "%s/%s"이(가) %d줄에서 너무 길어서 건너뜀
 옵션들:
 SHOW ALL이 구현되지 않음 자제한 사항은 "%s --help" 명령으로 살펴보십시오.
 Unix-domain 소켓은 "localhost"에서만 작동하며 "%s"에서는 작동하지 않음 사용:
  %s [OPTION]... 파일...

 경고:  입력에서 표시기의 배열이 허용되지 않음 포함 파일 "%s"을(를) %d줄에서 열 수 없음 출력 파일 "%s"을(를) 제거할 수 없음
 "%s" 이름의 커서가 없음 "%s" 커서가 선언되었지만 열리지 않음 "%s" 커서가 이미 정의됨 "%s" 설명자가 없음 설명자 헤더 항목 "%d"이(가) 없음 설명자 항목 "%s"을(를) 설정할 수 없음 설명자 항목 "%s"이(가) 구현되지 않음 검색 목록의 끝
 "://"가 필요한데 "%s"이(가) 있음 "@" 또는 "://"가 필요한데 "%s"이(가) 있음 "@"이 필요한데 "%s"이(가) 있음 "postgresql"이 필요한데 "%s"이(가) 있음 불완전한 문 잘못된 형식의 변수 "%s" 배열/포인터의 표시기는 배열/포인터여야 함 단순 데이터 형식의 표시기는 단순이어야 함 구조의 표시기는 구조여야 함 "%s" 지시자 변수가 지역 변수에 의해 숨겨졌음 "%s" 지시자 변수가 지역 변수의 다른 자료형 때문에 숨겨졌음 표시기 변수에 정수 형식이 있어야 함 EXEC SQL VAR 명령에 이니셜라이저가 허용되지 않음 형식 정의에 이니셜라이저가 허용되지 않음 내부 오류: 연결할 수 없습니다. 이 문제를 <pgsql-bugs@postgresql.org&gt;로 알려주십시오. 여기에는 간격 지정이 허용되지 않음 잘못된 비트 문자열 리터럴 잘못된 연결 형식: %s 잘못된 데이터 형식 key_member는 항상 0 "EXEC SQL ENDIF;" 누락 EXEC SQL DEFINE 명령에 식별자 누락 EXEC SQL IFDEF 명령에 식별자 누락 EXEC SQL UNDEF 명령에 식별자 누락 일치하는 "EXEC SQL IFDEF" / "EXEC SQL IFNDEF" 누락 두 개 이상의 EXEC SQL ELSE 다차원 배열이 지원되지 않음 단순 데이터 형식에 다차원 배열이 지원되지 않음 구조에는 다차원 배열이 지원되지 않음 다중단계 포인터(2단계 이상)는 지원하지 않음; 발견된 레벨: %d 중첩된 /* ... */ 주석 중첩된 배열은 지원되지 않음(문자열 제외) 더 이상 지원되지 않는 LIMIT #,# 구문이 서버에 전달됨 null 허용 여부는 항상 1 숫자 및 10진수 데이터 형식에만 전체 자릿수/소수 자릿수 인수 포함 "tcp" 및 "unix" 프로토콜과 데이터베이스 형식 "postgresql"만 지원됨 연산자는 동적 정의 영역에서는 사용할 수 없음 메모리 부족 이 데이터 형식에는 포인터에 대한 포인터가 지원되지 않음 varchar에 대한 포인터가 구현되지 않음 FROM 절 내의 subquery 에는 반드시 alias 를 가져야만 합니다 구문 오류 EXEC SQL INCLUDE 명령에 구문 오류 발생 중첩된 구조/union 정의에 수준이 너무 많음 중첩된 EXEC SQL IFDEF 조건이 너무 많음 "%s" 형식이 이미 정의됨 "string" 자료형 이름은 인포믹스 모드에서 예약어로 쓰입니다 일치하지 않는 EXEC SQL ENDIF 인식할 수 없는 데이터 형식 이름 "%s" 인식할 수 없는 설명자 항목 코드 %d 인식할 수 없는 토큰 "%s" 인식할 수 없는 변수 형식 코드 %d 지원되지 않는 기능이 서버에 전달됨 마무리 안된 /* 주석 마무리 안된 비트 문자열 문자 마무리 안된 16진수 문자열 문자 마무리 안된 따옴표 안의 식별자 마무리 안된 따옴표 안의 문자열 지원되지 않는 DESCRIBE 문 사용 서로 다른 선언 구문에서 "%s" 변수 사용은 지원하지 않습니다 "%s" 변수가 지역 변수에 의해 숨겨졌음 "%s" 변수가 다른 자료형의 지역 변수에 의해 숨겨졌음 "%s" 변수가 구조나 union이 아님 "%s" 변수가 포인터가 아님 "%s" 변수가 구조나 union의 포인터가 아님 "%s" 변수가 배열이 아님 "%s" 변수가 선언되지 않음 "%s" 변수는 숫자 형식이어야 함 길이가 0인 구분 식별자 