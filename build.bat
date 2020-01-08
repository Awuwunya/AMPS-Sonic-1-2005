@echo off
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
asm68k /m /p /o ae- sonic1.asm, s1built.dat, , .lst>.log
type .log
if NOT EXIST s1built.dat pause & exit
call AMPS/z80.bat
error\convsym .lst s1built.md -input asm68k_lst -inopt "/localSign=. /localJoin=. /ignoreMacroDefs+ /ignoreMacroExp- /addMacrosAsOpcodes+" -a
fixheadr.exe s1built.md
del AMPS\.Data
del AMPS\z80.bat
del AMPS\merge.asm
del AMPS\fix.asm
del AMPS\.z80
del AMPS\._z80
del AMPS\.z80.kos
del s1built.dat
