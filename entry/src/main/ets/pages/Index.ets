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
          Image($r('sys.media.ohos_ic_public_arrow_right'))
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

