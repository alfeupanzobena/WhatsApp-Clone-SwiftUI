//
//  CustomModifiers.swift
//  WhatsApp-Clone
//
//  Created by Alfeu Panzo Bena on 30/12/24.
//

import SwiftUI

public struct BubbleTailModifier: ViewModifier {
    var direction: MessageDirection
    
    public func body(content: Content) -> some View {
        content.overlay(alignment: direction == .received ? .bottomLeading : .bottomTrailing) {
            BubbleTailView(direction: direction)
        }
    }
}

extension View {
    func applyTail(_ direction: MessageDirection) -> some View {
        self.modifier(BubbleTailModifier(direction: direction))
    }
}
