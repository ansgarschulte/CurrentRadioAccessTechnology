/*global cordova, module*/

module.exports = {
    isFast: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "CurrentRadioAccessTechnology", "isFast", []);
    },
    getTechnology: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "CurrentRadioAccessTechnology", "getTechnology", []);
    }
};
