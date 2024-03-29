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
            WatchUi.switchToView(new arpavDataView(), new avalanchesBaseDelegate(), WatchUi.SLIDE_DOWN);
        } else if (item == :aineva_location) {
            WatchUi.switchToView(new ainevaAutoDataView(), new avalanchesBaseDelegate(), WatchUi.SLIDE_DOWN);
        }
        else if (item == :aineva_manual) {
        }
    }
}
