//
//  ChatRoomScreen.swift
//  WhatsApp-Clone
//
//  Created by Alfeu Panzo Bena on 27/12/24.
//

import SwiftUI

struct ChatRoomScreen: View {
    var body: some View {
        MessageListView()
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            leadingNavItems()
            trailingNavItems()
        }
        .safeAreaInset(edge: .bottom){
            TextInputArea()
        }
    }
}

// MARK: Toolbar Items
extension ChatRoomScreen {
     @ToolbarContentBuilder
     private func leadingNavItems() -> some ToolbarContent {
         ToolbarItem(placement: .topBarLeading) {
             HStack {
                 Circle()
                     .frame(width: 35, height: 35)
                 
                 Text("Alfeu")
                     .bold()
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button {
                
            } label: {
                Image(systemName: "video")
            }
            
            Button {
                
            } label: {
                Image(systemName: "phone")
            }
       }
   }
}

#Preview {
    NavigationStack {
        ChatRoomScreen()
    }
}
