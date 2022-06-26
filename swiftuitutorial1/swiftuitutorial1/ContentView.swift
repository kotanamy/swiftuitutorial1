//
//  ContentView.swift
//  swiftuitutorial1
//
//  Created by Ярослав Котов on 19.06.2022.
//

import SwiftUI
import UIKit

//Основы
// VStack
// HStack
// ZStack
// body - обязательное вычисляемое свойство
struct ContentView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Text("Hello, world!")
                .padding(.bottom, 50)
            Text("hren morjoviy")
                .padding(.top, 50)
            HStack (alignment: .center, spacing: 10 ) {
                Text("Hello, world!")
                // Divider() // полоса
                Spacer() // разделяет на равные части
                Text("hren morjoviy")
                Spacer()
                    .frame(height: 50)
            }
            ZStack {
                Image("chickenGirl")
                Text("Chicken Girl")
                    .font(.largeTitle)
                    .bold()
                    .background(Color.white)
                    .foregroundColor(.yellow)
                
            }
        }
    }
}


// Работа с текстом
struct ContentView2Text: View {
    var body: some View {
        VStack {
            Text("Lets do it, lorem ipsum dorem Lets do it, lorem ipsum dorem")
                .lineLimit(1) // Принудительно сжать до 1 строки
                .truncationMode(.middle) // сокращаем то что в середине
                .font(.headline)
                .background(Color.init(.link))
            
            Text("AAAAAAAAAAAAAAA A AAAIUDAGDIAD H DioahDioAHDOHADO IODAHiodhqp-ufhnsloag1")
                .kerning(5) // между букв добавляет растояние в конце, если не нужно растояние в конце, то используйте tracking(5)
                .multilineTextAlignment(.center)
                .background(.yellow)
                .foregroundColor(.blue) // цвет самих букв
                .lineSpacing(10)
            
            // Порядок важен - (С) Конфуций
            Text("HAHAHAHHAH")
                .font(.largeTitle)
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
            
        }
        
    }
}

// Работа с изображением и градиент
struct ContentView3Image: View {
    var body: some View {
        VStack {
            VStack{
                // Можно конвертировать как обычный текст
                Image(systemName: "cloud.sun.fill") // cистемная картинка (SF Symbols (прога с системными изображениями))
                    .font(.largeTitle)
                    .padding(30)
                    .background(Color.blue) // может принимать изображение в параметры
                    .foregroundColor(.white)
                    .clipShape(Circle()) // накладываем форму (круга) (Capsule\RoundedRectangle ...)
                // .flame(width: 200, height: 200) - рамка
                // по дефолту растянуто
                Image("image2")
                    .resizable()                    // оставляет картинку в ее прежнем
                    .aspectRatio(contentMode: .fit) // соотношении сторон
            }
            
            HStack{
                // Градиент
                Text("Huhaha")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .leading, endPoint: .trailing)) // сверху вниз (.top .bottom)
                
            }
            HStack {
                // Радиальный градиент
                let colors = Gradient(colors: [.red, .blue, .green, .white, .purple])
                // let gradient = RadialGradient(gradient: colors, center: .center, startRadius: 30, endRadius: 200) // из центра наружу
                let gradient = AngularGradient(gradient: colors, center: .center) // по кругу
                Circle()
                // .fill(gradient)
                // .frame(width: 200, height: 200)
                    .strokeBorder(gradient, lineWidth: 30)
            }
        }
    }
}

// Взаимодействие с экраном (Binding)
// @State + Toggle + Button
struct ContentView4StateToggle: View {
    
    //Property Wrapper: @State
    
    @State private var showHello = true
    @State private var showDetail = false // для кнопки
    
    var body: some View {
        VStack {
            // Toggle(isOn: $showHello, label: {Text("Hello")})
            // $ - для биндинга нужен
            // Аналогично переписываем
            Toggle(isOn: $showHello){ // вынесли замыкание
                Text("Hello")
            } .padding()
            
            if showHello {
                Text("Toggle true")
            }
            
            Button(action: {
                self.showDetail.toggle() // не тот тогл который выше (переключает bool (т.е. showDetail))
            }, label: {
                Text("ShowDetails")
            }).background(.black).padding()
            
            if showDetail {
                Text("Some details here...")
            }
        }
    }
}
// TextField SecureField
struct ContentView5TextField: View {
    
    @State private var name = ""
    @State private var password = ""
    
    var body: some View {
        VStack{
            TextField("PlaceholderMy", text: $name) // $ - для изменения свойста name
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Для пароля
            SecureField("Enter your password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Hello, \(name), your password: \(password)") // здесь name только читаем
        }
    }
}

// Slider
struct ContentView6Slider: View {
    
    @State private var celsius: Double = 0
    
    var body: some View {
        VStack{
            Slider(value: $celsius, in: -100...100, step: 0.1)
            Text("\(celsius) C is \(celsius * 9/5 + 32) - fahr")
        }
    }
}

struct ContentView7Picker: View {
    
    private var colors = ["black", "white", "green", "yellow"]
    
    @State private var selectedColor = 0
    
    var body: some View {
        VStack{
            Picker(selection: $selectedColor, label: Text("Choose a color")){
                ForEach(0 ..< colors.count) {
                    Text(self.colors[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            //.padding()
            //.frame(width: 200, height: 200, alignment: .center)
            
            
            Text("You selected: \(colors[selectedColor])")
        }
    }
}


// Stepper
struct ContentView8Stepper: View {
    
    @State private var age = 18
    
    var body: some View {
        VStack{
            Stepper("Enter your age", value: $age, in: 0...130)
            Text("Age : \(age)")
            
            //Stepper 2
            Stepper("Enter age",
                    onIncrement: {
                self.age += 1
                print("Add")
            },
                    onDecrement: {
                self.age -= 1
                print("minus")
            }
            )
        }
    }
}

// Touch, press, drag
struct ContentView9Touches: View {
    
    var body: some View {
        VStack{
            Text("Tap me")
                .contentShape(Rectangle()) // Выделяет область для нажатия
                .onTapGesture {
                    print("Tapped!")
                }
                .font(.largeTitle)
                .background(.yellow)
            
            Image("chickenGirl")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture(count: 2) { // сколько раз надо нажать
                    print("Doudle chicken")
                }
            
            // Распознователь жестов
            Image("image2").resizable().aspectRatio(contentMode: .fit)
                .gesture( // нажатие
                    LongPressGesture(minimumDuration: 2) // нажимаем минимум 2 сек
                        .onEnded{ _ in // когда прошло 2 сек запускаем гуся в чат
                            print("Гусь")
                        }
                )
            
            // Перемещение
            Image("image2").resizable().aspectRatio(contentMode: .fit)
                .gesture( // нажатие
                    DragGesture(minimumDistance: 30) // перетягиваем на 30 пунктов
                        .onEnded{ _ in // когда перетащили (завершили перетаскивание (отжали)) на 30 пунктов запускаем 2х гусей в чат
                            print("2 гуся")
                        }
                )
            
            
        }//.onTapGesture {
        //   print("Hi")
        //}
    }
}


// List
// Нужен для отображения
// статических или динамических элементов

// Статический элемент
struct MusicRow : View{
    var name : String
    var body: some View {
        Text("Music: \(name)")
    }
}

// Динамический элемент
struct Restaurant : Identifiable {
    var id = UUID() // Обязательная строка
    var name: String
}

struct RestaurantRow : View {
    var restaurant : Restaurant
    var body : some View {
        Text("Come and eat at \(restaurant.name)")
    }
}

// Делим список на секции
struct TaskRow: View {
    var body: some View{
        Text("Покорми гуся")
    }
}

struct ContentView10List: View {
    var body: some View {
        
        let first = Restaurant(name: "first R")
        let second = Restaurant(name: "second R")
        let third = Restaurant(name: "third R")
        
        let restaurants = [first, second, third]
        
        VStack{
            // Статические эл-ты
            List {
                MusicRow(name: "Rock")
                MusicRow(name: "Rap")
                MusicRow(name: "JRock")
            }.frame(height: 200)
            
            //Spacer()
            
            // Динамические эл-ты
            List(restaurants){ r in
                RestaurantRow(restaurant: r)
            }.frame(height: 200)
            
            //Spacer()
            
            List {
                Section(header: Text("My tasks"), footer: Text("bottom")){
                    TaskRow()
                    TaskRow()
                }
                Section(header: Text("Other tasks")){
                    TaskRow()
                    TaskRow()
                    TaskRow()
                } .listRowBackground(Color.green)
            }.listStyle(GroupedListStyle())
            
        }
    }
}



// NavigationView - контейнер для других view
// К таким контейнерам так же относятся: TabView и Group
struct ContentView11NavigationView: View {
    
    var body: some View {
        NavigationView {
            
            Text("Swift")
                .navigationBarTitle("Welcome, my brother", displayMode: .inline)
                .navigationBarItems(trailing:
                 HStack{
                    Button("Help"){
                        print("Help tapped")
                    }
                    
                    Button("About"){
                        print("About tapped")
                    }
                    
                }
                )
        }.background(.black)
    }
}

// NavBar with List
struct ContentView11_2NavigationViewWithList: View {
    
    @State private var users = ["Leha", "Petya", "Shaina"]
    
    var body: some View {
        NavigationView {
            List{
                ForEach(users, id: \.self) { user in
                    Text(user)
                }.onDelete(perform: delete) // при свайпе влево сработает функция удаления (либо кнока в Edit)
                    .onMove(perform: move) // При нажатии Edit можно переставлять элементы
            }.navigationBarItems(trailing: EditButton()) // Создание кнопки Edit
        }
    }
    
    func delete(at offsets: IndexSet){
        users.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination : Int){
        users.move(fromOffsets: source, toOffset: destination)
    }
}


// Tab View - помогает переключаться между view
struct ContentView12TabView: View {
    
    @State private var selectedView = 1
    
    var body: some View {
        // $selectedView для отслеживания активного окна (еще нужно добавить .tabItem.tag)
        TabView(selection: $selectedView){ // панель внизу
            VStack{
                Image("chickenGirl").resizable().aspectRatio(contentMode: .fit)
                Text("First View")
            }
            .tabItem {
                Image(systemName: "1.circle")
                Text("First")
            }.tag(1) // для отслеживания активного окна
            
            
            VStack{
                Image("image2").resizable().aspectRatio(contentMode: .fit)
                Text("Second View")
            }
            .tabItem{
                Image(systemName: "2.circle")
                Text("Second")
            }.tag(2)
        }
    }
}

// Group нужен для группировки view
struct ContentView13Group: View {

    var body: some View {
        VStack{ // Может содержать максимум 10 view
            Group{
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
            Group{
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                
            }
        }
    }
}


//struct ContentView6: View {
//
//    var body: some View {
//        VStack{
//
//        }
//    }
//}

// Нужна для отображения в canvas xCode
// В продакт не идет
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // ContentView()
            // ContentView2Text()
            // ContentView3Image()
            // ContentView4StateToggle()
            // ContentView5TextField()
            // ContentView6Slider()
            // ContentView7Picker()
            // ContentView8Stepper()
            // ContentView9Touches()
            // ContentView10List()
            // ContentView11NavigationView()
            // ContentView11_2NavigationViewWithList()
            // ContentView12TabView()
            ContentView13Group()
        }
    }
}
