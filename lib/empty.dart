import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Empty extends StatefulWidget {
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  // bool _isInterstitialAdLoaded = false;
  // Widget _currentAd = SizedBox(
  //   height: 0.0,
  //   width: 0.0,
  // );

  void initState() {
    super.initState();
    //////////////facebook ad///////////
    // setState(
    //   () {
    //     _currentAd = FacebookBannerAd(
    //       placementId: "2824586241149867_2824687327806425",
    //       bannerSize: BannerSize.STANDARD,
    //       listener: (result, value) {
    //         print("BannerAd:$result --> $value");
    //       },
    //     );
    //   },
    // );
    //// FacebookAudienceNetwork.init(
    ////   testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6",
    // );
    // _isInterstitialAdLoaded = false;
    // _loadInterstitialAd();
    //////////////////////////////////
  }

  // void _loadInterstitialAd() {
  //   FacebookInterstitialAd.loadInterstitialAd(
  //     placementId: "2824586241149867_2824591921149299",
  //     listener: (result, value) {
  //       print("interstitialAd:$result --> $value");
  //       if (result == InterstitialAdResult.LOADED) {
  //         //
  //         _isInterstitialAdLoaded = true;
  //       }
  //       if (result == InterstitialAdResult.DISMISSED &&
  //           value['invalidated'] == true) {
  //         _isInterstitialAdLoaded = false;
  //         _loadInterstitialAd();
  //       }
  //     },
  //   );
  // }
  //
  // _showInterstitialAd() {
  //   if (_isInterstitialAdLoaded == true) {
  //     FacebookInterstitialAd.showInterstitialAd();
  //   } else {
  //     print("AD Not Loaded");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ETHIC EMPIRE",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "GENGETONE GODFATHERS",
            style: GoogleFonts.lato(
              color: Colors.white,
              // fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 20),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(200),
          bottomRight: Radius.circular(200),
        ),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.multiply),
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/ethic.jpg",
          ),
        ),
      ),
    );
  }
}
