SHADER = /Applications/Aqsis.app/Contents/Resources/bin/aqsl
RENDER = /Applications/Aqsis.app/Contents/Resources/bin/aqsis -nocolor -displays=/Applications/Aqsis.app/Contents/Resources/lib -shaders=.:/Applications/Aqsis.app/Contents/Resources/share/aqsis/shaders/displacement:/Applications/Aqsis.app/Contents/Resources/share/aqsis/shaders/imager:/Applications/Aqsis.app/Contents/Resources/share/aqsis/shaders/light:/Applications/Aqsis.app/Contents/Resources/share/aqsis/shaders/surface:/Applications/Aqsis.app/Contents/Resources/share/aqsis/shaders/volume
EXT = slx

all: test.tiff

wall.$(EXT): wall.sl
	$(SHADER) wall.sl

wall_displacement.$(EXT): wall_displacement.sl
	$(SHADER) wall_displacement.sl

test.tiff: wall.rib wall.$(EXT) wall_displacement.$(EXT)
	$(RENDER) wall.rib

clean:
	 -f *~ *.$(EXT) test.tiff
