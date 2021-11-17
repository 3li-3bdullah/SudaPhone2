import 'package:flutter/material.dart';
import './widgets/custom_text.dart';
import './widgets/categories_logo.dart';
import './widgets/last_product.dart';
import './widgets/data_search.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:core';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<Screen> {
  int activeIndex = 0;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  List<MaterialColor> colors = const [
    Colors.green,
    Colors.red,
    Colors.indigo,
    Colors.pink,
    Colors.blue,
    Colors.amber,
  ];
  List<String> imagesCarousel = [
    "example/images/slider/1.png",
    "example/images/slider/2.png",
    "example/images/slider/3.jpg",
    "example/images/slider/4.jpg",
    "example/images/slider/5.jpg",
    "example/images/slider/6.jpg",
  ];
  Widget buildImage(String imagesCarousel, int index) => Container(
      // margin: EdgeInsets.symmetric(horizontal: 2),
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        imagesCarousel,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
      ));
  Widget buildIndicator() => SmoothPageIndicator(
        controller: controller,
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
    // ThemeData(fontFamily: 'Cairo');
    double screenHeight = MediaQuery.of(context).size.width;
    double halfheight = screenHeight / 2;
    double partOfHeight = screenHeight / 10;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SudaPhone",
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
                title: const CustomText(
                    text: 'SudaPhone',
                    textAlign: TextAlign.center,
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                backgroundColor: Colors.white,
                centerTitle: true,
                elevation: 6,
                actions: [
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(context: context, delegate: DataSearch());
                      })
                ],
                leading: const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/slider/ali.jpg"),
                        radius: 30))
                // leading: IconButton(icon: Icon(Icons.search), onPressed: () {}),
                ),

            /// drawer: MyDrawer(),
            body: ListView(children: [
              SizedBox(
                height: halfheight,
                width: MediaQuery.of(context).size.width,
                child: GridTile(
                  child: PageView.builder(
                    controller: controller,
                    itemCount: imagesCarousel.length,
                    itemBuilder: (context, index) {
                      String imagesCar = imagesCarousel[index];
                      return buildImage(imagesCar, index);
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
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                  height: 120,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    CategoriesLogo(
                      imageLogo: "example/images/logo/huawei.png",
                      text: "Huawei",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "example/images/logo/iphone.jpg",
                      text: "Apple",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "example/images/logo/realme.png",
                      text: "Realme",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "example/images/logo/lenovo.png",
                      text: "Lenovo",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "example/images/logo/vivo.png",
                      text: "Vivo",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "example/images/logo/samsung.jpg",
                      text: "Samsung",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "example/images/logo/xiaomi.png",
                      text: "Xiaomi",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "example/images/logo/oppo.jpg",
                      text: "Oppo",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "example/images/logo/tecno.png",
                      text: "Tecno",
                      onTap: () {},
                    ),
                    CategoriesLogo(
                      imageLogo: "example/images/logo/nokia.jpg",
                      text: "Nokia",
                      onTap: () {},
                    ),
                  ])),
              Container(
                padding: const EdgeInsets.all(10),
                child: const CustomText(
                  text: "أحدث التلفونات",
                  textAlign: TextAlign.right,
                  color: Colors.black,
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
                          imageProduct: "example/images/product/huawei.jpg",
                          text: "Huawei Mate 40 Pro : 1000\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "example/images/product/samsung.jpg",
                          text: "Samsung S20 Ultra : 999\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "example/images/product/iphone.jpg",
                          text: "iPhone 12 pro max : 1170\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "example/images/product/xiaomi.jpg",
                          text: "Xiaomi Mi 10T  : 950\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "example/images/product/oppo.jpg",
                          text: "Oppo F17 Pro : 975\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "example/images/product/lenovo.jpg",
                          text: "Lenovo K12 Pro : 800\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "example/images/product/nokia.jpg",
                          text: "Nokia G300 : 750\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "example/images/product/realme.jpg",
                          text: "Realme race teaser : 900\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "example/images/product/tecno.jpg",
                          text: "Tecno Spark6 : 850\$",
                          onTap: () {}),
                      LastProduct(
                          imageProduct: "example/images/product/vivo.jpeg",
                          text: "Vivo Y53s : 950\$",
                          onTap: () {}),
                    ]),
              ),
            ]),
          )),
    );
  }
}
