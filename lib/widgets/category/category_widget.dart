import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:marketdo_app/models/category_model.dart';
import 'package:marketdo_app/screens/main_screen.dart';
import 'package:marketdo_app/widgets/home_productList.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Products For You',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 20)),
                    TextButton(
                        onPressed: () {},
                        child: const Text('View all..',
                            style: TextStyle(fontSize: 12)))
                  ])),
          Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: SizedBox(
                  height: 40,
                  child: Row(children: [
                    Expanded(
                        child: FirestoreListView<Category>(
                            scrollDirection: Axis.horizontal,
                            query: categoryCollection,
                            itemBuilder: (context, snapshot) {
                              Category category = snapshot.data();
                              return Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: ActionChip(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      backgroundColor:
                                          _selectedCategory == category.catName
                                              ? Colors.green.shade400
                                              : Colors.grey,
                                      label: Text(category.catName!,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: _selectedCategory ==
                                                      category.catName
                                                  ? Colors.white
                                                  : Colors.black)),
                                      onPressed: () => setState(() =>
                                          _selectedCategory =
                                              category.catName)));
                            })),
                    IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const MainScreen(index: 1))),
                        icon: const Icon(IconlyLight.arrowDown))
                  ]))),
          HomeProductList(category: _selectedCategory)
        ]));
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:flutterfire_ui/firestore.dart';
// import 'package:marketdo_app/screens/main_screen.dart';
// import 'package:marketdo_app/widgets/home_productList.dart';

// import '../../models/category_model.dart';

// class CategoryWidget extends StatefulWidget {
//   const CategoryWidget({Key? key}) : super(key: key);

//   @override
//   State<CategoryWidget> createState() => _CategoryWidgetState();
// }

// class _CategoryWidgetState extends State<CategoryWidget> {

//    String? _selectedCategory;

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       color: Colors.white,
//       child: Column(
//         children: [
//           const SizedBox(height: 18,),
//            Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Products For You',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1,
//                     fontSize: 20,
//                   ),
//                 ),
//                 TextButton(
//                   child: const Text('View All', style: TextStyle(fontSize: 12),),
//                   onPressed: (){

//                   }, )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8,0,8,8),
//             child: SizedBox(
//               height: 40,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child:
//                     FirestoreListView<Category>(
//                       scrollDirection: Axis.horizontal,
//                       query: categoryCollection.orderBy('title'),
//                       itemBuilder: (context, snapshot) {
//                         Category category = snapshot.data();
//                         return Padding(
//                             padding: const EdgeInsets.only(right: 4),
//                         child: ActionChip(
//                         padding: EdgeInsets.zero,
//                         shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(2)
//                         ),
//                         backgroundColor: _selectedCategory == category.catName ? Colors.blue.shade900 : Colors.grey,
//                         label: Text(category.catName!, style: TextStyle(
//                         fontSize: 12,
//                         color: _selectedCategory == category.catName ? Colors.white : Colors.black
//                         ),),
//                         onPressed: (){
//                           print(category.catName);
//                         setState(() {
//                           _selectedCategory = category.catName;
//                         });
//                         },
//                         ),
//                         );
//                       },
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border(left: BorderSide(color: Colors.grey.shade500))
//                     ),
//                     child: IconButton(onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const MainScreen(
//                         index: 1,
//                       ),
//                       ),);
//                       //show all the categories list
//                     },
//                         icon: const Icon(IconlyLight.arrowDown),
//                     ),
//                   ),

//                 ],
//               ),
//             ),
//           ),
//           //PRODUCT LIST
//           HomeProductList(
//             category: _selectedCategory,
//           )
//         ],
//       ),
//     );
//   }
// }
