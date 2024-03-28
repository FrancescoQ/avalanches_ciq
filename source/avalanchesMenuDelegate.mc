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
            WatchUi.switchToView(new arpavDataView(), null, WatchUi.SLIDE_RIGHT);
        } else if (item == :aineva_location) {
            WatchUi.switchToView(new ainevaAutoDataView(), null, WatchUi.SLIDE_RIGHT);
        }
        else if (item == :aineva_manual) {
        }
    }
}
