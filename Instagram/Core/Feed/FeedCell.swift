//
//  FeedCell.swift
//  Instagram
//
//  Created by Almaty on 01.07.2025.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("timothy")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("batman")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            } // Image + Username
            .padding(.leading, 8)
            Image("jsoundo")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bubble.right")
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                    }
                } // Action buttons
                
                Text("23 likes")
                    .fontWeight(.semibold)
                
                HStack {
                    Text("batman ").fontWeight(.semibold) + 
                    Text("This is some caption for now")
                }
                
                Text("6h ago")
                    .foregroundStyle(.secondary)
                    
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            .padding(.top, 4)
            
        }
    }
}

#Preview {
    FeedCell()
}
