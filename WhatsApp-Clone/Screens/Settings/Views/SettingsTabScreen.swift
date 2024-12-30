//
//  SettingsTabScreen.swift
//  WhatsApp-Clone
//
//  Created by Alfeu Panzo Bena on 26/12/24.
//

import SwiftUI

struct SettingsTabScreen: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            List {
                SettingsHeaderView()
                
                Section{
                    SettingsItemView(item: .broadCastLists)
                    SettingsItemView(item: .starredMessages)
                    SettingsItemView(item: .linkedDevices)
                }
                
                Section{
                    SettingsItemView(item: .account)
                    SettingsItemView(item: .privacy)
                    SettingsItemView(item: .chats)
                    SettingsItemView(item: .notifications)
                    SettingsItemView(item: .storage)
                }
                
                Section{
                    SettingsItemView(item: .help)
                    SettingsItemView(item: .tellFriend)
                }
            }
            .navigationTitle("Settings")
            .searchable(text: $searchText)
            .toolbar{
                trailingNavItem()
            }
        }
    }
}

private struct SettingsHeaderView: View {
    var body: some View {
        Section{
            HStack{
                Circle()
                    .frame(width: 55, height: 55)
                
                userInfoTextView()
            }
            
            SettingsItemView(item: .avatar)
        }
    }
    
    private func userInfoTextView() -> some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Text("Alfeu Panzo Bena")
                    .font(.title2)
                
                Spacer()
                
                Image(.qrcode)
                    .renderingMode(.template)
                    .padding(5)
                    .foregroundStyle(.blue)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
            }
            
            Text("Hey there! I am using WhatsApp")
                .foregroundStyle(.gray)
                .font(.callout)
        }
        .lineLimit(1)
    }
}

extension SettingsTabScreen {
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some
        ToolbarContent {
            ToolbarItem(placement: .topBarTrailing){
                newChatButton()
        }
    }
    
    private func newChatButton() -> some View {
        Button{
            
        } label: {
            Text("Save")
        }
    }
}

#Preview {
    SettingsTabScreen()
}
