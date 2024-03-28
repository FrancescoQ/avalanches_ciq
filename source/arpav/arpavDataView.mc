import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Lang;

class arpavDataView extends WatchUi.View {

    var arpavJSONData = null;

    function initialize(data) {
        View.initialize();
    }

    function onReceive(response as Lang.Number, responseData as Null or Lang.Dictionary or Lang.String) as Void {
        arpavJSONData = responseData;
        WatchUi.requestUpdate();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.ArpavDataView(dc));

        var url = "https://meteo.arpa.veneto.it/meteo/bollettini_nv/it/xml/dolomiti_nevevalanghe.xml";
        url = "https://api.github.com/users/hadley/orgs";
        var params = null;

        var options = {
            :method => Communications.HTTP_REQUEST_METHOD_GET,
            :headers => {
                "Content-Type" => Communications.REQUEST_CONTENT_TYPE_URL_ENCODED,
            },
        };

        var onReceiveCallback = method(:onReceive);
        Communications.makeWebRequest(url, params, options, onReceiveCallback);

        var drw = self.findDrawableById("BlockOfText") as TextArea;
        drw.setBackgroundColor(Graphics.COLOR_GREEN);
        drw.setText("text changed in 'onLayout'");
    }

    function onBack() {
        WatchUi.switchToView(new avalanchesView(), null, WatchUi.SLIDE_IMMEDIATE);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // any dc calls related to the layout should appear before View.onUpdate();
        if (arpavJSONData != null) {
            var text = arpavJSONData[0]["login"];
            var drw = self.findDrawableById("mylabel") as Text;
            drw.setBackgroundColor(Graphics.COLOR_RED);
            drw.setText(text);
        }

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        // @todo handle scroll https://forums.garmin.com/developer/connect-iq/f/discussion/999/render-a-long-string/5516#5516
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
