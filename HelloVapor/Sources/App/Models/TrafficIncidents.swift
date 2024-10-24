//
//  File.swift
//  
//
//  Created by akhil kakarla on 9/1/24.
//

import Foundation
import Fluent
import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class TrafficIncidents: Model, @unchecked Sendable {
    
    static let schema = "traffic_incidents"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "traffic_report_id")
    var traffic_report_id: String?
    
    @Field(key: "published_date")
    var published_date: String?
    
    @Field(key: "issue_reported")
    var issue_reported: String?
    
    @Field(key: "location")
    var location: String?
    
    @Field(key: "latitude")
    var latitude: Double?
    
    @Field(key: "longitude")
    var longitude: Double?
    
    @Field(key: "address")
    var address: String?
    
    @Field(key: "status")
    var status: String?
    
    @Field(key: "status_date")
    var status_date: String?
    
    @Field(key: "agency")
    var agency: String?

    init() { }

    init(id: UUID? = nil,
     traffic_report_id: String? = nil,
     published_date: String? = nil,
     issue_reported: String? = nil,
     location: String? = nil,
     latitude: Double? = nil,
     longitude: Double? = nil,
     address: String? = nil,
     status: String? = nil,
     status_date: String? = nil,
     agency: String? = nil
) {
        self.id = id
        self.traffic_report_id = traffic_report_id!
        self.published_date = published_date!
        self.issue_reported = issue_reported!
        self.location = location!
        self.latitude = latitude!
        self.longitude = longitude!
        self.address = address!
        self.status = status!
        self.status_date = status_date!
        self.agency = agency!
    }
    
    
    
    func toDTO() -> TrafficIncidentsDTO {
        .init(
            id: self.id,
            traffic_report_id: self.traffic_report_id,
            published_date: self.published_date,
            issue_reported: self.issue_reported,
            location: self.location,
            latitude: self.latitude,
            longitude: self.longitude,
            address: self.address,
            status: self.status,
            status_date: self.status_date,
            agency: self.agency
        )
    }
}

