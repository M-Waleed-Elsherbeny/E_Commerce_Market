import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/database/database_constants.dart';
import 'package:my_e_commerce_app/core/models/home_products_model.dart';
import 'package:my_e_commerce_app/core/widgets/custom_loading.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserComment extends StatelessWidget {
  const UserComment({super.key, required this.productsModel});
  final HomeProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client
          .from(COMMENTS_TABLE)
          .stream(primaryKey: ["id"])
          .eq("product_id", productsModel.productId!)
          .order("created_at"),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoading();
        } else if (!snapshot.hasData) {
          return Center(
            child: Text("No comments yet.", style: TextStyle(fontSize: 20.sp)),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: TextStyle(fontSize: 20.sp),
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final List<Map<String, dynamic>> data = snapshot.data!;
          return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?uid=R162128033&ga=GA1.1.971563098.1745924156&semt=ais_items_boosted&w=740", // Replace with user profile image
                  ),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index]["user_name"] ?? "Unknown User",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      data[index]["comment"] ?? "No comment",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    data[index]["replay"] == null
                        ? Container()
                        : Text.rich(
                          TextSpan(
                            text: "Replay: \n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                            children: [
                              TextSpan(
                                text: data[index]["replay"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                  ],
                ),
                trailing: Text(
                  // snapshot.data![index]["created_at"].toString().split(" ")[0],
                  "",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          );
        } else {
          return Center(
            child: Text(
              "Something went wrong.",
              style: TextStyle(fontSize: 20.sp),
            ),
          );
        }
      },
    );
  }
}
