import 'package:flutter/material.dart';
import 'package:sudaphone/view/comments.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';


class Post extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
    appBar: AppBar(

      title: const CustomText(
          text: "المنشورات",
          textAlign: TextAlign.center,
          fontSize: 25,
          fontWeight: FontWeight.normal),
          centerTitle: true,
    ),
    body: ListView(children: [
      Card(
          child: Column(children:[
        ListTile(
          leading: const CircleAvatar(backgroundImage: AssetImage("example/images/slider/ali.jpg"),),
          title: TextFormField(
            maxLength: 300,
            maxLines: 10,
            minLines: 1,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: "اضف جوال للبيع",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () {},

          ///=> pickercamera(),
        ),
        Row(children: [
          Expanded(
              child: InkWell(
            onTap: () {},
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Colors.grey.withOpacity(0.2)))),
                padding: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "اضف منشور",
                        color: Colors.grey.shade800,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    const  Padding(padding: EdgeInsets.only(right: 10)),
                      Icon(Icons.add, 
                      color: Colors.grey.shade800),
                    ])),
          )),
        ]),
      ])),
      Card(
        child: Column(children: [
          ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CustomText(
                  text: "علي عبدالله",
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.right,
                ),
              ),
              trailing: IconButton(
                  icon: const Icon(Icons.more_horiz), onPressed: () {}),
              isThreeLine: true,
              subtitle: Column(children:[
                CustomText(
                  text:
                      "السلام عليكم شباب ،، لدي Huawei Mate 40 Pro إستعمال يومين فقط ، نضيف ومع كامل الملحقات البيع لأعلي سعر",
                  color: Colors.grey.shade800,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                ),
                Image.asset("example/images/product/huawei.jpg"),
              ])),
          Divider(color: Colors.grey.withOpacity(0.2)),
          Row(children: [
            Expanded(
              child: InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.grey))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        CustomText(
                          text: "0",
                          color: Colors.grey.shade800,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.favorite_border_outlined
                        , color: Colors.pink.shade600),
                      ]),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              child: InkWell(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "0",
                        color: Colors.grey.shade800,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.insert_comment_outlined
                      , color: Colors.green),
                    ]),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Comments();
                  }));
                },
              ),
            ),
          ]),
         const Padding(padding: EdgeInsets.only(top: 5)),
        ]),
      ),
      //for (int i = 0; i < posts.length; i++)
      //PostList(name: posts[i]['name'], contentpost: posts[i]['content']),
      //---------------
      // FutureBuilder(
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //           shrinkWrap: true,
      //           physics: NeverScrollableScrollPhysics(),
      //           itemCount: snapshot.data.lenght,
      //           itemBuilder: (BuildContext context, int i) {
      //             return PostList(
      //                 name: snapshot.data[i]['name'],
      //                 contentpost: snapshot.data[i]['content']);
      //           });
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),
      //------------------
    ]),
      ),
    );
  }
}



// class PostList extends StatelessWidget {
//   final name;
//   final contentpost;
//   PostList({this.name, this.contentpost});
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(children: <Widget>[
//         ListTile(
//           leading: CircleAvatar(child: Icon(Icons.person)),
//           title: Container(
//               margin: EdgeInsets.only(top: 10),
//               child: Text(name,
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black))),
//           trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
//           isThreeLine: true,
//           subtitle: Text(contentpost),
//         ),
//         Divider(color: Colors.grey.withOpacity(0.2)),
//         Row(children: <Widget>[
//           Expanded(
//             child: InkWell(
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border(left: BorderSide(color: Colors.grey))),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         "إعجاب",
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(width: 4),
//                       Icon(Icons.thumb_up, color: Colors.blue),
//                     ]),
//               ),
//               onTap: () {},
//             ),
//           ),
//           Expanded(
//             child: InkWell(
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       "تعليق",
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(width: 4),
//                     Icon(Icons.comment, color: Colors.purple),
//                   ]),
//               onTap: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) {
//                   return Comments();
//                 }));
//               },
//             ),
//           ),
//         ]),
//         Padding(padding: EdgeInsets.only(top: 5)),
//       ]),
//     );
//   }
// }
