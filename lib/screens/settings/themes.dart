import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/designer/color_plate.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/values/constants.dart';
import 'package:qooty/values/messeges.dart';
import 'package:qooty/widgets/app_bar.dart';

class ThemesScreen extends StatelessWidget {
  final List<ColorPlate> plates = ColorPlate.values;

  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    final _orientation = MediaQuery.of(context).orientation;
    final _height =
        _orientation == Orientation.portrait ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width;
    final _width =
        _orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: designer.colors.second,
      body: DefaultTextStyle(
        style: designer.textStyle,
        child: Column(
          children: <Widget>[
            Expanded(
              child: SafeArea(
                child: Container(
                  padding: kDefaultScreenPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      QootyAppBar(showTitleOnly: true),
                      SizedBox(height: 20),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (_orientation == Orientation.portrait) ? 2 : 4,
                            childAspectRatio: _width / (_height / 4),
                          ),
                          itemCount: plates.length,
                          itemBuilder: (_, index) {
                            final plate = plates[index];
                            return InkWell(
                              onTap: () => designer.updateTheme(plate: plate),
                              child: Container(
                                color: plate.colors.second,
                                margin: EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    plate.name,
                                    style: designer.textStyler(
                                        color: plate.colors.first, fontSize: designer.fontSize * .75),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 75,
              width: double.infinity,
              child: FlatButton(
                color: designer.colors.first,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  Messages.back,
                  style: designer.textStyler(color: designer.colors.second),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
