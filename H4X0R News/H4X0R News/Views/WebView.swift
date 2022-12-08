//
//  WebView.swift
//  H4X0R News
//
//  Created by Rachel Arruda Lima on 29/07/22.
//

import Foundation
import WebKit
import SwiftUI

//UIViewRepresentable é um protocolo
struct WebView: UIViewRepresentable{

    let urlString: String?
    //criar dois metodos delegate
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context:         UIViewRepresentableContext<WebView>) {
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
            
        }
    }

