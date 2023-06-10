//
//  IGTextFieldModifier.swift
//  Instagram
//
//  Created by Color Lines on 6/10/23.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
    }
}
