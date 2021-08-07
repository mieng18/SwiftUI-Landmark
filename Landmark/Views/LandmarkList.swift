//
//  LandmarkList.swift
//  Landmark
//
//  Created by mai ng on 8/6/21.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly = false
    
    var filterLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        //Embed the dynamically generated list of landmarks in a NavigationView.
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filterLandmarks) {landmark in
                    //, wrap the returned row in a NavigationLink, specifying the LandmarkDetail view as the destination.
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                    
                }

                .navigationTitle("Landmarks")
            }
        }
        
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
                    LandmarkList()
//                        .previewDevice(PreviewDevice(rawValue: deviceName))
//                        .previewDisplayName(deviceName)
//                }

        
    }
}
