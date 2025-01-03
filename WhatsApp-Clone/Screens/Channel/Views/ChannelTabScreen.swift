//
//  ChannelTabScreen.swift
//  WhatsApp-Clone
//
//  Created by Alfeu Panzo Bena on 26/12/24.
//

import SwiftUI

struct ChannelTabScreen: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            List {
                archivedButton()
                
                ForEach(0..<5) { _ in
                    NavigationLink {
                        ChatRoomScreen()
                    } label: {
                        ChannelItemView()
                    }
                }
                
                inboxFooterView()
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Chats")
            .searchable(text: $searchText)
            .listStyle(.plain)
            .toolbar{
                leadingNavItem()
                trailingNavItem()
            }
        }
    }
}

extension ChannelTabScreen {
    
    @ToolbarContentBuilder
    private func leadingNavItem() -> some
        ToolbarContent {
            ToolbarItem(placement: .topBarLeading){
                Menu {
                    Button{
                        
                    } label: {
                        Label("Select Chats", systemImage: "checkmark.circle")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some
        ToolbarContent {
            ToolbarItemGroup(placement: .topBarTrailing){
                aiButton()
                cameraButton()
                newChatButton()
        }
    }
    
    private func aiButton() -> some View {
        Button{
            
        } label: {
            Image(.circle)
        }
    }
    
    private func cameraButton() -> some View {
        Button{
            
        } label: {
            Image(systemName: "camera")
        }
    }
    
    private func newChatButton() -> some View {
        Button{
            
        } label: {
            Image(.plus)
        }
    }
    
    private func archivedButton() -> some View {
        Button{
            
        } label: {
            Label("Arquived", systemImage: "archivebox.fill")
                .bold()
                .padding()
                .foregroundStyle(.gray)
        }
    }
    
    private func inboxFooterView() -> some View {
        HStack{
            Image(systemName: "lock.fill")
            
            (
                Text("Your personal messages are ")
                +
                Text("end-to-end encrypted")
                    .foregroundStyle(.blue)
            )
        }
        .foregroundStyle(.gray)
        .font(.caption)
        .padding(.horizontal)
    }
}

#Preview {
    ChannelTabScreen()
}
