//
//  PageModel.swift
//  Pinch
//
//  Created by Arthur Neves on 03/01/22.
//

import Foundation

struct Page: Identifiable {
  let id: Int
  let imageName: String
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}
