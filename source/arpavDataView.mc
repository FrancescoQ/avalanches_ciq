import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System;

class arpavDataView extends WatchUi.View {

    function initialize(data) {
        View.initialize();
        System.println(data);
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.ArpavDataView(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
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
