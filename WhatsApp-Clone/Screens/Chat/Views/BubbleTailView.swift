//
//  BubbleTailView.swift
//  WhatsApp-Clone
//
//  Created by Alfeu Panzo Bena on 27/12/24.
//

import SwiftUI

struct BubbleTailView: View {
    var direction : MessageDirection
    
    private var backgroudColor : Color {
        return direction == .received ? .bubbleWhite : .bubbleGreen
    }
    
    var body: some View {
        Image(direction == .sent ? .outgoingTail : .incomingTail)
            .renderingMode(.template)
            .resizable()
            .frame(width: 10, height: 10)
            .offset(y: 3)
            .foregroundStyle(backgroudColor)
    }
}

#Preview {
    ScrollView {
        BubbleTailView(direction: .sent)
        BubbleTailView(direction: .received)
    }
    .frame(maxWidth: .infinity)
    .background(Color.gray.opacity(0.1))
}
