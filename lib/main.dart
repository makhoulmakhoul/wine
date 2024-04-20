import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:winee/AboutUs.dart';
import 'package:winee/News.dart';
import 'package:winee/ContactUs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF630831),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late VideoPlayerController _controller;
  late ScrollController _scrollController;
  bool isHovered = false;
  void _launchPhone(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void playVideo() async {
    const url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
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
    _controller = VideoPlayerController.asset('lib/videos/partners-vd.mp4');

    _scrollController = ScrollController();

    _controller.initialize().then((_) {
      setState(() {});
    });

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.value.isInitialized) {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward &&
          !_controller.value.isPlaying) {
        _controller.play();
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse &&
          _controller.value.isPlaying) {
        _controller.pause();
      }
    }
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
              _scaffoldKey.currentState!.openDrawer();
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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Image.asset(
                    'lib/images/hero-mob.jpg',
                    width: double.infinity,
                    height: 7925,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 16,
                    top: 16,
                    child: Text(
                      'LEBANON THROUGH ITS WINE',
                      style: TextStyle(

                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MyFont',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text('the project', style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'MyFont',
            ),),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                'Under the patronage of the Lebanese Ministry of Tourism, '
                    '100%Liban launched an initiative by the name of WINE TOURISM '
                    'LEBANON to elevate the country’s wine'
                    ' tourism to new heights and establish a new separate category'
                    ' to an already versatile touristic sector.',
                style: TextStyle(
                  color: Color.fromRGBO(0, 5, 49 , 0.5),
                  fontFamily: 'Montserrat, sans-serif',
                  height: 1.0,

                ),
              ),
            ),

            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3B3561),
              ),
              child: Text('Learn More'),
            ),
            SizedBox(height: 20,),
            Text('The purpose of the project is to :'),
            ListTile(
              leading: Icon(Icons.double_arrow),
              title: Text('Raise awareness both locally and aboard '
                  'on the Lebanese wine sector'),
            ),
            ListTile(
              leading: Icon(Icons.double_arrow),
              title: Text('Establish various mediums to inform potential '
                  'visitors the possibilities of their visit'),
            ),
            ListTile(
              leading: Icon(Icons.double_arrow),
              title: Text(
                  'Introduce a platform that allows national and foreign '
                      'residents to conveniently interact with the sector'),
            ),
            SizedBox(height: 20,),
            Image.asset('lib/images/roadmap.png'),
            SizedBox(height: 20,),
            Stack(
              children: [
                SizedBox(
                  width: 500,
                  height: 350,
                  child: Image.asset(
                    'lib/images/1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 250,
                    height: 180,
                    color: Color(0xFF630831),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '6000+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Years Of History',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ),

                Positioned(
                  bottom: -5,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Icon(
                      color: Color(0xFF3B3561),
                      Icons.play_circle_filled,
                      size: 70,
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 20,),

            SizedBox(height: 20,),
            Text(
              '-HISTORIC SIGNIFICANCE-',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                letterSpacing: 1,
                color: Color(0xFF3B3561),
                fontFamily: 'sans-serif',
              ),
            ),
            SizedBox(height: 20,),
            Text('A HERITAGE THAT GOES BACK MILLENNIUMS ' ,
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'MyFont',
            ),),
            SizedBox(height: 20,),
 Padding(padding: EdgeInsets.only(left: 20),
 child: Container(
   padding: EdgeInsets.only(left: 30),
   decoration: BoxDecoration(
     border: Border(
       left: BorderSide(
         color: Color(0xFF630831),
         width: 2,
       ),
     ),
   ),
   child: Text(
     'The origin of Lebanese wine and its journey up until present'
         ' day is as complex as it is rich. The remnants'
         ' of this incredible history can still be seen and experienced today throughout the country.',
     style: TextStyle(
       color: Color.fromRGBO(0, 5, 49 , 0.5),
       fontFamily: 'Montserrat, sans-serif',
       height: 1.7,
     ),
   ),
 ),
     ),

            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(0xFF630831),
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Citations In Ancient Religious Texts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                            fontFamily: 'Montserrat',
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Both the book of Hosea and that of Ezekiel reference the scent of Lebanese wine in the highest regard.',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 5, 49, 0.5),
                      fontFamily: 'Montserrat, sans-serif',
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(0xFF630831),
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Archeological Discoveries And Vestiges',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                            fontFamily: 'Montserrat',
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Various discoveries have been made throughout Lebanon that further cement the country having historic importance in the production of wine.',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 5, 49, 0.5),
                      fontFamily: 'Montserrat, sans-serif',
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(0xFF630831),
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Phoenicians Involvement',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                            fontFamily: 'Montserrat',
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'The ancient thalassocratic civilization that primarily resided in Lebanon was responsible for popularizing wine throughout ancient Mediterranean.',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 5, 49, 0.5),
                      fontFamily: 'Montserrat, sans-serif',
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(0xFF630831),
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '18th And 19th Century Significance',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                            fontFamily: 'Montserrat',
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Esteemed authors such as Alphonse de Lamartine, Baron IJS Taylor, and many more from the 18th and 19th century continuously attest to the production of high-quality wines being produced. Wine estates were found widespread in Bekaa, Kesrouan, and all the way up to Ehden.',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 5, 49, 0.5),
                      fontFamily: 'Montserrat, sans-serif',
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(0xFF630831),
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Wine Production During The Ottoman Empire',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontStyle:   FontStyle.normal,
                            decoration: TextDecoration.none,
                            fontFamily: 'Montserrat',
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'The production of wine slowed down but the know-how was maintained by convents who are authorized to produce wine for the Christian liturgy.',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 5, 49, 0.5),
                      fontFamily: 'Montserrat, sans-serif',
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),



            SizedBox(height: 30,),
            Text('- AND MORE-' , style: TextStyle(
              color: Color.fromRGBO(0, 5, 49 , 0.5),
              fontFamily: 'Montserrat, sans-serif',
              height: 1.0,
              fontSize: 26,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              letterSpacing: 1,
            ),),
            Text('A Sector That Goes Beyond Wine', style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'MyFont',
            ),),
          Padding(padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color:  Color(0xFF630831),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF630831),
                    width: 2.0,
                  ),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/images/dish.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Exquisite Culinary Experience',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Don’t taste just wine, many estates offer a unique and savoring cuisine found nowhere else.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF630831),
                    width: 2.0,
                  ),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/images/lodging-red.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lodging And Hospitality',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Stay at atmospheric places that harbor the essence of Lebanon’s history',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF630831),
                    width: 2.0,
                  ),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/images/landscape-red.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Scenic Landscapes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Discover the beautiful views seen from within and nearby the estates.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xFF630831),
                    width: 2.0,
                  ),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/images/wineglass-red.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Unparalleled Wine Quality',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Indulge yourself in a unique tasting experience and be sure to try out the wines produced from indigenous grapes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          )

          ),


          Stack(
              children: [
                Column(
                  children: [
                    VisibilityDetector(
                    
                      key: Key('video-player-key'),
                      onVisibilityChanged: (visibilityInfo) {
                        var visiblePercentage = visibilityInfo.visibleFraction * 100;
                        if (visiblePercentage == 100) {
                          if (_controller.value.isPlaying) {
                            _controller.play();
                          } else {
                            _controller.initialize().then((_) {
                              setState(() {});
                              _controller.play();
                            });
                          }
                        } else {
                          _controller.pause();
                        }
                      },
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 100 / 150,
                          child: VideoPlayer(_controller),
                        ),
                    ),
                    ),
                  ],
                ),
                Positioned(
                  top: 1,
                  left: 60,
                  child: Image.asset(
                    'lib/images/MEA.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 50,
                  child: Image.asset(
                    'lib/images/LBC.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 50,
                  child: Image.asset(
                    'lib/images/ici.png',
                    width: 100,
                    height: 100 ),
                ),


              ],
            ),
            SizedBox(height: 32,),
            Text('-NEWS-' , style: TextStyle(
              color: Color.fromRGBO(0, 5, 49 , 0.5),
              fontFamily: 'Montserrat, sans-serif',
              height: 1.0,
              fontSize: 26,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              letterSpacing: 1,

            ),),
            SizedBox(height: 20,),
            Text('LATEST NEWS', style: TextStyle(

              fontSize: 65,
              fontWeight: FontWeight.w800,
              fontFamily: 'MyFont',
            ),),
            SizedBox(height: 20,),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => News()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3B3561)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('See All Posts'),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),



            SizedBox(height: 20,),
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
            Container(
              color: Color(0xFF060922),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'lib/images/logo.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                 SizedBox(height: 30,),
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
                            'lib/images/y.png',
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
                  )
                  ,
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
                      Icon(Icons.arrow_forward,  color: Color(0xFF630831),),
                      Text('Home',
                        style: TextStyle(
                          color:  Colors.white,

                        ),),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward ,  color: Color(0xFF630831),),
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
                      Icon(Icons.arrow_forward ,  color: Color(0xFF630831),),
                      Text('About Us',
                        style: TextStyle(
                          color:  Colors.white,
                          decoration: TextDecoration.underline,
                        ),),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward , color: Color(0xFF630831),),
                      Text('Contact Us',
                        style: TextStyle(
                          fontSize: 14,
                          color:  Colors.white,
                          decoration: TextDecoration.underline,
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
                      Icon(Icons.mail ,  color: Color(0xFF630831),),
                      GestureDetector(
                        onTap: () {
                          _launchEmail('info@100p100liban.org');
                        },
                        child: Text(
                          'info@100p100liban.org',
                          style: TextStyle(
                            color:  Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ) ,

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.globe ,  color: Color(0xFF630831),),
                      GestureDetector(
                        onTap: () {
                          _launchWebsite('https://www.winetourismlebanon.org');
                        },
                        child: Text(
                          'www.winetourismlebanon.org',
                          style: TextStyle(
                            color:  Colors.white,
                            decoration: TextDecoration.underline,
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
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ) ,

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.phone_iphone_outlined ,  color: Color(0xFF630831),),
                      GestureDetector(
                        onTap: () {
                          _launchPhone('+9613528255');
                        },
                        child: Text(
                          '+961 3 52 82 55',
                          style: TextStyle(
                            color:  Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ) ,

                    ],
                  ),
                  SizedBox(height: 30,),
                  Text('© 2022 Created by: Telepaty',
                    style: TextStyle(
                      color:  Colors.white,
                      decoration: TextDecoration.underline,
                    ),),
                  SizedBox(height: 30,),
                  Text('Terms of Use | Privacy Policy',
                    style: TextStyle(
                      color:  Colors.white,
                      decoration: TextDecoration.underline,
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

