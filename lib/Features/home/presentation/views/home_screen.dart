import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/Features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:my_gallery/Features/home/presentation/manger/cubit/home_cubit_state.dart';
import 'package:my_gallery/core/app_colors.dart';
import 'package:my_gallery/core/app_styles.dart';

import '../../../login/presentation/manger/cubit/login_cubit.dart';

class HomePage extends StatelessWidget {
  static const String id = 'Home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<LoginCubit>(context).userData!.user!.name);
    var userName = BlocProvider.of<LoginCubit>(context).userData!.user!.name;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/1gellary.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: EdgeInsets.only(
                top: 22.h,
                left: 25,
                right: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          "Welcome \n$userName",
                          style: AppStyles.homeScreenTitle,
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage: const CachedNetworkImageProvider(
                            "https://avatars.githubusercontent.com/u/101389444?v=4",
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(140.w, 40.h),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          BlocProvider.of<LoginCubit>(context).userData = null;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.red,
                                    Colors.redAccent,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/Vector.png",
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text("log out"),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: Size(140.w, 40.h)),
                        onPressed: () {
                          showDialog(
                              barrierColor: Colors.transparent,
                              context: context, builder: (BuildContext context){
                            return Stack(
                              children: [
                                ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: AlertDialog(
                                      backgroundColor: Colors.white.withOpacity(0.5),
                                      scrollable: true,
                                      content: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 50.h),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                //todo: open gallery
                                                ImagePicker().pickImage(source: ImageSource.gallery);
                                              },
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color(0xffEFD8F9),
                                                fixedSize: Size(180.w, 50.h),
                                              ),
                                              child:  Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    width: 40.w,
                                                    height: 40.h,
                                                    "assets/gallery.png",
                                                    fit:BoxFit.scaleDown,
                                                  ),

                                                  Text("Gallery",
                                                    style: AppStyles.loginTiltle.copyWith(
                                                      fontSize: 20.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: 10.h,
                                            ),




                                            TextButton(

                                              onPressed: () {
                                                //todo: open camera
                                                ImagePicker().pickImage(source: ImageSource.camera );
                                              },
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color(0xffEBF6FF),
                                                fixedSize: Size(180.w, 50.h),

                                              ),
                                              child:Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Transform.rotate(
                                                    angle: -0.1,
                                                    child: Image.asset(
                                                      width: 45.w,
                                                      height: 45.h,
                                                      "assets/3.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),

                                                  Text("Camera",
                                                  style: AppStyles.loginTiltle.copyWith(
                                                    fontSize: 20.sp,
                                                  ),),
                                                ],
                                              ),
                                            ),





                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 40.h,
                              width: 40.w,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xffFFEB38),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffFFEB38),
                                    Color(0xffFFA700),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Image.asset(
                                  "assets/Vector.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text("upload"),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  BlocBuilder<HomeCubit, HomeCubitState>(
                    builder: (context, state) {
                      switch(state.runtimeType){
                        case HomeCubitInitial:
                          BlocProvider.of<HomeCubit>(context).getImages(
                              BlocProvider.of<LoginCubit>(context).userData!.token!
                          );
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case HomeCubitLoading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case HomeCubitSuccess:
                          var cubit = BlocProvider.of<HomeCubit>(context);
                          var images=cubit.images;
                          return Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 17,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://wallpaperaccess.com/full/4723250.jpg"
                                        // "${images[index]}}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                          break;
                        default:
                          return const Center(
                            child: Text("Failed to load images"),
                          );
                          break;
                      }

                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}


class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // double width=20.r;
    // double height=150.r;
    var path = Path();
    // path.moveTo(0, 0);
    // path.lineTo(size.width-(width), 0);
    // path.quadraticBezierTo(size.width-110.r, 0, size.width-80.w, 80.h);
    // // path.quadraticBezierTo(size.width-300.w, 300.h, size.width, 140.h);
    // path.lineTo(0, size.height);
    // path.lineTo(0, size.height);
    // path.lineTo(0, 0);
    //
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
