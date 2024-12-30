//
//  MessageItem.swift
//  WhatsApp-Clone
//
//  Created by Alfeu Panzo Bena on 27/12/24.
//

import SwiftUI

struct MessageItem: Identifiable {
    let id = UUID().uuidString
    let text: String
    let direction: MessageDirection
    
    static let sendPlaceholder = MessageItem(text: "Holy Spagetti", direction: .sent)
    static let receivedPlaceholder = MessageItem(text: "Hey Dude whats up", direction: .received)
    
    var alignment: Alignment {
        return direction == .received ? .leading : .trailing
    }
    
    var horizontalAlignment: HorizontalAlignment {
        return direction == .received ? .leading : .trailing
    }
    
    var backgroundColor: Color {
        return direction == .sent ? .bubbleGreen : .bubbleWhite
    }
}

enum MessageDirection {
    case sent, received
    
    static var random: MessageDirection {
        return [MessageDirection.sent, .received].randomElement() ?? .sent
    }
}
