//
//  ReadMeApp.swift
//  ReadMe
//
//  Created by Thomas Kebschull on 1/17/21.
//

import SwiftUI

@main
struct ReadMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Library())
        }
    }
}
