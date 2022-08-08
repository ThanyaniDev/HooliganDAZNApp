//
//  EventsPlayBackView.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/08.
//

import SwiftUI
import AVKit

struct EventsPlayBackView: View {
	let eventTitle: String
	let eventURL: String
	let eventSubtitle: String
	
	init(eventTitle: String,
		 eventURL: String,
		 eventSubtitle: String) {
		
		self.eventTitle = eventTitle
		self.eventURL = eventURL
		self.eventSubtitle = eventSubtitle
	}
	
	var body: some View {
		VStack {
			Text(eventTitle)
				.font(.title)
			Text(eventSubtitle)
				.font(.subheadline)
			VideoPlayer(player: AVPlayer(url: URL(string: eventURL)! ))
			Spacer()
		}
	}
}

struct EventsPlayBackView_Previews: PreviewProvider {
    static var previews: some View {
		EventsPlayBackView(eventTitle: "",
						   eventURL: "",
						   eventSubtitle: "")
    }
}


