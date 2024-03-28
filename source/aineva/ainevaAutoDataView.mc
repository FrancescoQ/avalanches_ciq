import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Lang;

class ainevaAutoDataView extends WatchUi.View {

    var ainevaJSONData = null;

    function initialize() {
        View.initialize();
    }

    function onReceive(response as Lang.Number, responseData as Null or Lang.Dictionary or Lang.String) as Void {
        ainevaJSONData = responseData;
        WatchUi.requestUpdate();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.ArpavDataView(dc));

        Position.enableLocationEvents(Position.LOCATION_ONE_SHOT, null);
        var info = Position.getInfo();
        var currentLocation = info.position.toDegrees();
       /*  System.println("Latitude: " + myLocation[0]); // e.g. 38.856147
        System.println("Longitude: " + myLocation[1]); // e.g -94.800953 */

        var url = "https://nvdata.ddev.site/aineva/coordinates/" + currentLocation[0] + "/" + currentLocation[1];

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
        drw.setText("AINEVA!");
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
        if (ainevaJSONData != null) {
            //var text = ainevaJSONData[0]["login"];
            var drw = self.findDrawableById("mylabel") as Text;
            drw.setBackgroundColor(Graphics.COLOR_RED);
            drw.setText("text");
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
