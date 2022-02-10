//
//  MapView.swift
//  swift-map
//
//  Created by 後藤遥 on 2022/02/10.
//

import SwiftUI
import MapKit

// 結局このviewひとつがコンポーネントって感じか。
struct MapView: UIViewRepresentable {
    let searchKey: String
    let mapType: MKMapType

    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        uiView.mapType = mapType
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchKey,
                                      completionHandler: {
            (placemarks, error) in
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location {
                let targetCoordinate = location.coordinate
                print(targetCoordinate)
                
                let pin = MKPointAnnotation()
                pin.coordinate = targetCoordinate
                pin.title = searchKey
                uiView.addAnnotation(pin)
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinate,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0
                )
            }
        })
    }
}

// これでMapViewをプレビュー
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "スカイツリー", mapType: .standard)
    }
}
