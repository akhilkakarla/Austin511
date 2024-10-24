//
//  File.swift
//
//
//  Created by akhil kakarla on 8/25/24.
//

import Fluent
import Vapor

struct ConstructionDTO: Content {
    
    var id: UUID?
    var type: String?
    var geometry: String?
    var event_type: String?
    var data_source_id: String?
    var road_names: String?
    var direction: String?
    var description: String?
    var start_date: String?
    var end_date: String?
    var is_start_date_verified: String?
    var is_end_date_verified: String?
    var is_start_position_verified: String?
    var is_end_position_verified: String?
    var location_method: String?
    var work_zone_type: String?
    var vehicle_impact: String?
    var folderrsn: String?
    var name: String?
    
    func toModel() -> Construction {
        let model = Construction()
        model.id = self.id
        
        if self.type != nil {
            model.type = self.type!
        }
  
        if self.geometry != nil {
            model.geometry = self.geometry!
        }
        
        if self.event_type != nil {
            model.event_type = self.event_type!
        }
        
        if self.data_source_id != nil {
            model.data_source_id = self.data_source_id!
        }
        
        if self.road_names != nil {
            model.road_names = self.road_names!
        }
        
        if self.direction != nil {
            model.direction = self.direction!
        }
        
        if self.description != nil {
            model.description = self.description!
        }
        
        if self.start_date != nil {
            model.start_date = self.start_date!
        }
        
        if self.end_date != nil {
            model.end_date = self.end_date!
        }
        
        if self.is_start_date_verified != nil {
            model.is_start_date_verified = self.is_start_date_verified!
        }
        
        if self.is_end_date_verified != nil {
            model.is_end_date_verified = self.is_end_date_verified!
        }
        
        if self.is_start_position_verified != nil {
            model.is_start_position_verified = self.is_start_position_verified!
        }
        
        if self.is_end_position_verified != nil {
            model.is_end_position_verified = self.is_end_position_verified!
        }
        
        if self.location_method != nil {
            model.location_method = self.location_method!
        }
        
        if self.work_zone_type != nil {
            model.work_zone_type = self.work_zone_type!
        }
        
        if self.vehicle_impact != nil {
            model.vehicle_impact = self.vehicle_impact!
        }
        
        if self.folderrsn != nil {
            model.folderrsn = self.folderrsn!
        }
        
        if self.name != nil {
            model.name = self.name!
        }

        return model
    }
}
