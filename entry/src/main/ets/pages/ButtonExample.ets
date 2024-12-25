@Entry
@Component
struct ButtonExample {
  build() {
    Column() {
      MyButton()
      MyButton({ count: 10 })
      MyButton()
    }
    .padding(20)
  }
}

@Component
struct MyButton {
  @Prop count: number = 1
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