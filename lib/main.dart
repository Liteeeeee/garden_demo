import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garden Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Garden Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const GardenPage(),
    const DiagnosisPage(),
    const ConfirmPage(),
    const SearchPage(),
    const AiAssistantPage(),
  ];

  final List<String> _titleOptions = <String>[
    // 新增title
    '花园',
    '诊断',
    '确认',
    '搜索',
    'AI助手',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleOptions[_selectedIndex])),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '花园'),
          BottomNavigationBarItem(icon: Icon(Icons.healing), label: '诊断'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: '确认',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
          BottomNavigationBarItem(icon: Icon(Icons.android), label: 'AI助手'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// 花园页面模块
class GardenPage extends StatelessWidget {
  const GardenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // 上半部分：图片
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://miaobi-lite.bj.bcebos.com/miaobi/5mao/b%275a2U6ZuA56u56IqL5oCO5LmI5YW7XzE3MjkxMjk3NjIuOTM5MTIyNw%3D%3D%27/0.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align( // 使用 Align 组件
              alignment: Alignment.bottomCenter, // 将 Column 放在底部
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10), // 增加底部内边距
                child: Column(
                  mainAxisSize: MainAxisSize.min, // 让 Column 的大小适应其内容
                  children: [
                    const Text(
                      "你的花园是空的",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "添加工厂以获取定制护理时间表并提醒您的工厂",
                      style: TextStyle(fontSize: 12, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 下半部分：拍照按钮
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  // 拍照按钮的点击事件处理
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );

                  if (pickedFile != null) {
                    //TODO
                    print('Image picked: ${pickedFile.path}');
                  } else {
                    print('No image selected.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  '加一个植物',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 确认页面模块
class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // 上半部分：图片
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://miaobi-lite.bj.bcebos.com/miaobi/5mao/b%275a2U6ZuA56u56IqL5oCO5LmI5YW7XzE3MjkxMjk3NjIuOTM5MTIyNw%3D%3D%27/0.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // 下半部分：拍照按钮
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  // 拍照按钮的点击事件处理
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );

                  if (pickedFile != null) {
                    //TODO
                    print('Image picked: ${pickedFile.path}');
                  } else {
                    print('No image selected.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(24),
                  backgroundColor: Colors.green,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// AI助手页面模块
class AiAssistantPage extends StatefulWidget {
  const AiAssistantPage({Key? key}) : super(key: key);

  @override
  _AiAssistantPageState createState() => _AiAssistantPageState();
}

class _AiAssistantPageState extends State<AiAssistantPage> {
  final List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _sendMessage(String text) {
    if (text.trim().isNotEmpty) {
      setState(() {
        _messages.add('You: $text');
        _textController.clear();
        // 这里可以添加调用 AI 助手 API 的逻辑，并添加 AI 的回复到 _messages 列表中
        // 例如：_messages.add('AI: 这是 AI 的回复');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(_messages[index]));
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: '请输入您的问题',
                    border: InputBorder.none,
                  ),
                  onSubmitted: _sendMessage,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _sendMessage(_textController.text),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 搜索页面模块
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 上半部分：搜索输入框和列表
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                // 搜索输入框
                TextField(
                  decoration: const InputDecoration(
                    hintText: '搜索...',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // 列表
                Expanded(
                  child: ListView.builder(
                    itemCount: 20, // 假设有20个搜索结果
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('搜索结果 ${index + 1}'),
                        onTap: () {
                          // 处理列表项点击事件
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // 下半部分：底部按钮
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0), // 距离底部20
            child: ElevatedButton(
              onPressed: () async {
                // 按钮点击事件
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(
                  source: ImageSource.camera,
                );

                if (pickedFile != null) {
                  //TODO
                  print('Image picked: ${pickedFile.path}');
                } else {
                  print('No image selected.');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0, // 缩小水平方向的padding
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.green,
              ),
              child: const Row( // 使用 Row
                mainAxisAlignment: MainAxisAlignment.center, // 使子项居中
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8), // 间距
                  Text(
                    '快照',
                    style: TextStyle(fontSize: 20, color: Colors.white),
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

// 诊断页面模块
class DiagnosisPage extends StatelessWidget {
  const DiagnosisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // 上半部分：图片
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://miaobi-lite.bj.bcebos.com/miaobi/5mao/b%275a2U6ZuA56u56IqL5oCO5LmI5YW7XzE3MjkxMjk3NjIuOTM5MTIyNw%3D%3D%27/0.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // 下半部分：拍照按钮
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  // 拍照按钮的点击事件处理
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );

                  if (pickedFile != null) {
                    //TODO
                    print('Image picked: ${pickedFile.path}');
                  } else {
                    print('No image selected.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(24),
                  backgroundColor: Colors.green,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
