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
            //ContentView5TextField()
            ContentView6Slider()
        }
    }
}
