as yet unclassified
exampleExporation
	| inputFile s file header clsid minor major byteOrder sectorShift sectorSize miniSectorShift miniSectorSize dirSectorCount fatSectorCount dirSectorStart transactionSignature miniStreamCutoffSize miniFatStart miniFatCount difatStart difatCount difat fat dirSect miniFatSect |
	inputFile := FileLocator home / 'Dropbox (Personal)' / 'Emails 2016-17' / 'my_email.msg'.
	s := inputFile binaryReadStream.
	file := CompoundFile on: inputFile.
	header := s next: 8.
	self assert: header hex = 'd0cf11e0a1b11ae1'.
	clsid := s next: 16.
	minor := s nextLittleEndianNumber: 2.
	major := s nextLittleEndianNumber: 2.
	byteOrder := s nextLittleEndianNumber: 2.
	self assert: byteOrder hex = '16rFFFE'.
	sectorShift := s nextLittleEndianNumber: 2.
	sectorSize := 2 raisedTo: sectorShift.
	miniSectorShift := s nextLittleEndianNumber: 2.
	miniSectorSize := 2 raisedTo: miniSectorShift.
	self assert: ((s next: 6) allSatisfy: [ :e | e = 0 ]).
	dirSectorCount := s nextLittleEndianNumber: 4.
	self assert: dirSectorCount = 0.	"for version 3"
	fatSectorCount := s nextLittleEndianNumber: 4.
	dirSectorStart := s nextLittleEndianNumber: 4.
	transactionSignature := s nextLittleEndianNumber: 4.
	miniStreamCutoffSize := s nextLittleEndianNumber: 4.
	self assert: miniStreamCutoffSize hex = '16r1000'.
	miniFatStart := s nextLittleEndianNumber: 4.
	miniFatCount := s nextLittleEndianNumber: 4.
	difatStart := s nextLittleEndianNumber: 4.
	difatCount := s nextLittleEndianNumber: 4.
	difat := (1 to: 109) collect: [ :i | s nextLittleEndianNumber: 4 ].
	fat := s next: 512.
	dirSect := s next: 512.
	miniFatSect := s next: 512.
	s nextLittleEndianNumber: 4