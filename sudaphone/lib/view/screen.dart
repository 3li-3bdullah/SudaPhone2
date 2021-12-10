import 'package:flutter/material.dart';
import 'package:sudaphone/constants.dart';
import './widgets/custom_text.dart';
import './widgets/categories_logo.dart';
import './widgets/last_product.dart';
import './widgets/data_search.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:core';

class Screen extends StatelessWidget {
  // int activeIndex = 0;

  final controllerCarousel =
      PageController(viewportFraction: 0.8, keepPage: true);
  final List<MaterialColor> colors = const [
    Colors.green,
    Colors.red,
    Colors.indigo,
    Colors.pink,
    Colors.blue,
    Colors.amber,
  ];
  final List<String> imagesCarousel = [
    "assets/images/slider/1.png",
    "assets/images/slider/2.png",
    "assets/images/slider/3.jpg",
    "assets/images/slider/4.jpg",
    "assets/images/slider/5.jpg",
    "assets/images/slider/6.jpg",
  ];

  Screen({Key? key}) : super(key: key);
  Widget buildImage(String imagesCarousel, int index, double width) =>
      Container(
          // margin: EdgeInsets.symmetric(horizontal: 2),
          color: Colors.grey,
          width: width,
          child: Image.asset(
            imagesCarousel,
            fit: BoxFit.cover,
            width: width,
          ));
  Widget buildIndicator() => SmoothPageIndicator(
        controller: controllerCarousel,
        count: imagesCarousel.length,
        effect: CustomizableEffect(
          activeDotDecoration: DotDecoration(
            width: 32,
            height: 12,
            color: Colors.white,
            rotationAngle: 180,
            verticalOffset: -10,
            borderRadius: BorderRadius.circular(24),
            dotBorder: const DotBorder(
              padding: 2,
              width: 2,
              color: Colors.black,
            ),
          ),
          dotDecoration: const DotDecoration(
            width: 24,
            height: 12,
            color: Colors.grey,
            dotBorder: DotBorder(
              padding: 2,
              width: 2,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(2)),
            //borderRadius: BorderRadius.circular(16),
            verticalOffset: 0,
          ),
          spacing: 6.0,
          // activeColorOverride: (i) => colors[i],
          inActiveColorOverride: (i) => colors[i],
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double halfheight = height / 2;
    double partOfHeight = height / 10;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                  icon: const Icon(Icons.menu_rounded), onPressed: () {}),
            ),

            /// drawer: MyDrawer(),
            body: ListView(children: [
              Container(
                height: size.height * 0.2,
                margin: const EdgeInsets.only(bottom: 50),
                child: Stack(
                  children: [
                    Container(
                        height: size.height * 0.2 - 27,
                        margin: const EdgeInsets.only(
                            left: kDefaultPadding,
                            right: kDefaultPadding,
                            bottom: 36 + kDefaultPadding),
                        decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        child: Row(children: [
                          const CustomText(
                              text: 'سودافون',
                              fontWeight: FontWeight.bold),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Image(
                                  image: AssetImage(
                                      'assets/images/slider/ali.jpg')))
                        ])),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Container(
                            height: 54,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 10),
                                    blurRadius: 50,
                                    color: kPrimaryColor.withOpacity(0.23),
                                  )
                                ]),
                            child: Row(children: [
                              Expanded(
                                child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'البحث',
                                        hintStyle: TextStyle(
                                            color:
                                                kPrimaryColor.withOpacity(0.5)),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none)),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showSearch(
                                        context: context,
                                        delegate: DataSearch());
                                  },
                                  icon: const Icon(Icons.search))
                            ])))
                  ],
                ),
              ),
              SizedBox(
                height: halfheight,
                width: MediaQuery.of(context).size.width,
                child: GridTile(
                  child: PageView.builder(
                    allowImplicitScrolling: true,
                    controller: controllerCarousel,
                    itemCount: imagesCarousel.length,
                    itemBuilder: (context, index) {
                      String imagesCar = imagesCarousel[index];
                      return SizedBox(
                          height: height,
                          width: width,
                          child: buildImage(imagesCar, index, width));
                    },
                  ),
                  footer: Container(
                    height: 60,
                    color: Colors.black.withOpacity(0.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildIndicator(),
                      ],
                    ),
                  ),
                ),
                //const sizedBox(height:32),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const CustomText(
                  text: "الأقسام",
                  textAlign: TextAlign.right,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                  height: 120,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/huawei.png",
                      text: "Huawei",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/iphone.jpg",
                      text: "Apple",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/realme.png",
                      text: "Realme",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/lenovo.png",
                      text: "Lenovo",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/vivo.png",
                      text: "Vivo",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/samsung.jpg",
                      text: "Samsung",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/xiaomi.png",
                      text: "Xiaomi",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/oppo.jpg",
                      text: "Oppo",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/tecno.png",
                      text: "Tecno",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "assets/images/logo/nokia.jpg",
                      text: "Nokia",
                      onTap: () {},
                    ),
                  ])),
              Container(
                padding: const EdgeInsets.all(10),
                child: const CustomText(
                  text: "أحدث التلفونات",
                  textAlign: TextAlign.right,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: halfheight + partOfHeight,
                child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    children: [
                      LastProduct(
                          imageProduct: "assets/images/product/huawei.jpg",
                          text: "Huawei Mate 40 Pro : 1000\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "assets/images/product/samsung.jpg",
                          text: "Samsung S20 Ultra : 999\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "assets/images/product/iphone.jpg",
                          text: "iPhone 12 pro max : 1170\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "assets/images/product/xiaomi.jpg",
                          text: "Xiaomi Mi 10T  : 950\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "assets/images/product/oppo.jpg",
                          text: "Oppo F17 Pro : 975\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "assets/images/product/lenovo.jpg",
                          text: "Lenovo K12 Pro : 800\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "assets/images/product/nokia.jpg",
                          text: "Nokia G300 : 750\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "assets/images/product/realme.jpg",
                          text: "Realme race teaser : 900\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "assets/images/product/tecno.jpg",
                          text: "Tecno Spark6 : 850\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "assets/images/product/vivo.jpeg",
                          text: "Vivo Y53s : 950\$",
                          onTap: () {}),
                    ]),
              ),
            ]),
          )),
    );
  }
}
