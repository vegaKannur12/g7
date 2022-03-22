import 'package:flutter/material.dart';

class MyGridScreen extends StatefulWidget {
  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {

  List<String> images = ["https://www.google.com/search?q=flower&rlz=1C1VDKB_enIN972IN972&sxsrf=APq-WBtl8ovGmsfof9QiOTwLkyJT3-akmw:1647498334325&tbm=isch&source=iu&ictx=1&vet=1&fir=kynP2p55eMS7TM%252CMqJ0o7Xjxwc15M%252C_%253BV0PEfdCjSWAL_M%252CTE6or1FVU4DnNM%252C_%253BiVQQ4BLVOiawRM%252C-JSzIkf42ZvU1M%252C_%253Bad_EARqn8HNGCM%252CKut2T3IeAU8u9M%252C_%253BGe0sPl2wtwPeYM%252C6ZeVwdp2vU8abM%252C_%253BGGrA_FqXnfse-M%252CZih9vqAzJOmeTM%252C_%253BsAeD2IMVh242pM%252C94jcBxR-2b3nTM%252C_%253BRfUQ_0SdSVxZyM%252CV4JMFD_QVN1xmM%252C_%253BoPe3TTSw39P92M%252CnVrbZ6x84_QItM%252C_%253BmvUM38UAQJASuM%252C6QnaOLvEQovLfM%252C_%253BQseDJqe5nTD6aM%252CJSCbzwoxh_syJM%252C_%253BqeZb3aoRn6vGgM%252CoJbP5y_-ek47wM%252C_%253Bq8XvrYfBOPD6WM%252CW50-Xx0zumPDkM%252C_%253BFq2ReKTzIsMA5M%252CLo6lwABxk0AZfM%252C_&usg=AI4_-kT9fISq-S4_tgNA4iqitYBx7boqNA&sa=X&ved=2ahUKEwik0PDHwcz2AhUhT2wGHcyaBGAQ9QF6BAgVEAE#imgrc=iVQQ4BLVOiawRM"
    // "https://www.pexels.com/photo/close-up-photo-of-glowing-blue-butterflies-326055/",
    // "https://www.pexels.com/photo/brown-hummingbird-selective-focus-photography-1133957/",
    // "https://www.pexels.com/photo/brown-hummingbird-selective-focus-photography-1133957/",
    // "https://www.pexels.com/photo/brown-hummingbird-selective-focus-photography-1133957/",
    // "https://www.pexels.com/photo/brown-hummingbird-selective-focus-photography-1133957/",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter GridView Demo"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.fromLTRB(0.0, 4.0, 4.0, 4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            shadowColor: Colors.white,
            color: Colors.white70,
            child: Stack(
              children: <Widget>[
              Center(
                child: Image(
                  image: NetworkImage(images[index]),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    child: Text(
                      "haiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii+ ${index}",
                      maxLines: 5,
                      textAlign: TextAlign.center,
                    )),
              ]),
            ]),
          );
        },
      )),
    );
  }
}
