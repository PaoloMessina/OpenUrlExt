# OpenUrlExt
Open a specific URL in the external browser of the hosting OS.

## Installation

    cordova plugin add https://github.com/PaoloMessina/OpenUrlExt

## License

This plugin is released under the MIT license

## API

### open

	OpenUrlExt.open(url, onSuccess, onFailure);

Arguments:

- **url**: The url too open, will be encoded.
- **onSuccess**: function (s) {...} _Callback for successful scan._
- **onFailure**: function (s) {...} _Callback for cancelled scan or error._

Return:

- success() _Successful opening_
- error() _Error on opening_

Status:

- Android: DONE
- iOS: DONE

Quirks:

- __Android__: The plugin is not native but a simple call to javascript that just working well.

