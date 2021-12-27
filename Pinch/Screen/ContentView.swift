//
//  ContentView.swift
//  Pinch
//
//  Created by Arthur Neves on 27/12/21.
//

import SwiftUI

struct ContentView: View {
  @State private var isAnimating = false
  @State private var imageScale: CGFloat = 1
  
  var body: some View {
    NavigationView {
      ZStack {
        // MARK: - PAGE IMAGE
        Image("magazine-front-cover")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .cornerRadius(10)
          .padding()
          .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
          .opacity(isAnimating ? 1 : 0)
          .scaleEffect(imageScale)
          // MARK: - 1. TAP GESTURE
          .onTapGesture(count: 2) {
            if imageScale == 1 {
              withAnimation(.spring()) {
                imageScale = 5
              }
            } else {
              withAnimation(.spring()) {
                imageScale = 1
              }
            }
          }
      } //: ZStack
    .navigationTitle("Pinch & Zoom")
    .navigationBarTitleDisplayMode(.inline)
    .onAppear(perform: {
      withAnimation(.linear(duration: 1)) {
        isAnimating = true
      }
    })
    } //: NavigationView
    .navigationViewStyle(.stack)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
