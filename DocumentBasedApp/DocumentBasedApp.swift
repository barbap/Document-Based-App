//
//  DocumentBasedApp.swift
//  DocumentBasedApp
//
//  Created by Barbara Araujo Paim on 16/02/24.
//

import SwiftUI

@main
struct DocumentBasedApp: App {
    var body: some Scene {
        DocumentGroup (newDocument: TextFile()) { file in
            ContentView(document: file.$document)
        }
    }
}
