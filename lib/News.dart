import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'package:winee/AboutUs.dart';
import 'package:winee/ContactUs.dart';
class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}


class _NewsState extends State<News> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _launchPhone(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _launchMap() async {
    String location = 'sin el fil, horch tabet, pierre michaca building, ground floor';
    String url = 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeFull(location)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _launchEmail(String email) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }

  @override
  void initState() {
    super.initState();
    _scaffoldKey.currentState?.openDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF630831),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'lib/images/logo.png',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              if (_scaffoldKey.currentState != null) {
                _scaffoldKey.currentState!.openDrawer();
              } else {
                print('Scaffold key is null');
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF630831),
        child: ListView(
          children: [
            Image.asset('lib/images/logo.png',
              width:20,height:30,),
            ListTile(
              title: const Text('Home',style:TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('About us',style:TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
            ),
            ListTile(
              title: const Text('News',style:TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => News()),
                );
              },
            ),
            ListTile(
              title: const Text('Contact Us',style:TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
            ),
          ],
        ),
      ),
      body:  SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('LATEST NEWS',style: TextStyle(
              fontSize: 47,
              fontWeight: FontWeight.bold,
              fontFamily: 'MyFont',

            ),),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: Image.asset(
                      'lib/images/blog-1.png',
                      height: 200,
                      width: 500,
                      fit: BoxFit.cover,
                    ),

                  ),
                ),

                Positioned(
                  bottom: -10,
                  left: 20,
                  child: Row(
                    children: [
                      Icon(Icons.bookmark_border),
                      Text('Ranked', style: TextStyle(
                        color: Color.fromRGBO(0, 5, 49 , 0.5),
                        fontFamily: 'Montserrat, sans-serif',
                        height: 1.0,
                      ),),
                      SizedBox(width: 10),
                      Text('|'),
                      SizedBox(width: 10),
                      Icon(Icons.person_outline),
                      Text('karinekeuchkerian' , style: TextStyle(
                        color: Color.fromRGBO(0, 5, 49 , 0.5),
                        fontFamily: 'Montserrat, sans-serif',
                        height: 1.0,
                      ),),
                      Container(
                        width: 100,
                        height: 55,
                        decoration: BoxDecoration(

                          color:  Color(0xFF3B3561),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: '04\n', style: TextStyle(color: Colors.white, fontSize: 22)),
                                    TextSpan(text: 'NOV , 2022', style: TextStyle(color: Colors.white, fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ),
                      )

                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 50,),
            Text('Lebanon Vineyards Rank Among The Best In The World' ,
              style: TextStyle(  color: Colors.black,
                fontSize: 24.0,
                height: 1.5,
                letterSpacing: 0.0,
                fontStyle: FontStyle.normal,
                decoration: TextDecoration.none,
                decorationColor: null,
                decorationStyle: TextDecorationStyle.solid,
                fontFamily: 'Montserrat',

              ),),
            SizedBox(height: 20,),
            Text('5 Lebanese vineyards earned spots in the 2022’s World’s Best Vineyards.'
              , style: TextStyle(
                color: Color.fromRGBO(0, 5, 49 , 0.5),
                fontFamily: 'Montserrat, sans-serif',
                height: 1.0,
              ),),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {

              },
              child: Text(
                'READ MORE ->',
                style: TextStyle(
                  color:  Color(0xFF630831),

                ),
              ),
            ) ,
            SizedBox(height: 40,),
            Row(
              children: [
                Icon(Icons.access_time),
                Text('Recent Posts'),

              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:Color(0xFF630831),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Row(
                children: [
                  Image.asset('images/k.jpg'),
                  Column(
                    children: [
                      Text('This Is the Article Title'),
                      Text('Jun,15 2021'),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Row(
                children: [
                  Image.asset('images/k.jpg'),
                  Column(
                    children: [
                      Text('This Is the Article Title'),
                      Text('May,10 2021'),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Row(
                children: [
                  Image.asset('images/k.jpg'),
                  Column(
                    children: [
                      Text('This Is the Article Title'),
                      Text('Feb,28 2021'),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Row(
                children: [
                  Image.asset('images/k.jpg'),
                  Column(
                    children: [
                      Text('This Is the Article Title'),
                      Text('Jun,07 2021'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.favorite_border),
                Text('Follow Us On :'),

              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:Color(0xFF630831),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20,),
                Container(
                  width: 25,
                  height: 25,

                  decoration: BoxDecoration(
                    color:  Colors.red,
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.facebook, color: Colors.white),
                    label: Text(''),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),

                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.facebook , ), label:Text('')),
          ElevatedButton.icon(onPressed: (){}, icon:Image.asset(
            'lib/images/y.png',
            width: 24,
            height: 24,
          ), label:Text('') ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'lib/images/instagram.png',
                    width: 24,
                    height: 24,
                  ),
                  label: Text(''),),
                ElevatedButton.icon(onPressed: (){}, icon: Image.asset(
                  'lib/images/twitter.png',
                  width: 24,
                  height: 24,
                ), label:Text('')),
              ],
            ),

SizedBox(height: 40,),
            Container(
              color: Color(0xFF060922),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.asset(
                      'lib/images/logo.png',
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'lib/images/f.png',
                            width: 16,
                            height: 16,
                          ),
                          label: SizedBox.shrink(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(40, 40),
                            backgroundColor: Color(0xFF3B3561),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,

                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'lib/images/youtube.png',
                            width: 16,
                            height: 16,
                          ),
                          label: SizedBox.shrink(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(40, 40),
                            backgroundColor: Color(0xFF3B3561),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'lib/images/i.png',
                            width: 16,
                            height: 16,
                          ),
                          label: SizedBox.shrink(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(40, 40),
                            backgroundColor: Color(0xFF3B3561),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'lib/images/tw.png',
                            width: 16,
                            height: 16,
                          ),
                          label: SizedBox.shrink(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(40, 40),
                            backgroundColor: Color(0xFF3B3561),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text('Useful Links',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color:  Colors.white,
                    ),),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward ,  color:   Color(0xFF630831),),
                      Text('Home' , style: TextStyle(color: Colors.white),),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward, color: Color(0xFF630831),),
                      Text('News',
                        style: TextStyle(
                          color:  Colors.white,

                        ),),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Text('Resources',
                    style: TextStyle(
                      color:  Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward , color: Color(0xFF630831),),
                      Text('About Us',
                        style: TextStyle(
                          color:  Colors.white,

                        ),),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward , color: Color(0xFF630831)),
                      Text('Contact Us',
                        style: TextStyle(
                          fontSize: 14,
                          color:  Colors.white,

                        ),),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Text('Contact Information',
                    style: TextStyle(
                      color:  Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.mail_outline_outlined , color: Color(0xFF630831),),
                      GestureDetector(
                        onTap: () {
                          _launchEmail('info@100p100liban.org');
                        },
                        child: Text(
                          'info@100p100liban.org',
                          style: TextStyle(
                            color:  Colors.white,

                          ),
                        ),
                      ) ,

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.globe, color: Color(0xFF630831),),
                      GestureDetector(
                        onTap: () {
                          _launchWebsite('https://www.winetourismlebanon.org');
                        },
                        child: Text(
                          'www.winetourismlebanon.org',
                          style: TextStyle(
                            color:  Colors.white,

                          ),
                        ),
                      ) ,

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined , color: Color(0xFF630831),),
                      GestureDetector(
                        onTap: () {
                          _launchMap();
                        },
                        child: Text(
                          'sin el fil, horch tabet, pierre michaca building, ground floor',
                          style: TextStyle(
                            color:  Colors.white,

                          ),
                        ),
                      ) ,

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.phone_iphone_outlined , color: Color(0xFF630831),),
                      GestureDetector(
                        onTap: () {
                          _launchPhone('+9613528255');
                        },
                        child: Text(
                          '+961 3 52 82 55',
                          style: TextStyle(
                            color:  Colors.white,

                          ),
                        ),
                      ) ,

                    ],
                  ),
                  SizedBox(height: 30,),
                  Text('© 2022 Created by: Telepaty',
                    style: TextStyle(
                      color:  Colors.white,

                    ),),
                  SizedBox(height: 30,),
                  Text('Terms of Use | Privacy Policy',
                    style: TextStyle(
                      color:  Colors.white,

                    ),),




                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
