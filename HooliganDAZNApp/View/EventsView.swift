//
//  EventsView.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/07.
//

import SwiftUI

struct EventsView: View {
	@ObservedObject var viewModel = EventsViewModel()
	let imageSize: CGFloat = 50
	
    var body: some View {
		NavigationView {
			List(viewModel.events, id: \.id) { events in
				NavigationLink(destination: EventsPlayBackView(eventTitle: events.title ?? "",
															   eventURL: events.videoUrl ?? "",
															   eventSubtitle: events.subtitle ?? ""))
				{
					HStack {
						AsyncImage(url: URL(string: events.imageUrl ?? "")) { phase in
							if let image = phase.image {
								image.resizable()
									.scaledToFit()
									.frame( height: imageSize)
									.clipped()
								
							} else if phase.error != nil {
								Text(phase.error?.localizedDescription ?? "error")
									.foregroundColor(Color.pink)
									.frame(width: imageSize, height: imageSize)
							} else {
								ProgressView()
									.frame(width: imageSize, height: imageSize)
							}
						}
						
						VStack{
							Text(events.title ?? "")
								.font(.system(size: 14, weight: .bold, design: .rounded))
							Text(events.subtitle ?? "")
								.font(.system(size: 12, weight: .light, design: .rounded))
							Spacer()
							Text(events.date ?? "")
								.font(.system(size: 10, weight: .ultraLight, design: .rounded))
						}
					}
				}
			}
			.onAppear {
				self.viewModel.getEvents()
			}
			.navigationTitle(Text("Events"))
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		EventsView()
    }
}
