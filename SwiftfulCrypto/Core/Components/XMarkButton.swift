//
//  XMarkButton.swift
//  SwiftfulCrypto
//
//  Created by Paul Norris on 7/29/25.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
        )
    }
}

#Preview {
    XMarkButton()
}
