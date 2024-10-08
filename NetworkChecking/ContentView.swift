//
//  ContentView.swift
//  NetworkChecking
//
//  Created by mac on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var util:Utilities
    @State private var showModal = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, IOS programmer!")
            Button(action: {
                self.util.monitorNetwork()
                self.showModal.toggle()
            }){
                Text("Check Network")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            .padding()
            .sheet(isPresented: $showModal){
                modalView(showModal: self.$showModal, isConn: self.$util.isConn)
            }
        }
    }
}

struct modalView:View {
    @Binding var showModal:Bool
    @Binding var isConn:Bool
    var body: some View {
        if isConn{
            return ZStack{
                Color.green
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image(systemName: "wifi")
                        .resizable()
                        .frame(width: 102, height: 80)
                    
                    Text("Connected")
                        .font(.title).padding()
                    
                    Button(action: {
                        self.showModal.toggle()
                    }){
                        Image(systemName: "xmark.circle.fill")
                    }
                }.foregroundColor(Color.white)
            }
        }else{
            return ZStack{
                Color.red
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image(systemName: "wifi")
                        .resizable()
                        .frame(width: 102, height: 80)
                    
                    Text("Not Connected")
                        .font(.title).padding()
                    
                    Button(action: {
                        self.showModal.toggle()
                    }){
                        Image(systemName: "xmark.circle.fill")
                    }
                }.foregroundColor(Color.white)
            }
        }
    }
}

#Preview {
    ContentView(util: Utilities())
}
