@Entry
@Component
struct FoodExample {
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

@Component
struct MyFoodComponent {
  @State food: string = '番茄炒蛋'
  @Prop dog: string = '泰迪'

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