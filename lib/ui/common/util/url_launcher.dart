import 'package:url_launcher/url_launcher.dart';

//Actual Function to launch external links.
launchURL() async {
  final String googleMapsUrl =
      "https://www.google.com/maps/place/Dinas+Perindustrian+dan+Perdagangan+Kota+Jambi/@-1.6196447,103.5750028,13z/data=!4m8!1m2!2m1!1skantor+disperindag+di+dekat+Jambi,+Kota+Jambi,+Jambi!3m4!1s0x2e258620c33a0701:0xcd0860091ac49a15!8m2!3d-1.6306739!4d103.6084778";
  final String appleMapsUrl =
      "https://www.google.com/maps/place/Dinas+Perindustrian+dan+Perdagangan+Kota+Jambi/@-1.6196447,103.5750028,13z/data=!4m8!1m2!2m1!1skantor+disperindag+di+dekat+Jambi,+Kota+Jambi,+Jambi!3m4!1s0x2e258620c33a0701:0xcd0860091ac49a15!8m2!3d-1.6306739!4d103.6084778";

  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  }
  if (await canLaunch(appleMapsUrl)) {
    await launch(appleMapsUrl, forceSafariVC: false);
  } else {
    throw "Couldn't launch URL";
  }
}
