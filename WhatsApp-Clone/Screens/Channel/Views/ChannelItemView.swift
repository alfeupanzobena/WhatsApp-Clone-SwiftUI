//
//  ChannelItemView.swift
//  WhatsApp-Clone
//
//  Created by Alfeu Panzo Bena on 26/12/24.
//

import SwiftUI

struct ChannelItemView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Circle()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading, spacing: 3){
                titleTextView()
                lastMessagePreview()
            }
        }
    }
    
    private func titleTextView() -> some View {
        HStack{
            Text("Alfeu")
                .lineLimit(1)
                .bold()
            
            Spacer()
            
            Text("5:50 PM")
                .foregroundStyle(.gray)
                .font(.system(size: 15))
        }
    }
    
    private func lastMessagePreview() -> some View {
        Text("Hey welcome")
            .foregroundStyle(.gray)
            .lineLimit(2)
            .font(.system(size: 16))
    }
}

#Preview {
    ChannelItemView()
}
