tests
testSignature
	| validSignature input header desc badSignature length bytes reader value |
	validSignature := 'D0CF11E0A1B11AE1'.
	badSignature := validSignature copyReplaceAll: 'D' with: 'F'.
	input := ByteArray readHexFrom: validSignature.
	header := CfHeader on: input readStream.
	desc := header descriptionSignature.
	desc propertyAt: #cfOffset.
	length := desc propertyAt: #cfLength.
	bytes := header reference next: length.
	reader := desc propertyAt: #cfReader.
	value := reader cull: bytes.
	desc validate: value.