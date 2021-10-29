//
//  CLLocationCoordinate2D+Extension.swift
//  EZMaxRequest
//
//  Created by Richard Witherspoon on 6/17/20.
//  Copyright © 2020 InterPro Solutions, LLC. All rights reserved.
//

import MapKit

extension CLLocationCoordinate2D : Equatable{
    public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
    public static let boston = CLLocationCoordinate2D(latitude: 42.3601, longitude: -71.0589)
    public static let nyc = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
    public static let nashua = CLLocationCoordinate2D(latitude: 42.746429087352105, longitude: -71.49995857870427)
    public static let london = CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278)
    public static let cupertino = CLLocationCoordinate2D(latitude: 37.3230, longitude: -122.0322)
}
