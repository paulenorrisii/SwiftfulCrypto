//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Paul Norris on 7/20/25.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
