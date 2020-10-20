import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
  Future<void> _launchURL({String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Ocorreu um erro interno";
    }
  }*/

  void _openUrl(String url) async {
    // flutter web
    if (kIsWeb) {
      html.document.window.location.href = url;
    }
    // unknown platform
    else {
      throw new Exception('Unsupported platform');
    }
  }

  @override
  Widget build(BuildContext context) {
    double all = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff24292E),
      //MINHA APP BAR
      appBar: AppBar(
        backgroundColor: Color(0xff24292E),
        title: MediaQuery.of(context).size.width <= 880.0
            ? Text(
                "+ 244 923 835 837 📴 | matiasdev30@gmail.com 👨‍💻 ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              )
            : Text(
                "Matias Fernando",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
        centerTitle: MediaQuery.of(context).size.width <= 880.0 ? true : false,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: MediaQuery.of(context).size.width <= 880.0
                    ? null
                    : Text(
                        "+ 244 923 835 837 📴 | matiasdev30@gmail.com 👨‍💻 ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
              ),
            ],
          )
        ],
      ),
      //CORPO DO APP
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  //CABEÇALHO DA IMAGEN DE CAPA
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/fundo.PNG"),
                            fit: BoxFit.fill)),
                  ),
                  //FUNDO
                  Container(
                    height: MediaQuery.of(context).size.height - 258,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff24292E),
                  ),
                ],
              ),
              //A COLUNA QUE ESTA A SOBRE POR
              Positioned(
                left: MediaQuery.of(context).size.width / 2 -
                    (MediaQuery.of(context).size.width <= 880.0 ? 325 : 500),
                top: 60,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width <= 880.0
                              ? 650
                              : 1000,
                          height: MediaQuery.of(context).size.height * .85,
                          child: MediaQuery.of(context).size.width <= 880.0
                              ? ListView(
                                  children: [
                                    _perfil(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    _cardSobre(),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                )
                              : ListView(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            //SECÇÂO DO PERFIL
                                            _perfil()
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 160,
                                            ),
                                            _cardSobre(),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _cardNetWorks(String img) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
      ),
    );
  }

  _columTech(String title) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 170,
                  height: 140,
                  child: Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    direction: Axis.vertical,
                    children: [
                      _cardNetWorks(
                          "https://pbs.twimg.com/profile_images/1111678689228582913/t2k7QK3r.png"),
                      _cardNetWorks(
                          "https://pbs.twimg.com/profile_images/1111678689228582913/t2k7QK3r.png"),
                      _cardNetWorks(
                          "https://pbs.twimg.com/profile_images/1111678689228582913/t2k7QK3r.png"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
        Container(
            child: title.contains("interesse")
                ? null
                : Container(width: 2, height: 165, color: Colors.grey)),
      ],
    );
  }

  _btnNetWorks(String title, String img) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 30,
      width: 93,
      decoration: BoxDecoration(
          color: Color(0xff2A2D30), borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Container(
            width: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(image: NetworkImage(img)),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Text(title,
              style: TextStyle(
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  _perfil() {
    return Column(
      children: [
        Container(
          width: 300,
          height: 460,
          decoration: BoxDecoration(
              color: Color(0xff3F4448), borderRadius: BorderRadius.circular(4)),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 90,
                child: CircleAvatar(
                  radius: 85,
                  backgroundColor: Color(0xff3F4448),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/pw/ACtC-3eXRV2pnh117PWGlsGD7WGx-9ov8XlKDqWbA1aEbOizY44jVD8pMHOGQzTjpr8TZo1_9EAe_X10N0Qsy5RU5lv8XYj98ICLlpuLvorpqT7Mc7IwBh2HPukQxJjATXAh21bsdhuFFaz79yZmYv_jHWD1=w1040-h693-no?authuser=0"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Matias António Victorina Fernando",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                "<Hashirama 🚀/>",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Center(
                      child: Text(
                    "Viana, Luanda, Angola",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _cardNetWorks(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7ukRIXCtj36a15kG2236I0YeykItB6eEDHA&usqp=CAU"),
                  SizedBox(
                    width: 5,
                  ),
                  _cardNetWorks(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRekFE5Rdfuvtf_nEvcBlRlwvAn_6wlUb9HnQ&usqp=CAU"),
                  SizedBox(
                    width: 5,
                  ),
                  _cardNetWorks(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTtsa0i-AYJkHqa2pR2kUXhhR0jsuyT48KHJg&usqp=CAU"),
                  SizedBox(
                    width: 5,
                  ),
                  _cardNetWorks(
                      "https://www.generalcatalyst.com/wp-content/uploads/2017/10/logo-anaconda-372x372-1.png"),
                ],
              ),
              Spacer(),
              Divider(
                color: Color(0xff24292E),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                  child: Text(
                "Estudante de Eng. informática no ISPTEC",
                style: TextStyle(color: Colors.grey, fontSize: 13),
                textAlign: TextAlign.center,
              )),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //SECÇÂO DA EMPRESA ONDE JÀ TRABALHEI
        Container(
          width: 300,
          height: 170,
          decoration: BoxDecoration(
              color: Color(0xff3F4448), borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Experiência profissional",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xff3F4448),
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              "https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/36484322_216569868964721_52223168777027584_n.png?_nc_cat=110&_nc_sid=09cbfe&_nc_eui2=AeEmj37QblkMrQkItgCAAOCnZs_92laGDNNmz_3aVoYM01QHfpm0XgD7noCxJyHf2r-gCvif-5HJsaW-4udTjtmh&_nc_ohc=_CB0A4GTONUAX-4nFP8&_nc_ht=scontent-cdt1-1.xx&oh=410d5d2f91b2f7b8aa601db38537ac47&oe=5FB606F7"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xff3F4448),
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              "https://res.cloudinary.com/devex/image/fetch/c_fit,h_80,w_200/https://neo-assets.s3.amazonaws.com/assets/0137/3789/cc.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xff3F4448),
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              "https://dkgwwf1nj5fvj.cloudfront.net/providers/28/logos/medium.jpg?1455731775"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xff3F4448),
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              "https://4.bp.blogspot.com/-T15Xqa5kkUE/XC5xPuxRYeI/AAAAAAAAAUU/JqTBKTssONYJSd27JXk2L0T9bFwPaYAXQCLcBGAs/s1600/49576582_837553383248644_7668251291931377664_n.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Digital Factory, Consistech, ISUTIC, AROTECH",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _cardSobre() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width <= 880.0 ? 300 : 650,
          height: MediaQuery.of(context).size.width <= 880.0 ? 550 : 320,
          decoration: BoxDecoration(
              color: Color(0xff3F4448), borderRadius: BorderRadius.circular(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sobre mim",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Olá sou o Matias, tenho 20 anos, sou estudante, sou um programador automotivado com 3 anos de experiência em serviços de desenvolvimento, sou interessado em tudo que passa corrente eletrica.\nPersonalidade agradavél combinada com habilidades em Algoritimo, Design, e adaptação, e extrovetido ao comprimentar e comunicar-se com outras pessoas para manter atmosfera positiva.\nMe dedico todos os dias aprendendo cada vez mais,  hoje tenho como principais tecnologias Flutter, Dart, Python.\nMais sempre estou aberto para novas tecnologias e apredizado.",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.left,
              ),
              Spacer(),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  GestureDetector(
                    child: _btnNetWorks("GitHub",
                        "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"),
                    onTap: () {
                      _openUrl("https://github.com/matiasdev30");
                    },
                  ),
                   GestureDetector(
                    child: _btnNetWorks("LinkedIn",
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Linkedin.svg/200px-Linkedin.svg.png"),
                    onTap: () {
                      _openUrl("https://www.linkedin.com/in/matias-fernandes-hashirama-b92523197/");
                    },
                  ),
                   GestureDetector(
                    child: _btnNetWorks("Facebook",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTw1S5ghj42hU8O1F-Zu0VmjBNDcYTCVzRXrw&usqp=CAU"),
                    onTap: () {
                      _openUrl("www.google.com");
                    },
                  ),
                   GestureDetector(
                    child:  _btnNetWorks("Baixa CV",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSHpNElDWZnoa5RAbmV-RRH9EeskTIjYB-pTA&usqp=CAU"),
                    onTap: () {
                      _openUrl("https://docs.google.com/document/d/1RdRPAhq9xC8NyzkRzTt85hAOSxrNvVDfupPVNBUBwWU/edit?usp=sharing");
                    },
                  ),
                  
                 
                 
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //SECÇÂO DA EMPRESA ONDE JÀ TRABALHEI
        Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width <= 880.0 ? 300 : 650,
          height: MediaQuery.of(context).size.width <= 860.0 ? 680 : 320,
          decoration: BoxDecoration(
              color: Color(0xff3F4448), borderRadius: BorderRadius.circular(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tecnologias",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: MediaQuery.of(context).size.width <= 880.0
                    ? Column(
                        children: [
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: [
                              //Tenho experiência
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Tenho experiência",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 250,
                                            height: 190,
                                            child: Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              direction: Axis.vertical,
                                              children: [
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7ukRIXCtj36a15kG2236I0YeykItB6eEDHA&usqp=CAU"),
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRekFE5Rdfuvtf_nEvcBlRlwvAn_6wlUb9HnQ&usqp=CAU"),
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTtsa0i-AYJkHqa2pR2kUXhhR0jsuyT48KHJg&usqp=CAU"),
                                                _cardNetWorks(
                                                    "https://miro.medium.com/max/320/0*_rAD9NgK7l6KSlNc.png"),
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS-CuexdHmhDIpbjw0bymjJ7gi-nesqwRb5AQ&usqp=CAU"),
                                                _cardNetWorks(
                                                    "https://www.fil.univ-lille1.fr/~decomite/ue/ResumesStages/2014/resumes/nieuwlandt/images/primefaces.png"),
                                                _cardNetWorks(
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Adobe_XD_CC_icon.svg/1051px-Adobe_XD_CC_icon.svg.png"),
                                                _cardNetWorks(
                                                    "https://i2.wp.com/gluonhq.com/wp-content/uploads/2015/02/SceneBuilderLogo.png?fit=781%2C781&ssl=1"),
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSWChivhyQP0qy2_TlXi55RQ3Zs9rL4LlfLhQ&usqp=CAU"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              //Tenho estudado
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Tenho estudado",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 140,
                                            child: Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              direction: Axis.vertical,
                                              children: [
                                                _cardNetWorks(
                                                    "https://camo.githubusercontent.com/dd79809ee087a01b357a9ab7d5cee76f4b0ffaf1/68747470733a2f2f63646e2e69636f6e73636f75742e636f6d2f69636f6e2f667265652f706e672d3531322f632d70726f6772616d6d696e672d3536393536342e706e67"),
                                                _cardNetWorks(
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Vue.js_Logo_2.svg/1184px-Vue.js_Logo_2.svg.png"),
                                                _cardNetWorks(
                                                    "https://i.pinimg.com/originals/4e/7b/62/4e7b62b98915dbd4565098269ddc43cd.png"),
                                                _cardNetWorks(
                                                    "https://avatars2.githubusercontent.com/u/365630?v=2&s=400"),
                                                _cardNetWorks(
                                                    "https://dcassetcdn.com/design_img/2779177/591638/591638_15209895_2779177_eb4b7a2a_thumbnail.png"),
                                                _cardNetWorks(
                                                    "https://florencefennel.co.in/image/cache/catalog/florencefennel/Machine--Learning-1000x1000.jpg"),
                                                _cardNetWorks(
                                                    "https://www.teckrr.com/wp-content/uploads/2019/08/Data-Science-Using-Python.jpg"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              //Tenho interesse
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Tenho interesse",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 140,
                                            child: Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              direction: Axis.vertical,
                                              children: [
                                                _cardNetWorks(
                                                    "https://w7.pngwing.com/pngs/876/141/png-transparent-mathematics-mathematical-notation-symbol-number-computer-icons-mathematics-text-orange-logo.png"),
                                                _cardNetWorks(
                                                    "https://www.teckrr.com/wp-content/uploads/2019/08/Data-Science-Using-Python.jpg"),
                                                _cardNetWorks(
                                                    "https://florencefennel.co.in/image/cache/catalog/florencefennel/Machine--Learning-1000x1000.jpg"),
                                                _cardNetWorks(
                                                    "https://thumbs.dreamstime.com/z/logotipo-rob%C3%B3tica-49588070.jpg"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: [
                              //Tenho experiência
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Tenho experiência",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 190,
                                            height: 190,
                                            child: Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              direction: Axis.vertical,
                                              children: [
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7ukRIXCtj36a15kG2236I0YeykItB6eEDHA&usqp=CAU"),
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRekFE5Rdfuvtf_nEvcBlRlwvAn_6wlUb9HnQ&usqp=CAU"),
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTtsa0i-AYJkHqa2pR2kUXhhR0jsuyT48KHJg&usqp=CAU"),
                                                _cardNetWorks(
                                                    "https://miro.medium.com/max/320/0*_rAD9NgK7l6KSlNc.png"),
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS-CuexdHmhDIpbjw0bymjJ7gi-nesqwRb5AQ&usqp=CAU"),
                                                _cardNetWorks(
                                                    "https://www.fil.univ-lille1.fr/~decomite/ue/ResumesStages/2014/resumes/nieuwlandt/images/primefaces.png"),
                                                _cardNetWorks(
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Adobe_XD_CC_icon.svg/1051px-Adobe_XD_CC_icon.svg.png"),
                                                _cardNetWorks(
                                                    "https://i2.wp.com/gluonhq.com/wp-content/uploads/2015/02/SceneBuilderLogo.png?fit=781%2C781&ssl=1"),
                                                _cardNetWorks(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSWChivhyQP0qy2_TlXi55RQ3Zs9rL4LlfLhQ&usqp=CAU"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              //Tenho estudado
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Tenho estudado",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 190,
                                            child: Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              direction: Axis.vertical,
                                              children: [
                                                _cardNetWorks(
                                                    "https://camo.githubusercontent.com/dd79809ee087a01b357a9ab7d5cee76f4b0ffaf1/68747470733a2f2f63646e2e69636f6e73636f75742e636f6d2f69636f6e2f667265652f706e672d3531322f632d70726f6772616d6d696e672d3536393536342e706e67"),
                                                _cardNetWorks(
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Vue.js_Logo_2.svg/1184px-Vue.js_Logo_2.svg.png"),
                                                _cardNetWorks(
                                                    "https://i.pinimg.com/originals/4e/7b/62/4e7b62b98915dbd4565098269ddc43cd.png"),
                                                _cardNetWorks(
                                                    "https://avatars2.githubusercontent.com/u/365630?v=2&s=400"),
                                                _cardNetWorks(
                                                    "https://dcassetcdn.com/design_img/2779177/591638/591638_15209895_2779177_eb4b7a2a_thumbnail.png"),
                                                _cardNetWorks(
                                                    "https://florencefennel.co.in/image/cache/catalog/florencefennel/Machine--Learning-1000x1000.jpg"),
                                                _cardNetWorks(
                                                    "https://www.teckrr.com/wp-content/uploads/2019/08/Data-Science-Using-Python.jpg"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              //Tenho interesse
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Tenho interesse",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 180,
                                            height: 180,
                                            child: Wrap(
                                              runSpacing: 10,
                                              spacing: 10,
                                              direction: Axis.vertical,
                                              children: [
                                                _cardNetWorks(
                                                    "https://w7.pngwing.com/pngs/876/141/png-transparent-mathematics-mathematical-notation-symbol-number-computer-icons-mathematics-text-orange-logo.png"),
                                                _cardNetWorks(
                                                    "https://www.teckrr.com/wp-content/uploads/2019/08/Data-Science-Using-Python.jpg"),
                                                _cardNetWorks(
                                                    "https://florencefennel.co.in/image/cache/catalog/florencefennel/Machine--Learning-1000x1000.jpg"),
                                                _cardNetWorks(
                                                    "https://thumbs.dreamstime.com/z/logotipo-rob%C3%B3tica-49588070.jpg"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
