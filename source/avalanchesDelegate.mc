import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Position;

class avalanchesDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new avalanchesMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
}
