//
//  Content View.swift
//  iOSApp
//
//  Created by Hastomi Riduan Munthe on 04/07/22.
//

import SwiftUI
import Speech


class ContentViewDelegate: ObservableObject {
    @Published var speechText: String = ""
}

struct ContentView: View {
    @ObservedObject var delegate : ContentViewDelegate
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    @State var outputText: String = ""
    
    var body: some View {
        VStack (spacing:150){
            VStack (spacing:20) {
            Text("Say “I spend …… for ……. on category ……”")
            Text("“I spend 25000 for \n coffee on category wants”")
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
            }
            VStack {
                // Speech button
                swiftUISpeech.getButton()
                //Spacer()
            }
            VStack{
                Text("\(outputText)")
                // prints results to screen
                    .font(.title)
                    .bold()
                    .onChange(of: swiftUISpeech.outputText) { newValue in
                        outputText = newValue
                        var splitted = outputText.components(separatedBy: " ")
                        if let idSpend = splitted.firstIndex(of: "spend"){
                            print(idSpend)
                            if(idSpend+1 < splitted.count){
                                print(splitted[idSpend+1])
                            }
                        }
                        if let idSpend = splitted.firstIndex(of: "for"){
                            print(idSpend)
                            if(idSpend+1 < splitted.count){
                                print(splitted[idSpend+1])
                            }
                        }
                        if let idSpend = splitted.firstIndex(of: "category"){
                            print(idSpend)
                            if(idSpend+1 < splitted.count){
                                print(splitted[idSpend+1])
                            }
                        }
                        
                        self.$delegate.speechText.wrappedValue = newValue
                        print()
                    }


            }.frame(width: 300,height: 100)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4))
        }
        
    }
}
