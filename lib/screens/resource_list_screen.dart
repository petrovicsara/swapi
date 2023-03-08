import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/common/util.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:flutter/material.dart';

class ResourceListScreen extends StatelessWidget {
  final String resourceNameType;
  const ResourceListScreen({Key? key, required this.resourceNameType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BaseConfig baseConfig = BaseConfig();
    List<dynamic> resourceList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.brightYellow,
        title: Text(capitalize(resourceNameType)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                  future: baseConfig.getSpecificDataList(resourceNameType),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      resourceList = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: resourceList.length,
                            itemBuilder: (context, index) {
                              var resource = resourceList[index];
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadowColor: Constants.lightGray,
                                elevation: 5,
                                color: Constants.lightGray,
                                child: InkWell(
                                  onTap: () {
                                    dynamic nextScreen = getResourceScreen(resourceNameType, resourceList[index]);
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen));
                                  },
                                  child: ListTile(
                                    title: Text(
                                      resource.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    subtitle: const Text('Get to know more..'),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Constants.brightYellow,
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
