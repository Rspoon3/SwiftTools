//
//  MKCoordinateRegion+Extension.swift
//  EZMaxRequest
//
//  Created by Richard Witherspoon on 7/16/20.
//  Copyright © 2020 InterPro Solutions, LLC. All rights reserved.
//

import MapKit

public extension MKCoordinateRegion {
    
    struct BoundingBox{
        public var topLeft:     CLLocationCoordinate2D
        public var bottomRight: CLLocationCoordinate2D
        public var bottomLeft:  CLLocationCoordinate2D
        public var topRight:    CLLocationCoordinate2D
    }

    var boundingBoxCoordinates: BoundingBox {
        let halfLatDelta = self.span.latitudeDelta / 2
        let halfLngDelta = self.span.longitudeDelta / 2

        let topLeftCoord = CLLocationCoordinate2D(
            latitude: self.center.latitude + halfLatDelta,
            longitude: self.center.longitude - halfLngDelta
        )
        let bottomRightCoord = CLLocationCoordinate2D(
            latitude: self.center.latitude - halfLatDelta,
            longitude: self.center.longitude + halfLngDelta
        )
        let bottomLeftCoord = CLLocationCoordinate2D(
            latitude: self.center.latitude - halfLatDelta,
            longitude: self.center.longitude - halfLngDelta
        )
        let topRightCoord = CLLocationCoordinate2D(
            latitude: self.center.latitude + halfLatDelta,
            longitude: self.center.longitude + halfLngDelta
        )
        return BoundingBox(topLeft: topLeftCoord, bottomRight: bottomRightCoord, bottomLeft: bottomLeftCoord, topRight: topRightCoord)
    }
}
