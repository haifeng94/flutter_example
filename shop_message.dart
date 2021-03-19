import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShopMessage extends StatefulWidget {
  /// 接受的参数列表。
  final Map shop_message;

  ShopMessage({
    this.shop_message,
  });
  @override
  _ShopMessage createState() => _ShopMessage();
}

class _ShopMessage extends State<ShopMessage> {
  @override
  Widget build(BuildContext context) {
    print(widget.shop_message['seller_id']);
    return Container(
      // 通过余量（`margin`）属性添加底部的分割空间。
      //margin: EdgeInsets.only(bottom: 10.0),
      // 通过填充（`padding`）属性添加内部填充空间。
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      color: Color(0xffFFFFFF),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: 10.0,),
            Container(
              height: 60.0,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 0.0, // 7.0
                ),
                //height: 60.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              child: CachedNetworkImage(
                                imageUrl: widget.shop_message['shop_pic'], //shop_pic,
                                height: 50.0,
                                width: 50.0,
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      widget.shop_message['shop_name'],
                                      style: TextStyle(
                                        color: Color(0xff333333), // 0xff333333
                                        fontFamily: 'PingFangMedium',
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 18.0,
                                    width: 40.0,
                                    margin: EdgeInsets.only(top: 2.0),
                                    //color: Color(0xffFE3A50),
                                    decoration: BoxDecoration(
                                      color: Color(0xffFE3A50),
                                      // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                                      // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                                      // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
                                      borderRadius: BorderRadius.all(
                                        // 半径（`Radius`）类，圆形或椭圆形的半径。
                                        // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      widget.shop_message['shop_type'] == true ? '天猫' : '淘宝',
                                      style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontFamily: 'PingFangMedium',
                                        fontSize: 13.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // 使用命名路由导航到第二个屏幕。
                          print('关注');
                        },
                        child: Container(
                            height: 30.0,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffFF447C)),
                              borderRadius: BorderRadius.circular(20.0),
                              //color: Colors.green
                            ),
                            child: ClipRRect(
                              // 边界半径（`borderRadius`）属性，圆角的边界半径。
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0)),
                              child: Container(
                                alignment: Alignment.center,
                                color: Color(0xffFFFFFF),
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '关注',
                                  style: TextStyle(
                                    color: Color(0xffFF447C),
                                    fontFamily: 'PingFangRegular',
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ]),
              ),
            ),
            Container(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('宝贝描叙 '),
                        Text(
                          widget.shop_message['desc_score'] != null ? widget.shop_message['desc_score'] : '-',
                          //desc_score != null ? desc_score : '-',
                          style: TextStyle(
                            color: Color(0xffFE3A50),
                            fontFamily: 'PingFangMedium',
                            //fontSize: 14.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('卖家服务 '),
                        Text(
                          widget.shop_message['ship_score'] != null ? widget.shop_message['ship_score'] : '-',
                          //ship_score != null ? ship_score : '-',
                          style: TextStyle(
                            color: Color(0xffFE3A50),
                            fontFamily: 'PingFangMedium',
                            //fontSize: 14.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('物流服务 '),
                        Text(
                          widget.shop_message['service_score'] != null ? widget.shop_message['service_score'] : '-',
                          //service_score != null ? service_score : '-',
                          style: TextStyle(
                            color: Color(0xffFE3A50),
                            fontFamily: 'PingFangMedium',
                            //fontSize: 14.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
