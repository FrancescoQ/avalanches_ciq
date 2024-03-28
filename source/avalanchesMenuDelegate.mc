import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Communications;
import Toybox.Position;

class avalanchesMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :arpav) {
            System.println("ARPAV");
            WatchUi.switchToView(new arpavDataView("some data test"), null, WatchUi.SLIDE_IMMEDIATE);
        } else if (item == :aineva_location) {
            System.println("AINEVA Location");
            WatchUi.switchToView(new ainevaAutoDataView(), null, WatchUi.SLIDE_IMMEDIATE);

            /* Position.enableLocationEvents(Position.LOCATION_ONE_SHOT, null);
            var info = Position.getInfo();
            var myLocation = info.position.toDegrees();
            System.println("Latitude: " + myLocation[0]); // e.g. 38.856147
            System.println("Longitude: " + myLocation[1]); // e.g -94.800953 */
        }
        else if (item == :aineva_manual) {
            System.println("AINEVA Manual");
        }
    }
}
