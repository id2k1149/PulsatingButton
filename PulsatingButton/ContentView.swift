//
//  ContentView.swift
//  PulsatingButton
//
//  Created by Max Franz Immelmann on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPulsating = false
       
    var body: some View {
        ZStack {
            Color(.orange)
                .ignoresSafeArea()
            
            Button(action: {
                // Add action here
            }) {
                Text("Button")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Capsule()
                            .stroke(Color.white, lineWidth: 2)
                            .background(
                                Capsule()
                                    .fill(Color.blue)
                                    .scaleEffect(isPulsating ? 1.05 : 1.0)
                                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                            )
                    )
                    .scaleEffect(isPulsating ? 1.1 : 1.0)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            }
            .onAppear {
                isPulsating = true
            }
            .onDisappear {
                isPulsating = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
