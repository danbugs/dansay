CPPFLAGS=-stdlib=libc++
CPPFILES=dansay.cpp
CPPOUTPUT=-o bin/dansay.exe
CPPCOMPILER=clang++

windows:
	$(CPPCOMPILER) $(CPPFLAGS) $(CPPFILES) -o dansay.exe -target x86_64-pc-windows-unknown
linux:
	$(CPPCOMPILER) $(CPPFLAGS) $(CPPFILES) -o dansay -target x86_64-unknown-linux-unknown
osx:
	$(CPPCOMPILER) $(CPPFLAGS) $(CPPFILES) -o dansay -target x86_64-apple-darwin-unknown
