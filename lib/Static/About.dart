import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Translations.of(context).about_app,
          style: TextStyle(
            fontSize: EventSizedConstants.TextappBarSize,
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 8.0,
                color: Color.fromARGB(125, 0, 0, 255),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "طب الخليج الدائم",
                style: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Container(
                height: 100.0,
                width: 100.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    placeholder: 'assets/logo.png',
                    image:
                        'https://healthitsecurity.com/images/site/article_headers/_normal/2017-11-08large-data-brea3ch.jpg',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "في تكافل الصحي، نحن نفهم أن كل شخص فريد من نوعه، وكذلك صحتهم، نرى كل شخص يحدد نمط حياة صحي على طريقته. و هدفنا هو أن نكون جزءا في هذه العملية، ومساعدتهم على تحقيق أفضل أسلوب للحياة في جو صحي. تكافل العربية واحدة من أكبر شركات الخدمات والرعاية الطبية في السوق السعودي، كما تتضمن أكثر من 3000 مركز طبي مقدم للخدمة كما أنها أيضاً في زيادة مستمرة دون أي شبكة طبية أخرى تتميز شبكة تكافل العربية الطبية بأنها تلائم اختياراتك من المراكز التى عادة ما يتعامل معها كل فرد مثل الصيدليات – المستشفيات – المستوصفات -العيادات بأنواعها – مراكز الفحص الطبي- مراكز علاج العيون – مراكز العلاج الطبيعى – معامل التحاليل و مراكز الأشعة – مراكز الاستجمام SPA – مراكز اللياقة البدنية GYM – مراكز التجميل و محلات بيع النظارات الشمسية و الطبية وغيرها الكثير",
                style: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
