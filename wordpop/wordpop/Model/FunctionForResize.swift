//
//  FunctionForResize.swift
//  wordpop
//
//  Created by Oleg Yakushin on 9/27/23.
//

import SwiftUI

func sizeScreenIphone() -> CGFloat {
    if UIScreen.main.bounds.width > UIScreen.main.bounds.height {
        return UIScreen.main.bounds.width / 926
    } else {
        return UIScreen.main.bounds.width / 428
    }
}
