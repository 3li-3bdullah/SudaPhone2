import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/categories_pages/samsung.dart';
import 'package:sudaphone/view/widgets/categories_card.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    ///ThemeData(fontFamily: 'Cairo');

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const CustomText(text: "الأقسام", textAlign: TextAlign.center, color: Colors.black,
                 fontSize: 30, fontWeight: FontWeight.normal),
                centerTitle: true,
              ),
              /// drawer: MyDrawer(),
              body: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.all(5),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    CategoriesCard(
                      imageCat: "example/images/category/samsung.png",
                      text: "Samsung",
                      onTap: () {
                        Get.to(Samsung()
                        ,transition: Transition.zoom,
                        curve: Curves.bounceInOut
                        );
                      },
                    ),
                    CategoriesCard(
                      imageCat: "example/images/category/huawei.png",
                      text: "Huawei",
                      onTap: () {},
                    ),
                    CategoriesCard(
                      imageCat: "example/images/category/apple.jpg",
                      text: "Apple",
                      onTap: () {},
                    ),
                    CategoriesCard(
                      imageCat: "example/images/category/oppo.png",
                      text: "Oppo",
                      onTap: () {},
                    ),
                    CategoriesCard(
                      imageCat: "example/images/category/xiaomi.png",
                      text: "Xiaomi",
                      onTap: () {},
                    ),
                    CategoriesCard(
                      imageCat: "example/images/category/lenovo.png",
                      text: "Lenovo",
                      onTap: () {},
                    ),
                    CategoriesCard(
                      imageCat: "example/images/category/realme.png",
                      text: "Realme",
                      onTap: () {},
                    ),
                    CategoriesCard(
                      imageCat: "example/images/category/tecno.png",
                      text: "Tecno",
                      onTap: () {},
                    ),
                    CategoriesCard(
                      imageCat: "example/images/category/vivo.jpg",
                      text: "Vivo",
                      onTap: () {},
                    ),
                    CategoriesCard(
                      imageCat: "example/images/category/nokia.png",
                      text: "Nokia",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )));
  }
}
