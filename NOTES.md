Rsync logs a line for each file added, with the following head and tail:

rsync  version 2.6.9  protocol version 29

Head:
```
rsync -vha --exclude=sources/install.wim /Volumes/CCCOMA_X64FRE_EN-US_DV9/* /Volumes/WINDOWS11
building file list ... done # head
```

Tail:
```
support/logging/windeployetw.dll
support/logging/winsetupetw.dll
support/logging/en-us/
support/logging/en-us/actionqueueetw.dll.mui # the last file

sent 739.39M bytes  received 21.30K bytes  1.22M bytes/sec
total size is 739.23M  speedup is 1.00

```