import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<Map<String, dynamic>> cardList = [
  {
    'startHour': '11',
    'startMinute': '30',
    'endHour': '12',
    'endMinute': '20',
    'title': 'DESIGN METTING',
    'member': ['ALEX', 'HELENA', 'NANA'],
    'bgColor': const Color.fromRGBO(252, 248, 83, 1)
  },
  {
    'startHour': '12',
    'startMinute': '35',
    'endHour': '14',
    'endMinute': '10',
    'title': 'DAILY PROJECT',
    'member': ['ME', 'RICHARD', 'CIRY'],
    'extra': '+4',
    'bgColor': const Color.fromRGBO(156, 107, 206, 1)
  },
  {
    'startHour': '15',
    'startMinute': '00',
    'endHour': '16',
    'endMinute': '30',
    'title': 'WEEKLY PLANNING',
    'member': ['DEN', 'NANA', 'MARK'],
    'bgColor': const Color.fromRGBO(190, 239, 77, 1)
  },
];

List<String> dateList = ['17', '18', '19', '20', '21'];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final Color _whiteColor = Colors.white;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(32, 32, 32, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset(
                      'assets/images/avatar.jpeg',
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.7,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MONDAY 16',
                    style: TextStyle(
                        color: _whiteColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'TODAY',
                          style: TextStyle(fontSize: 40, color: _whiteColor),
                        ),
                        const Text(
                          '•',
                          style: TextStyle(
                            fontSize: 40,
                            color: Color.fromRGBO(176, 36, 129, 1),
                          ),
                        ),
                        Row(
                          children: dateList.map((item) {
                            return SizedBox(
                              width: 68,
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: _whiteColor.withOpacity(0.4),
                                    fontSize: 40),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cardList.length,
                itemBuilder: (context, index) {
                  final item = cardList[index.clamp(0, cardList.length - 1)];
                  return MettingCard(
                    startHour: item['startHour'],
                    startMinute: item['startMinute'],
                    endHour: item['endHour'],
                    endMinute: item['endMinute'],
                    title: item['title'],
                    member: item['member'],
                    extra: item['extra'],
                    bgColor: item['bgColor'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MettingCard extends StatelessWidget {
  final String startHour;
  final String startMinute;
  final String endHour;
  final String endMinute;
  final String title;
  final List<String> member;
  final String? extra;
  final Color bgColor;

  const MettingCard({
    super.key,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
    required this.title,
    required this.member,
    this.extra,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            startHour,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            startMinute,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Container(
                              width: 1,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                              ),
                              child: const SizedBox.shrink(),
                            ),
                          ),
                          Text(
                            endHour,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            endMinute,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Flexible(
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 54,
                              height: 1,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Row(
                        children: member.map(
                          (item) {
                            return SizedBox(
                              width: 74,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.4),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      if (extra != null)
                        SizedBox(
                          width: 54,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              extra!,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
