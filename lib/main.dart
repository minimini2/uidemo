import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter layout demo'),
          ),
          body: Column(
            // child: Text('Hello World'),
            children: <Widget>[
              Image.asset(
                'images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,buttonSection,textSection],
          ),
        )
    );
  }

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  // Color color = Theme.of(context).primaryColor;
  Widget buttonSection = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.blue[600]!, Icons.call, 'CALL'),
      _buildButtonColumn(Colors.blue[600]!, Icons.near_me, 'ROUTE'),
      _buildButtonColumn(Colors.blue[600]!, Icons.share, 'SHARE'),
    ],
  );

  Widget titleSection = Container(
    //为整个Widget（即这一行）的所有所有方向设置32px的填充
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /**
              将Column放置在Expanded中，由于Expanded会默认占据所有当前Row的空闲可用空间，所以这个Column也会自然被拉伸的占据完所有当前Row可用的空闲空间。
           */
          child: Column(
            /**将Column的crossAxisAlignment属性设置为CrossAxisAlignment.start以保证这个列中的元素(即children属性中的Widget)在水平方向上排列在当前Column的起始位置
             */
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /**
                  将这个Text放在Container中的目的是通过Container来添加填充(padding)
               */
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /**
            最后的2个元素分别是1个Icon和1个Text,分别用来显示星星和数字
         */
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text('41'),
      ],
    ),
  );

}
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}