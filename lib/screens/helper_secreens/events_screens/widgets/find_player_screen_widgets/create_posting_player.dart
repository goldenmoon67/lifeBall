import 'package:flutter/material.dart';

class CreatePostingPlayer extends StatefulWidget {
  const CreatePostingPlayer({Key? key}) : super(key: key);

  @override
  State<CreatePostingPlayer> createState() => _CreatePostingPlayerState();
}

class _CreatePostingPlayerState extends State<CreatePostingPlayer> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Oyuncu İlanı Oluştur",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Başlık"),
                          hintText: "İlanınız için bir başlık giriniz",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Tarih"),
                                hintText: "İlanınız için bir başlık giriniz",
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.calendar_today),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 3,
                        decoration: const InputDecoration(
                          label: Text("Açıklama"),
                          hintText: "Aradığınız oyuncu için bir mesajınız var mı?",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const <Widget>[
                            Text("OLUŞTUR"),
                            Icon(Icons.add_circle_outline_rounded)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
