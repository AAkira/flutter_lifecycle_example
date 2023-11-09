import 'package:flutter/material.dart';

const pageName = 'widgetLifecyclePage';

class WidgetLifecyclePage extends StatelessWidget {
  const WidgetLifecyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root Page'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 100),
        child: ParentWidget(),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      print('parent: setState');
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    print("parent: initState");
  }

  @override
  void didUpdateWidget(dynamic oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("parent: didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("parent: didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("parent: build");

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xffd8e2ff),
        borderRadius: BorderRadius.circular(32),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Parent counter: $_counter'),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => _incrementCounter(),
            child: const Text('Increment parent'),
          ),
          const SizedBox(height: 32),
          ChildWidget(), // without const
          // const ChildWidget(), // with const
        ],
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      print('child: setState');
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    print("child: initState");
  }

  @override
  void didUpdateWidget(dynamic oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("child: didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("child: didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("child: build");

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xfffdd7fa),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Text('Child counter: $_counter'),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => _incrementCounter(),
            child: const Text('Increment child'),
          ),
        ],
      ),
    );
  }
}
