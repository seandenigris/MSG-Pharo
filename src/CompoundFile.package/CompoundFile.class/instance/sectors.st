as yet unclassified
sectors
	sectors ifNotNil: [ ^ sectors ].
	sectors := OrderedCollection new.
	self reference readStreamDo: [ :s | 
		s binary.
		[ s atEnd ] whileFalse: [ sectors add: (s next: 512) ] ].
	^ sectors