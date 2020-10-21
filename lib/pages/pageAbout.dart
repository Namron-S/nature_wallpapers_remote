import 'package:flutter/material.dart';
import '../navigation/drawer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
          child: Html(
        data: htmlData,
        onLinkTap: (url) async {
          await launch(url);
        },
      )),
    );
  }
}

const htmlData = """
<h3>About</h3>
<p>
This app was written because the <a href="mailto:N.Sutatyo@gmail.com">programmer
</a> of this app 
was tired of all the in-app ads. So enjoy this adfree app. ;)
</p>

<h3>Credits</h3>
<p>
All wallpaper photos are provided by 
<a href="https://www.pexels.com">Pexels</a>.
</p>
<p>
The app launcher icon is provided by
<a href="https://de.vecteezy.com/gratis-vektor/tapete">Vecteezy</a>.
</p>

<h3>Acknowledgements</h3>
<p>
I have to thank my brother who has lent me his notebook for writing this app
and supported me in other ways.<br>
I also have to thank all my friends for providing me important feedback.

</p>
""";
