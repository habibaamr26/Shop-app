import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/sharedpref.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../login/login_screen.dart';
import 'models.dart';

class OnBording extends StatefulWidget {
  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  List<OnBordingModel> bording = [
    OnBordingModel(
        "https://student.valuxapps.com/storage/uploads/banners/1689108648Avc1g.banner-template-with-summer-sale_23-2148515754%20(1).png",
        "Screen 1",
        "Title of Screen 1 "),
    OnBordingModel(
        "https://student.valuxapps.com/storage/uploads/banners/1689108648Avc1g.banner-template-with-summer-sale_23-2148515754%20(1).png",
        "Screen 2",
        "Title of Screen 2 "),
    OnBordingModel(
        "https://student.valuxapps.com/storage/uploads/banners/1689108648Avc1g.banner-template-with-summer-sale_23-2148515754%20(1).png",
        "Screen 3",
        "Title of Screen 3 "),
  ];

  var bord = PageController();

  bool navigate=false;
  void isPressed()
  {
    cachHelper.setdata(key: "onbording", value: true).then((value){
      if(value)
        {
          print(value);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
            return login();
          }));
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            isPressed();
          }, child: const Text("Skip",style: TextStyle(color: Colors.deepOrange),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: bord,
                  itemCount: bording.length,
                  itemBuilder: (context, index) =>
                      onbord(bording: bording[index]),
                onPageChanged: (value){
                    if(value==bording.length-1)
                      {
                        setState(() {
                          navigate=true;
                        });

                      }
                    else
                      {
                        setState(() {
                          navigate=false;
                        });
                      }
                },
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: bord,
                  count: bording.length,
                  effect: const WormEffect(
                    dotColor: Colors.grey,
                    dotHeight: 12,
                    dotWidth: 12,
                    spacing: 5,
                    activeDotColor: Colors.deepOrange,
                    strokeWidth: 4,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(navigate) {
                      isPressed();
                    } else {
                      bord.nextPage(
                          duration: const Duration(microseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_outlined),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget onbord({
  required OnBordingModel bording,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),
        Expanded(
          child: Image(image: NetworkImage(bording.image)),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          bording.name,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          bording.titel,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 110,
        ),
      ],
    );
