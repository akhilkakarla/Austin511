//
//  File.swift
//
//
//  Created by akhil kakarla on 8/25/24.
//

import Foundation
import Fluent
import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class Construction: Model, @unchecked Sendable {
    
    static let schema = "construction"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "type")
    var type: String?
    
    @Field(key: "geometry")
    var geometry: String?
    
    @Field(key: "event_type")
    var event_type: String?
    
    @Field(key: "data_source_id")
    var data_source_id: String?
    
    @Field(key: "road_names")
    var road_names: String?
    
    @Field(key: "direction")
    var direction: String?
    
    @Field(key: "description")
    var description: String?
    
    @Field(key: "start_date")
    var start_date: String?
    
    @Field(key: "end_date")
    var end_date: String?
    
    @Field(key: "is_start_date_verified")
    var is_start_date_verified: String?
    
    @Field(key: "is_end_date_verified")
    var is_end_date_verified: String?
    
    @Field(key: "is_start_position_verified")
    var is_start_position_verified: String?
    
    @Field(key: "is_end_position_verified")
    var is_end_position_verified: String?
    
    @Field(key: "location_method")
    var location_method: String?
    
    @Field(key: "work_zone_type")
    var work_zone_type: String?
    
    @Field(key: "vehicle_impact")
    var vehicle_impact: String?

    @Field(key: "folderrsn")
    var folderrsn: String?
    
    @Field(key: "name")
    var name: String?
    
    
    init() { }

    init(id: UUID? = nil,
         type: String? = nil,
         geometry: String? = nil,
         event_type: String? = nil,
         data_source_id: String? = nil,
         road_names: String? = nil,
         direction: String? = nil,
         description: String? = nil,
         start_date: String? = nil,
         end_date: String? = nil,
         is_start_date_verified: String? = nil,
         is_end_date_verified: String? = nil,
         is_start_position_verified: String? = nil,
         is_end_position_verified: String? = nil,
         location_method: String? = nil,
         work_zone_type: String? = nil,
         vehicle_impact: String? = nil,
         folderrsn: String? = nil,
         name: String? = nil
) {
        self.id = id
        self.type = type!
        self.geometry = geometry!
        self.event_type = event_type!
        self.data_source_id = data_source_id!
        self.road_names = road_names!
        self.direction = direction!
        self.description = description!
        self.start_date = start_date!
        self.end_date = end_date!
        self.is_start_date_verified = is_start_date_verified!
        self.is_end_date_verified = is_end_date_verified!
        self.is_start_position_verified = is_start_position_verified!
        self.is_end_position_verified = is_end_position_verified!
        self.location_method = location_method!
        self.work_zone_type = work_zone_type!
        self.vehicle_impact = vehicle_impact!
        self.folderrsn = folderrsn!
        self.name = name!
    }
    
    
    
    func toDTO() -> ConstructionDTO {
        .init(            
            id: self.id,
            type: self.type,
            geometry: self.geometry,
            event_type: self.event_type,
            data_source_id: self.data_source_id,
            road_names: self.road_names,
            direction: self.direction,
            description: self.description,
            start_date: self.start_date,
            end_date: self.end_date,
            is_start_date_verified: self.is_start_date_verified,
            is_end_date_verified: self.is_end_date_verified,
            is_start_position_verified: self.is_start_position_verified,
            is_end_position_verified: self.is_end_position_verified,
            location_method: self.location_method,
            work_zone_type: self.work_zone_type,
            vehicle_impact: self.vehicle_impact,
            folderrsn: self.folderrsn,
            name: self.name
        )
    }
}
