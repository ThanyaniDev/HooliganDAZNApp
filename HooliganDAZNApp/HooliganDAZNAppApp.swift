//
//  HooliganDAZNAppApp.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/07.
//

import SwiftUI

@main
struct HooliganDAZNAppApp: App {

    var body: some Scene {
        WindowGroup {
			let _ = Dependencies()
			TabView() {
				EventsView()
					.tabItem {
						Label("Events",systemImage: "calendar")
					}
				ScheduleView()
					.tabItem {
						Label("Schedule",systemImage: "list.dash")
					}
			}
        }
    }
}


