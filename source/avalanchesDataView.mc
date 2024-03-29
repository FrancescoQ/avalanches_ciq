import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Lang;

class avalanchesDataView extends WatchUi.View {

    var responseJSONData = null;

    var baseUrl = "http://127.0.0.1:32782";

    function initialize() {
        View.initialize();
    }

    function onReceive(responseCode as Lang.Number, responseData as Null or Lang.Dictionary or Lang.String) as Void {
        if (responseCode == 200) {
            responseJSONData = responseData;
            WatchUi.requestUpdate();
        }
        else {
            WatchUi.switchToView(new avalanchesErrorView("Error " + responseCode + " while fetching data"), new avalanchesBaseDelegate(), WatchUi.SLIDE_DOWN);
        }
    }

    function onBack() {
        WatchUi.switchToView(new avalanchesView(), null, WatchUi.SLIDE_LEFT);
    }
}
