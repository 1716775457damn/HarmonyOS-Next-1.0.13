//简单的自定义组件
@Component
struct MyButton {
  @State count: number = 1
  build() {
    Row() {
      Text('点击次数：' + this.count.toString())
      Button('点击我').onClick(() => {
        this.count++
      })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(10)
    .border({ width: 1 })
    .width('100%')
  }
}

@Entry
@Component
struct Index {
  build() {
    Column() {
      MyButton()
      MyButton({ count: 10 })
      MyButton()
    }
    .padding(20)
  }
}


///////////////////////////////////////////////////////////////
//参数传递和状态管理
@Component
struct MyFoodComponent {
  @State food: string = '番茄炒蛋'
  dog: string = '泰迪' // 普通变量也是响应式的

  sayHello = () => {
    console.log('默认的打招呼')
  }

  build() {
    Row() {
      Text(`自定义组件 ${this.dog} 喜欢吃 ${this.food}`)
      Button('点击按钮')
        .onClick(() => {
          this.food += '!'
          this.dog += '.'
          this.sayHello()
        })
    }
    .border({ width: 1 })
    .padding(20)
  }
}

@Entry
@Component
struct Index {
  build() {
    Column() {
      MyFoodComponent()

      MyFoodComponent({
        dog: '金毛',
        food: '牛排',
        sayHello() {
          console.log('外部传入的打招呼的逻辑')
        }
      })
      .border({ width: 1 })
      .padding(20)

      MyFoodComponent()
    }
    .padding(20)
  }
}


////////////////////////////////////////////
//事件处理和回调
@Component
struct CardComponent {
  title: string = ''
  subTitle: string = ''

  clickHandler = () => {
    AlertDialog.show({
      message: '默认的功能'
    })
  }

  build() {
    Column() {
      Row() {
        Text(this.title).layoutWeight(1)
        Row() {
          Text(this.subTitle)
          Image($r('app.media.ic_public_arrow_right'))
            .width(20)
        }
        .onClick(() => {
          this.clickHandler()
        })
      }
      Row() {
        Text('默认的内容')
      }
      .height(100)
    }
    .backgroundColor(Color.Pink)
    .borderRadius(10)
    .padding(10)
    .margin({ bottom: 20 })
  }
}

@Entry
@Component
struct Index {
  build() {
    Column() {
      CardComponent({
        title: '所有评论',
        subTitle: '查看更多',
        clickHandler() {
          AlertDialog.show({
            message: '查看更多评论'
          })
        }
      })

      CardComponent({
        title: '所有商品(100+)',
        subTitle: '查看更多',
        clickHandler() {
          AlertDialog.show({
            message: '查看更多商品'
          })
        }
      })
    }
    .padding(20)
  }
}


///////////////////////////////////////////////////////////
//使用@Builder和@BuilderParam的自定义组件
@Component
struct CardComponent {
  title: string = ''
  subTitle: string = ''

  clickHandler = () => {
    AlertDialog.show({
      message: '默认的功能'
    })
  }

  @Builder
  defaultBuilder() {
    Text('默认内容')
  }

  @BuilderParam
  contentBuilder: () => void = this.defaultBuilder

  build() {
    Column() {
      Row() {
        Text(this.title).layoutWeight(1)
        Row() {
          Text(this.subTitle)
          Image($r('app.media.ic_public_arrow_right'))
            .width(20)
        }
        .onClick(() => {
          this.clickHandler()
        })
      }
      Row() {
        this.contentBuilder()
      }
      .height(100)
    }
    .backgroundColor(Color.Pink)
    .borderRadius(10)
    .padding(10)
    .margin({ bottom: 20 })
  }
}

@Entry
@Component
struct Index {
  build() {
    Column() {
      CardComponent({
        title: '所有评论',
        subTitle: '查看更多',
        clickHandler() {
          AlertDialog.show({
            message: '查看更多评论'
          })
        }
      }) {
        Text('这里是自定义内容')
      }

      CardComponent({
        title: '所有商品(100+)',
        subTitle: '查看更多',
        clickHandler() {
          AlertDialog.show({
            message: '查看更多商品'
          })
        }
      })
    }
    .padding(20)
  }
}

