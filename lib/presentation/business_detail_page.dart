import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yelpapp/constant/color_constant.dart';
import 'package:yelpapp/constant/text_constant.dart';
import 'package:yelpapp/constant/text_style_constant.dart';

class BusinessDetailPage extends StatelessWidget {
  final dynamic business;

  const BusinessDetailPage({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    List<dynamic> categories = business['categories'];

    // Creating a list of category titles
    List categoryTitles = categories.map((category) => category['title']).toList();

    // Concatenating category titles into a single string separated by commas
    String categoriesText = categoryTitles.join(", ");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          businessDetail,
          style: appBarTitleTextStyle(),
        ),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 120,
                  width: 100,
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
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        business['name'],
                        style: nameTextStyle(),
                      ),
                      Text(
                        business['location']['display_address'].join(", "),
                        style: addressTextStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    '${business['rating']}',
                    style: ratingTextStyle(),
                  ),
                ),
                RatingBarIndicator(
                  rating: business['rating'],
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),

            const SizedBox(height: 10),
            Divider(
              height: 0.5,
              color: greyColor.withOpacity(0.5),
            ),
            const SizedBox(height: 10),
            Text("Phone", style:  detailHeadingTextStyle(),),
            Text(
              '${business['phone']}',
              style: detailValueTextStyle(),
            ),
            const SizedBox(height: 10),
            Text("Display Phone", style:  detailHeadingTextStyle(),),
            Text(
              '${business['display_phone']}',
              style: detailValueTextStyle(),
            ),
            const SizedBox(height: 10),
            Text("Categories", style:  detailHeadingTextStyle(),),
            Text(
              categoriesText,
              style: detailValueTextStyle(),
            ),
            const SizedBox(height: 10),
            Text("Dining Options", style:  detailHeadingTextStyle(),),
            Text(
              business['transactions'].join(", "),
              style: detailValueTextStyle(),
            ),
            const SizedBox(height: 10),
            Text("Distance", style:  detailHeadingTextStyle(),),
            Text(
              "${business['distance'].toStringAsFixed(0)} Km",
              style: detailValueTextStyle(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
