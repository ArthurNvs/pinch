//
//  ContentView.swift
//  Pinch
//
//  Created by Arthur Neves on 27/12/21.
//

import SwiftUI

struct ContentView: View {
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
      } //: ZStack
    .navigationTitle("Pinch & Zoom")
    .navigationBarTitleDisplayMode(.inline)
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
