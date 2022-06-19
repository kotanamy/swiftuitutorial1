//
//  ContentView.swift
//  swiftuitutorial1
//
//  Created by Ярослав Котов on 19.06.2022.
//

import SwiftUI
import UIKit

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

struct ContentView2Text: View {
    var body: some View {
        VStack {
            Text("Lets do it, lorem ipsum dorem Lets do it, lorem ipsum dorem")
                .lineLimit(1) // Принудительно сжать до 1 строки
                .truncationMode(.middle) // сокращаем то что в середине
                .font(.headline)
                .background(Color.init(uiColor: UIColor.green))
            
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

// Нужна для отображения в canvas xCode
// В продакт не идет
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // ContentView()
            ContentView2Text()
        }
    }
}
