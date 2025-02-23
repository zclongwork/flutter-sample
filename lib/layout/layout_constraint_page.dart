import 'package:flutter/material.dart';

class LayoutConstraintPage extends StatelessWidget {
  const LayoutConstraintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Layout Constraint'),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              ConstrainedBox(
                //ConstrainedBox用于对子组件添加额外的约束
                constraints: BoxConstraints(
                  //BoxConstraints 是盒模型布局过程中父渲染对象传递给子渲染对象的约束信息，
                  // 包含最大宽高信息，子组件大小需要在约束的范围内
                  minWidth: double.infinity,
                  minHeight: 50,
                ),
                child: Container(
                  color: Colors.red,
                  height: 1,
                ),
              ),
              SizedBox(
                //SizedBox用于给子元素指定固定的宽高
                width: 50,
                height: 50,
                child: Container(
                  color: Colors.blue,
                  height: 1,
                ),
              ),

              //有多个父级ConstrainedBox限制 子元素会根据父级ConstrainedBox的约束进行缩放
              // 对于minWidth和minHeight来说，是取父子中相应数值较大的。
              // 实际上，只有这样才能保证父限制与子限制不冲突。
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                //父
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  //子
                  child: coloredBox(Colors.red),
                ),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                    child: coloredBox(Colors.blue),
                  )),
              ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
                  child: UnconstrainedBox(
                    //“去除”父级限制
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                      child: coloredBox(Colors.red),
                    ),
                  ))
                  //其他的尺寸限制类容器，比如AspectRatio，它可以指定子组件的长宽比
                  // LimitedBox 用于指定最大宽高
                  // FractionallySizedBox 可以根据父容器宽高的百分比来设置子组件宽高等
            ])));
  }

  Widget coloredBox(Color color) {
    return Container(
      color: color,
      height: 5.0,
      width: 5.0,
    );
  }
}
