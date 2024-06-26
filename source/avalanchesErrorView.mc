import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

class avalanchesErrorView extends WatchUi.View {

    var errorMessage = null;

    function initialize(error) {
        View.initialize();
        errorMessage = error;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.ErrorLayout(dc));

        if (errorMessage) {
          var errorElement = self.findDrawableById("ErrorMessage") as TextArea;
          errorElement.setText(errorMessage);
        }
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
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function onMenu() as Boolean {
      WatchUi.pushView(new Rez.Menus.MainMenu(), new avalanchesMenuDelegate(), WatchUi.SLIDE_UP);
      return true;
    }
}
