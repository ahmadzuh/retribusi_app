import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:retribusi_app/constant/color_constant.dart';
import 'package:retribusi_app/constant/style_constant.dart';
import 'package:retribusi_app/environments/environment.dart';
import 'package:retribusi_app/models/carousel_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: SvgPicture.asset('${Environment.svgAssets}travelkuy_logo.svg'),
        elevation: 0,
      ),

      // Setting up Background Color
      backgroundColor: mBackgroundColor,

      // Setting up Custom Bottom Navigation Bar

      // Body
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Promos Section
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 24),
              child: Text(
                'Hi, Franklin 👋 This Promos for You',
                style: mTitleStyle,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(
                                  carousels[index].image,
                                ),
                                fit: BoxFit.fill),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(
                          carousels,
                          (index, image) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? mBlueColor
                                      : mGreyColor),
                            );
                          },
                        ),
                      ),

                      // More
                      Text(
                        'More...',
                        style: mMoreDiscountStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),

            // Service Section
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                'Let\'s Booking!',
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 144,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_flight_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Flight',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Feel freedom',
                                      style: mServiceSubtitleStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_train_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Trains',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Intercity',
                                      style: mServiceSubtitleStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_hotel_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Hotel',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Let\'s take a break',
                                      style: mServiceSubtitleStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_car_rental_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Car Rental',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Around the city',
                                      style: mServiceSubtitleStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // Popular Destination Section
          ],
        ),
      ),
    );
  }
}
