import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Communications;
using Toybox.Position;
using Toybox.WatchUi as Ui;

class avalanchesMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

   function onReceive(response as Lang.Number, responseData as Null or Lang.Dictionary or Lang.String) as Void {
    var test = responseData[0]["login"];
     System.println("!");
     Ui.switchToView(new arpavDataView("some data test"), null, Ui.SLIDE_IMMEDIATE);
   }

    function onMenuItem(item as Symbol) as Void {
        if (item == :arpav) {
            System.println("ARPAV");

            var url = "https://meteo.arpa.veneto.it/meteo/bollettini_nv/it/xml/dolomiti_nevevalanghe.xml";                         // set the url
            url = "https://api.github.com/users/hadley/orgs";
            var params = null;

            var options = {                                             // set the options
                :method => Communications.HTTP_REQUEST_METHOD_GET,      // set HTTP method
                :headers => {                                           // set headers
                    "Content-Type" => Communications.REQUEST_CONTENT_TYPE_URL_ENCODED,
                },
            };

            var responseCallback = method(:onReceive);                  // set responseCallback to
                                                                        // onReceive() method
            // Make the Communications.makeWebRequest() call
            Communications.makeWebRequest(url, params, options, responseCallback);


        } else if (item == :aineva_location) {
            System.println("AINEVA Location");
            Position.enableLocationEvents(Position.LOCATION_ONE_SHOT, null);
            var info = Position.getInfo();
            var myLocation = info.position.toDegrees();
            System.println("Latitude: " + myLocation[0]); // e.g. 38.856147
            System.println("Longitude: " + myLocation[1]); // e.g -94.800953
        }
        else if (item == :aineva_manual) {
            System.println("AINEVA Manual");
        }
    }
}
