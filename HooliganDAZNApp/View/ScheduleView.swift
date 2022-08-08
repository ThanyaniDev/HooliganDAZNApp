//
//  ScheduleView.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/08.
//

import SwiftUI

struct ScheduleView: View {
	@ObservedObject var viewModel = ScheduleViewModel()
	let imageSize: CGFloat = 50
	
    var body: some View {
		NavigationView {
			List(viewModel.schedule, id: \.id) { events in
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
			.navigationTitle(Text("Schedule"))
		}
		.onAppear {
			viewModel.getSchedule()
		}
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
