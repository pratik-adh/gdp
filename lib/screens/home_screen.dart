import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdp/statement-management/getx/getx.dart';
import 'package:gdp/statement-management/providers/counter_provider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterControllerProvider>(
        context); // Get the provider instance
    final getxController = Get.put(CounterControllerGetx());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("GetX, Dio, Provider", selectionColor: Colors.blue),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextComponent(count: provider.count, service: "Provider"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Icon(Icons.remove),
                  onPressed: () => provider.decrement(),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: const Icon(Icons.exposure_zero),
                  onPressed: () => provider.reset(),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: const Icon(Icons.add),
                  onPressed: () => provider.increment(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => TextComponent(
                count: getxController.count.value,
                service: getxController.myValue.value)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Icon(Icons.remove),
                  onPressed: () => getxController.decrement(),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: const Icon(Icons.exposure_zero),
                  onPressed: () => getxController.reset(),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: const Icon(Icons.add),
                  onPressed: () => getxController.increment(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Go to next page to scan the QR",
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text("Scan QR",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onPressed: () => Navigator.pushNamed(context, "/scanner"),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TextComponent extends StatelessWidget {
  final dynamic count;
  final String service;

  const TextComponent({super.key, required this.count, required this.service});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<CounterControllerGetx>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Text('Handled by $service: ',
              style: const TextStyle(
                fontSize: 16,
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Number of times the button's pressed ",
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '$count',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
