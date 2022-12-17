//
//  ChatGPTView.swift
//  ChatGPTMac
//
//  Created by Bishalw on 12/17/22.
//

import SwiftUI

struct ChatGPTView: View {
    @State private var reloadWebView = false
    var body: some View {
        VStack{
            Button(action: {
                self.reloadWebView = true
            }, label: {
                HStack{
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 15))
                    Text("Refresh")
                        .font(.system(size: 15))
                }

            })
            .buttonStyle(.borderless)
            .frame(maxWidth: .infinity)
            .padding(10)
            WebView(url: URL(
                string:"https://chat.openai.com/chat")).frame(width: 450, height: 700)
        }.onAppear{
            self.reloadWebView = false
        }.id(self.reloadWebView)
        
    }
}

struct ChatGPTView_Previews: PreviewProvider {
    static var previews: some View {
        ChatGPTView()
    }
}
