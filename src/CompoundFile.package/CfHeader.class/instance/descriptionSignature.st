as yet unclassified
descriptionSignature
	^ MAStringDescription new
			accessor: #signature;
			addCondition: [ :value | value = 'D0CF11E0A1B11AE1' ];
			propertyAt: #cfLength put: 8;
			propertyAt: #cfOffset put: 0;
			propertyAt: #cfReader put: [ :bytes | bytes hex asUppercase ];
			yourself