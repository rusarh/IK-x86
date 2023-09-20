@rem del cc.txt
@echo Compile karate
@del tmp\karate.obj > NUL
@..\SOFT\lzasmx /S /C /Z karate ka > compile.log
@..\SOFT\tlink  /S ka.obj 