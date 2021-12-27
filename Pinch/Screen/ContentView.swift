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
  @State private var imageOffset: CGSize = .zero //CGSize(width: 0, height: 0)
  
  func resetImageState() {
    return withAnimation(.spring()) {
      imageScale = 1
      imageOffset = .zero
    }
  }
  
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
          .offset(x: imageOffset.width, y: imageOffset.height)
          .scaleEffect(imageScale)
          // MARK: - 1. TAP GESTURE
          .onTapGesture(count: 2) {
            if imageScale == 1 {
              withAnimation(.spring()) {
                imageScale = 2
              }
            } else {
              resetImageState()
            }
          }
          // MARK: - 2. DRAG GESTURE
          .gesture(
            DragGesture()
              .onChanged { value in
                withAnimation(.linear(duration: 1)) {
                  imageOffset = value.translation
                }
              }
              .onEnded { _ in
                if imageScale <= 1 {
                  resetImageState()
                }
              }
          )
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
