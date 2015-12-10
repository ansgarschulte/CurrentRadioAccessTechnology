# Cordova CurrentRadioAccessTechnology Plugin

Simple plugin that returns if af Celluar Connection isFast or slow.

Uses CTTelephonyNetworkInfo.currentRadioAccessTechnology

Based on http://www.codeitive.com/0iHVjkVgek/detect-carrier-connection-type-3g-edge-gprs.html

## Using
Clone the plugin

Create a new Cordova Project

Install the plugin


Edit `www/js/index.js` and add the following code inside `onDeviceReady`

```js
    var success = function(message) {
        alert(message);
    }

    var failure = function() {
        alert("Error calling Hello Plugin");
    }

    currentradioaccesstechnology.isFast(function(isFast) {
                if (isFast) {
                    isFastCallback();
                } else {
                    Ext.Msg.alert('Netzwerk', 'Bitte stellen Sie eine WLAN oder UMTS Verbindung her');
                }
            }, function(error){
                console.log(error);
            });
```

Install iOS platform

    cordova platform add ios

Run the code

    cordova run

## More Info

Uses private API. Not for Appstore Releases

For more information on setting up Cordova see [the documentation](http://cordova.apache.org/docs/en/4.0.0/guide_cli_index.md.html#The%20Command-Line%20Interface)

For more info on plugins see the [Plugin Development Guide](http://cordova.apache.org/docs/en/4.0.0/guide_hybrid_plugins_index.md.html#Plugin%20Development%20Guide)
