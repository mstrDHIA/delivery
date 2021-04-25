
import 'package:delivery_app_v0/Models/ChartData.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Providers/MenuProvider.dart';
import 'package:delivery_app_v0/Providers/ProfileProvider.dart';
import 'package:delivery_app_v0/Screens/DeliveredOrders.dart';
import 'package:delivery_app_v0/Widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ProfileStats extends StatefulWidget{

  @override
  ProfileStatsPage createState() => ProfileStatsPage();
  
}




class ProfileStatsPage extends State<ProfileStats>{
 //  User user;
 ProfileProvider profileProvider;
 MenuProvider menuProvider;

// final List<ChartData> chartData = [
//             ChartData('Stars',user.profile.stars.toDouble()),
//             ChartData('Profits', 38),
//             ChartData('Delivered Orders', 34),
//             ChartData('Falied Orders', 52)
//         ];
 TooltipBehavior _tooltipBehavior;


@override
  void initState() {
        profileProvider = Provider.of<ProfileProvider>(context, listen: false);
        menuProvider = Provider.of<MenuProvider>(context, listen: false);
 _tooltipBehavior = TooltipBehavior(
   color: Colors.red,
                enable: true);


    //user=User();
     // user= await user.decoded();

    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
        profileProvider.makestats(context);

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
     double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        child: barapp(context: context,ti: "Stats",menuprovider: menuProvider),
                preferredSize: Size.fromHeight(deviceheight*0.09)),

        
      body: Consumer<ProfileProvider>(
              builder: (BuildContext context, value, Widget child) {return Stack(
                overflow: Overflow.visible,
                              children:[

                                Positioned(top: deviceheight*0.14,
                                left: devicewidth*0.3,
                                  child: profileProvider.photo),
                                 Positioned(top: deviceheight*0.02,
                                 left: devicewidth*0.1,

                    child: Container(
                      width: devicewidth*0.8,
                      height: deviceheight*0.6,
                      child: Center(
                        child: SfCircularChart(
                                        tooltipBehavior: _tooltipBehavior,

                          
                  legend: Legend(
                    height: '100%',
                    isVisible:true,
                    position: LegendPosition.bottom,
                    overflowMode: LegendItemOverflowMode.wrap,
                    iconHeight: 30,
                    iconWidth: 30,
                    //alignment: ChartAlignment.
                    textStyle: TextStyle(fontSize: 26),
                    
                  ),
          series: <CircularSeries>[
                  
                                  // Renders radial bar chart
                                  RadialBarSeries<ChartData, String>(
                                                      enableTooltip: true, 

                                      radius: '100%',
                                        dataSource: profileProvider.chartData,
                                        xValueMapper: (ChartData data, _) => data.x,
                                        yValueMapper: (ChartData data, _) => data.y,
                                        cornerStyle: CornerStyle.bothCurve,
                                        dataLabelSettings: DataLabelSettings(
                                          isVisible: true,

                                        ),
                                        
                                        //legendIconType: LegendIconType.circle
                                  )
                              ]
        ),
                      ),
                                                                    ),
                                 ),
                                 Positioned(
                                   top: deviceheight*0.7,
                                   left: devicewidth*0.2,
                                    child: Container(
                                      width: devicewidth * 0.6,
    height: deviceheight * 0.06,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 25,
              spreadRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.16))
        ],
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromRGBO(227, 62, 81, 1),
              const Color.fromRGBO(236, 91, 108, 1)
            ])),
                                      child: FlatButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DeliveredOrders()));
                                      },
                                        child: Text("Orders Reports",style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ))),
                                    ),
                                 )
                                 
                                 ]
              ); 
               },

              
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }


}