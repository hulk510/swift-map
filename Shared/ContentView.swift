//
//  ContentView.swift
//  Shared
//
//  Created by 後藤遥 on 2022/02/10.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var inputText: String = ""
    @State var dispSearchKey: String = ""
    @State var dispMapType: MKMapType = .standard
    
    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    dispSearchKey = inputText
                }
                .padding()
            ZStack(alignment: .bottomTrailing){
                
                MapView(searchKey: dispSearchKey, mapType: dispMapType)
                Button(action: {
                    if dispMapType == .standard {
                        dispMapType = .satellite
                    }else if dispMapType == .satellite {
                        dispMapType = .hybrid
                    } else {
                        dispMapType = .standard
                    }
                }) {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0, alignment: .leading)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
        }
    }
}

// これはこのページのcanvasで表示されるだけって感じ。
// だからMapView実装したやつも見えるんやな。　　　　　　　　
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
