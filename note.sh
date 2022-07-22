echo Don\'t execute it for now
return

# IContainsSystemSignature.jks is generated from Android Studio
# Then download the platform.pk8 and platform.x509.pem from the Android Open source project github page.

# You will need to download this tool
# keytool-importkeypair

keytool-importkeypair -k IContainsSystemSignature.jks -p 123456 -pk8 platform.pk8 -cert platform.x509.pem -alias key0

# After execute this command, add these lines to the build.gradle(Module) file in the Android Studio.

signingConfigs {
	release {
		keyAlias 'key0' // success
		// keyAlias 'testkey' //fail

		keyPassword '123456'
		storeFile file('/home/guhao/QuickSignSystemApp/IContainsSystemSignature.jks')
		storePassword '123456'
	}
	debug {
		keyAlias 'key0'
		keyPassword '123456'
		storeFile file('/home/guhao/QuickSignSystemApp/IContainsSystemSignature.jks')
		storePassword '123456'
	}
}
