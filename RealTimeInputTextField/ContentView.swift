////
////  ContentView.swift
////  RealTimeInputTextField
////
////  Created by emi oiso on 2023/10/17.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State var inputText = ""
//
//    var body: some View {
//        VStack {
//            Text("あなたの名前は？:　\(inputText)")
//                .padding()
//
//            InputView(inputText: $inputText)
//        }
//    }
//}
//
//struct InputView: View {
//    @Binding var inputText: String
//
//    var body: some View {
//        TextField("",text: $inputText)
//            .modifier(TextFieldClearButton(text: $inputText))
//            .background(.gray)
//            .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var inputText = ""
    
    var body: some View {
        VStack {
            Text("あなたの名前は？:　\(inputText)")
                .padding()
            
            InputView(inputText: $inputText)
        }
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing)
        {
            content
            if !text.isEmpty {
                Button(
                    action: {
                        self.text = ""
                    })
                {
                    Image(systemName: "xmark.circle.fill")
//                    Image(systemName: "xmark.circle")
                                         .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}


struct InputView: View {
    @Binding var inputText: String
    
    var body: some View {
        TextField("",text: $inputText)
            .modifier(TextFieldClearButton(text: $inputText))
            .background(Color.gray) // 背景色をColorで設定
        
        
//            .background(.gray)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
