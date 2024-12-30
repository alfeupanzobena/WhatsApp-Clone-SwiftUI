//
//  CallsTabScreen.swift
//  WhatsApp-Clone
//
//  Created by Alfeu Panzo Bena on 26/12/24.
//

import SwiftUI

struct CallsTabScreen: View {
    
    @State private var searchText = ""
    @State private var callHistory = CallHistory.all
    
    var body: some View {
            NavigationStack {
                List {
                    Section{
                        CreateCallLinkSection()
                    }
                    
                    Section{
                        ForEach(0..<12) {_ in
                            RecentCallItemView()
                        }
                    } header: {
                        Text("Recent")
                            .textCase(nil)
                            .font(.headline)
                            .bold()
                            .foregroundStyle(.whatsAppBlack)
                    }
                }
                .navigationTitle("Calls")
                .searchable(text: $searchText)
                .toolbar{
                    leadingNavItem()
                    trailingNavItem()
                    PrincipalNavItem()
                }
            }
    }
}

extension CallsTabScreen {
    
    @ToolbarContentBuilder
    private func leadingNavItem() -> some
        ToolbarContent {
            ToolbarItem(placement: .topBarLeading){
                Button("Edit") { }
        }
    }
    
    @ToolbarContentBuilder
    private func PrincipalNavItem() -> some
        ToolbarContent {
            ToolbarItem(placement: .principal){
                Picker("", selection: $callHistory) {
                    ForEach(CallHistory.allCases) {item in
                        Text(item.rawValue.capitalized)
                            .tag(item)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: 150)
        }
    }
    
    private enum CallHistory: String, CaseIterable, Identifiable {
        case all, missed
        
        var id: String {
            return rawValue
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some
        ToolbarContent {
            ToolbarItem(placement: .topBarTrailing){
                Button{
                    
                } label: {
                    Image(systemName: "phone.arrow.up.right")
                }
        }
    }
}

private struct CreateCallLinkSection: View {
    var body: some View {
        HStack{
            Image(systemName: "link")
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(Circle())
                .foregroundColor(Color(.blue))
            
            VStack(alignment: .leading){
                Text("Create Call Link")
                    .font(.headline)
                    .foregroundStyle(.blue)
                
                Text("Share a link for your WhatsApp call")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

private struct RecentCallItemView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 45, height: 45)
            
            recentCallsTextView()
            
            Spacer()
            
            Text("Yesterday")
                .font(.system(size: 16))
                .foregroundStyle(.gray)
            
            Image(systemName: "info.circle")
        }
    }
    
    private func recentCallsTextView() -> some View {
        VStack(alignment: .leading){
            Text("John Smith")
            
            HStack(spacing: 5) {
                Image(systemName: "phone.arrow.up.right.fill")
                Text("Outgoing")
            }
            .font(.system(size: 14))
            .foregroundStyle(.gray)
        }
    }
}

#Preview {
    CallsTabScreen()
}
