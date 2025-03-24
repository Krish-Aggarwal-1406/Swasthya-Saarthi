import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'SignUpPage.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final PageController controller = PageController();
  final List<String> images = [
    'assets/Screenshot 2025-03-16 115132.png',
    'assets/Screenshot 2025-03-16 165408.png',
    'assets/img1.png',
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .18,
            ),
            Container(
              height: height * .4,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: images.length,
                controller: controller,
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Text("Swashtya Saarthi",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40),),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment(0, 0),
                child: Text(
                  "Fast to share,Easy to care",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                )),
            SizedBox(
              height: height * .08,
            ),
            SmoothPageIndicator(
              controller: controller,
              count: images.length,
              effect: WormEffect(
                dotColor: Colors.grey.shade300,
                  activeDotColor: Colors.blue, dotHeight: 5, dotWidth: 45,),
            ),
            SizedBox(
              height: height * .05,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {Get.to(() => SignUpPage());},
                child: Container(
                    height: height * .06,
                    width: width * .7,
                    alignment: Alignment.center,
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )))
          ],
        ),
      ),
    );
  }
}
