//
//  SVGWebView.swift
//  hartnell map
//
//  Created by Ricardo Acosta on 3/25/26.
//

import SwiftUI
import WebKit

struct SVGWebView: UIViewRepresentable {
    var svgName: String
    var highlightRoom: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = true
        webView.scrollView.minimumZoomScale = 1.0
        webView.scrollView.maximumZoomScale = 5.0
        webView.scrollView.bouncesZoom = false
        webView.scrollView.bounces = false
        webView.scrollView.decelerationRate = .fast
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        // Only reload SVG if it changed
        if context.coordinator.loadedSVG != svgName {
            context.coordinator.loadedSVG = svgName
            if let url = Bundle.main.url(forResource: svgName, withExtension: "svg"),
               let svgContent = try? String(contentsOf: url, encoding: .utf8) {
                let html = """
                <html>
                <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
                <style>
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body { background-color: #f5f5f5; }
                    svg { width: 100%; height: 100%; touch-action: manipulation; }
                </style>
                </head>
                <body>\(svgContent)</body>
                </html>
                """
                webView.loadHTMLString(html, baseURL: nil)
            }
        } else {
            // SVG already loaded, just highlight
            if !highlightRoom.isEmpty {
                let js = """
                    // Clear all previous highlights first
                    var allRooms = document.querySelectorAll('[id$="-fill"]');
                    allRooms.forEach(function(r) {
                        r.style.fill = '#EDD380';
                    });
                    
                    // Then highlight selected room
                    var room = document.getElementById('room-\(highlightRoom)-fill');
                    if (room) { room.style.fill = '#C8102E'; }
                """
                webView.evaluateJavaScript(js)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator {
        var loadedSVG: String = ""
    }
}
