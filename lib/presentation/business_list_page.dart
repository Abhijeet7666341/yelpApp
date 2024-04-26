import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yelpapp/application/business_bloc.dart';
import 'package:yelpapp/constant/color_constant.dart';
import 'package:yelpapp/constant/text_constant.dart';
import 'package:yelpapp/constant/text_style_constant.dart';
import 'package:yelpapp/presentation/business_detail_page.dart';

class BusinessListPage extends StatelessWidget {
  final BusinessBloc bloc;

  const BusinessListPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    bloc.fetchBusinesses();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: appBarTitleTextStyle(),
        ),
        backgroundColor: Colors.amber.shade100,
      ),
      body: StreamBuilder<List<dynamic>>(
        stream: bloc.businessesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final businesses = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: businesses.length,
                itemBuilder: (context, index) {
                  final business = businesses[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BusinessDetailPage(business: business),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 110,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 80,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 0,
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: Image.network(
                                          business['image_url'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: Container(
                                          height: 17,
                                          color: business['is_closed']
                                              ? Colors.red
                                              : Colors.green,
                                          child: business['is_closed']
                                              ? Center(
                                                  child: Text("Closed",
                                                      style: statusTextStyle()),
                                                )
                                              : Center(
                                                  child: Text(
                                                    "Open",
                                                    style: statusTextStyle(),
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    business['name'],
                                    style: tileHeadingTextStyle(),
                                  ),
                                  Text(
                                    business['location']['display_address']
                                        .join(", "),
                                    style: tileSubTitleTextStyle(),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.reviews,
                                        color: lightBlack,
                                        size: 15.sp,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, bottom: 2),
                                        child: Text(
                                          business['review_count'].toString(),
                                          style: tilereviewCountTextStyle(),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        color: lightBlack,
                                        size: 15.sp,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, bottom: 2),
                                        child: Text(
                                          "${business['distance'].toStringAsFixed(0)} Km",
                                          style: tilereviewCountTextStyle(),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: goldenColor,
                                        size: 15.sp,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, bottom: 2),
                                        child: Text(
                                          business['rating'].toString(),
                                          style: tilereviewCountTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: lightBlack,
                                        size: 15.sp,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, bottom: 2),
                                        child: Text(
                                          business['phone'].toString(),
                                          style: tilePhoneTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: CircleAvatar(
                                radius: 9,
                                backgroundColor: greyColor.withOpacity(0.4),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: whiteColor,
                                  size: 12.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
