module.exports = {

    startMiSnapPluginSDK: function(side) {
        cordova.exec(success,
                     fail,
                     "MiSnapPlugin",
                     "cordovaCallMiSnap",
                     [side]);
    }

};