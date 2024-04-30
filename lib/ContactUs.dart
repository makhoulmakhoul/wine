import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'package:winee/AboutUs.dart';
import 'package:winee/News.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return Builder(
        builder: (context) => Scaffold(
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
        title: isMobile ? Text('About Us', style: TextStyle(color: Colors.white)) : null,
        actions: isMobile
            ? [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ]
            : [Padding(
          padding: EdgeInsets.only(right: 40),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
              child: Text(
                'About Us',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => News()),
                );
              },
              child: Text(
                'News',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
              child: Text(
                'Contact Us',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

        ],
      ),
      drawer: isMobile
          ? Drawer(
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
      )
          : null,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            isMobile
                ? Column(
              children: [
                Container(
                  child:  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      color: Color(0xFF060922),
                      width: 400,
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xFF630831),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchMap();
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Our Locations',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'sin el fil, horch tabet, pierre michaca building, ground floor',
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.phone_iphone_outlined,
                                  color: Color(0xFF630831),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchPhone('+9613528255');
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Phone Numbers',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '+961 3 52 82 55',
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Color(0xFF630831),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchEmail('info@100p100liban.org');
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Emails',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'info@100p100liban.org',
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.globe,
                                  color: Color(0xFF630831),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchWebsite('https://www.winetourismlebanon.org');
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Websites',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'https://www.winetourismlebanon.org',
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'KEEP IN TOUCH ',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'MyFont',
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'We Will Answer Your Questions As Soon As Possible',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 5, 49, 0.5),
                            fontFamily: 'Montserrat, sans-serif',
                            height: 1.0,
                            fontSize: 22
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFF630831),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      Text('Name'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text('E-mail'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Text('Subject'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Text('Your Message'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3B3561),
                        ),
                        child: Text('Send Your Message'),
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Row(
              children: [
                Expanded(
                  child:  Container(
                    child:  Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        color: Color(0xFF060922),
                        width: 400,
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Color(0xFF630831),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchMap();
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Our Locations',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'sin el fil, horch tabet, pierre michaca building, ground floor',
                                            style: TextStyle(
                                              color: Colors.white,
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.phone_iphone_outlined,
                                    color: Color(0xFF630831),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchPhone('+9613528255');
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Phone Numbers',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            '+961 3 52 82 55',
                                            style: TextStyle(
                                              color: Colors.white,
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.mail,
                                    color: Color(0xFF630831),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchEmail('info@100p100liban.org');
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Emails',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'info@100p100liban.org',
                                            style: TextStyle(
                                              color: Colors.white,
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.globe,
                                    color: Color(0xFF630831),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchWebsite('https://www.winetourismlebanon.org');
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Websites',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'https://www.winetourismlebanon.org',
                                            style: TextStyle(
                                              color: Colors.white,
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child:  Container(
                    child: Column(
                      children: [
                        Text(
                          'KEEP IN TOUCH ',
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'MyFont',
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'We Will Answer Your Questions As Soon As Possible',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 5, 49, 0.5),
                              fontFamily: 'Montserrat, sans-serif',
                              height: 1.0,
                              fontSize: 22
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFF630831),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Text('Name'),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text('E-mail'),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Text('Subject'),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Text('Your Message'),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3B3561),
                          ),
                          child: Text('Send Your Message'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

                SizedBox(height: 40),
              Container(
                color: Color(0xFF060922),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isMobile
                        ?Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 0,),
                          child: Column(
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

                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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

                            ],),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  Icon(Icons.location_on_outlined, color: Color(0xFF630831)),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchMap();
                                      },
                                      child: Text(
                                        'sin el fil, horch tabet, pierre michaca building, ground floor',
                                        style: TextStyle(
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
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

                            ],),
                        )
                      ],
                    )
                        :Row(
                      children: [
                        Expanded(child:Container(
                          padding: EdgeInsets.only(left: 0,),
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

                            ],
                          ),
                        ),),
                        Expanded(child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                            ],
                          ),
                        ),),
                        Expanded(child:   Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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

                            ],),
                        ),),
                        Expanded(child: Container(
                          padding: const EdgeInsets.all(16.0),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  Icon(Icons.location_on_outlined, color: Color(0xFF630831)),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchMap();
                                      },
                                      child: Text(
                                        'sin el fil, horch tabet, pierre michaca building, ground floor',
                                        style: TextStyle(
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
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

                            ],),
                        ))
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
        ),
    );
  }
}

