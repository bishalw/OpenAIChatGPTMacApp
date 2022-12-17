//
//  WebView.swift
//  ChatGPTMac
//
//  Created by Bishalw on 12/17/22.
//

import SwiftUI
import WebKit


struct WebView: NSViewRepresentable {
  
    
    
    typealias NSViewType = WKWebView
    let url: URL?
    
    func makeNSView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        guard let myURL = url else {
                   return
               }
        DispatchQueue.main.async {
                   let request = URLRequest(url: myURL)
                   nsView.load(request)
               }
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "https://www.google.com"))
    }
}
