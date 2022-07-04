//
//  Content View.swift
//  iOSApp
//
//  Created by Hastomi Riduan Munthe on 04/07/22.
//

import SwiftUI
import Speech


struct ContentView: View {
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    
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
                Text("\(swiftUISpeech.outputText)")
                // prints results to screen
                    .font(.title)
                    .bold()
                    
            }.frame(width: 300,height: 200)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4))
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SwiftUISpeech())
    }
}
