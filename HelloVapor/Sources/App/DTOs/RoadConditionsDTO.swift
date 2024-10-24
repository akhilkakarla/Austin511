//
//  File.swift
//  
//
//  Created by akhil kakarla on 9/1/24.
//

import Fluent
import Vapor

struct RoadConditionsDTO: Content {
    
    var id: UUID?
    var road_id: String?
    var sensor_id: String?
    var location_name: String?
    var location: String?
    var timestamp: String?
    var voltage_y: String?
    var voltage_x: String?
    var voltage_ratio: String?
    var air_temp_secondary: String?
    var temp_surface: String?
    var condition_code_displayed: String?
    var condition_code_measured: String?
    var condition_text_displayed: String?
    var condition_text_measured: String?
    var friction_code_displayed: String?
    var friction_code_measured: String?
    var friction_value_displayed: String?
    var friction_value_measured: String?
    var dirty_lens_score: String?
    var grip_text: String?
    var relative_humidity: String?
    var air_temp_primary: String?
    var air_temp_tertiary: String?
    var status_code: String?
    

    
    func toModel() -> RoadConditions {
        let model = RoadConditions()
        model.id = self.id
        
        if self.road_id != nil {
            model.road_id = self.road_id!
        }
        
        if self.sensor_id != nil {
            model.sensor_id = self.sensor_id!
        }
        
        if self.location_name != nil {
            model.location_name = self.location_name!
        }
        
        if self.location != nil {
            model.location = self.location!
        }
        
        if self.timestamp != nil {
            model.timestamp = self.timestamp!
        }
        
        if self.voltage_y != nil {
            model.voltage_y = self.voltage_y!
        }
        
        if self.voltage_x != nil {
            model.voltage_x = self.voltage_x!
        }
        
        if self.voltage_ratio != nil {
            model.voltage_ratio = self.voltage_ratio!
        }
        
        if self.air_temp_secondary != nil {
            model.air_temp_secondary = self.air_temp_secondary!
        }
        
        if self.temp_surface != nil {
            model.temp_surface = self.temp_surface!
        }
        
        if self.condition_code_displayed != nil {
            model.condition_code_displayed = self.condition_code_displayed!
        }
        
        if self.condition_code_measured != nil {
            model.condition_code_measured = self.condition_code_measured!
        }
        
        if self.condition_text_displayed != nil {
            model.condition_text_displayed = self.condition_text_displayed!
        }
        
        if self.condition_text_measured != nil {
            model.condition_text_measured = self.condition_text_measured!
        }
        
        if self.friction_code_displayed != nil {
            model.friction_code_displayed = self.friction_code_displayed!
        }
        
        if self.friction_code_measured != nil {
            model.friction_code_measured = self.friction_code_measured!
        }
        
        if self.friction_value_displayed != nil {
            model.friction_value_displayed = self.friction_value_displayed!
        }
        
        if self.friction_value_measured != nil {
            model.friction_value_measured = self.friction_value_measured!
        }
        
        if self.dirty_lens_score != nil {
            model.dirty_lens_score = self.dirty_lens_score!
        }
        
        if self.grip_text != nil {
            model.grip_text = self.grip_text!
        }
        
        if self.relative_humidity != nil {
            model.relative_humidity = self.relative_humidity!
        }
        
        if self.air_temp_primary != nil {
            model.air_temp_primary = self.air_temp_primary!
        }
        
        if self.air_temp_tertiary != nil {
            model.air_temp_tertiary = self.air_temp_tertiary!
        }
        
        if self.status_code != nil {
            model.status_code = self.status_code!
        }

        return model
    }
}

