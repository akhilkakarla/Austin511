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
final class RoadConditions: Model, @unchecked Sendable {
    
    static let schema = "road_conditions"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "road_id")
    var road_id: String?
    
    @Field(key: "sensor_id")
    var sensor_id: String?
    
    @Field(key: "location_name")
    var location_name: String?
    
    @Field(key: "location")
    var location: String?
    
    @Field(key: "timestamp")
    var timestamp: String?
    
    @Field(key: "voltage_y")
    var voltage_y: String?
    
    @Field(key: "voltage_x")
    var voltage_x: String?
    
    @Field(key: "voltage_ratio")
    var voltage_ratio: String?
    
    @Field(key: "air_temp_secondary")
    var air_temp_secondary: String?
    
    @Field(key: "temp_surface")
    var temp_surface: String?
    
    @Field(key: "condition_code_displayed")
    var condition_code_displayed: String?
    
    @Field(key: "condition_code_measured")
    var condition_code_measured: String?
    
    @Field(key: "condition_text_displayed")
    var condition_text_displayed: String?
    
    @Field(key: "condition_text_measured")
    var condition_text_measured: String?
    
    @Field(key: "friction_code_displayed")
    var friction_code_displayed: String?
    
    @Field(key: "friction_code_measured")
    var friction_code_measured: String?
    
    @Field(key: "friction_value_displayed")
    var friction_value_displayed: String?
    
    @Field(key: "friction_value_measured")
    var friction_value_measured: String?
    
    @Field(key: "dirty_lens_score")
    var dirty_lens_score: String?
    
    @Field(key: "grip_text")
    var grip_text: String?
    
    @Field(key: "relative_humidity")
    var relative_humidity: String?
    
    @Field(key: "air_temp_primary")
    var air_temp_primary: String?
    
    @Field(key: "air_temp_tertiary")
    var air_temp_tertiary: String?
    
    @Field(key: "status_code")
    var status_code: String?

    init() { }

    init(
     id: UUID? = nil,
     road_id: String? = nil,
     sensor_id: String? = nil,
     location_name: String? = nil,
     location: String? = nil,
     timestamp: String? = nil,
     voltage_y: String? = nil,
     voltage_x: String? = nil,
     voltage_ratio: String? = nil,
     air_temp_secondary: String? = nil,
     temp_surface: String? = nil,
     condition_code_displayed: String? = nil,
     condition_code_measured: String? = nil,
     condition_text_displayed: String? = nil,
     condition_text_measured: String? = nil,
     friction_code_displayed: String? = nil,
     friction_code_measured: String? = nil,
     friction_value_displayed: String? = nil,
     friction_value_measured: String? = nil,
     dirty_lens_score: String? = nil,
     grip_text: String? = nil,
     relative_humidity: String? = nil,
     air_temp_primary: String? = nil,
     air_temp_tertiary: String? = nil,
     status_code: String? = nil
) {
        self.id = id
        self.road_id = road_id!
        self.sensor_id = sensor_id!
        self.location_name = location_name!
        self.location = location!
        self.timestamp = timestamp!
        self.voltage_y = voltage_y!
        self.voltage_x = voltage_x!
        self.voltage_ratio = voltage_ratio!
        self.air_temp_secondary = air_temp_secondary!
        self.temp_surface = temp_surface!
        self.condition_code_displayed = condition_code_displayed!
        self.condition_code_measured = condition_code_measured!
        self.condition_text_displayed = condition_text_displayed!
        self.condition_text_measured = condition_text_measured!
        self.friction_code_displayed = friction_code_displayed!
        self.friction_code_measured = friction_code_measured!
        self.friction_value_displayed = friction_value_displayed!
        self.friction_value_measured = friction_value_measured!
        self.dirty_lens_score = dirty_lens_score!
        self.grip_text = grip_text!
        self.relative_humidity = relative_humidity!
        self.air_temp_primary = air_temp_primary!
        self.air_temp_tertiary = air_temp_tertiary!
        self.status_code = status_code!
    }
    
    
    
    func toDTO() -> RoadConditionsDTO {
        .init(
            id: self.id,
            road_id: self.road_id,
            sensor_id: self.sensor_id,
            location_name: self.location_name,
            location: self.location,
            timestamp: self.timestamp,
            voltage_y: self.voltage_y,
            voltage_x: self.voltage_x,
            voltage_ratio: self.voltage_ratio,
            air_temp_secondary: self.air_temp_secondary,
            temp_surface: self.temp_surface,
            condition_code_displayed: self.condition_code_displayed,
            condition_code_measured: self.condition_code_measured,
            condition_text_displayed: self.condition_text_displayed,
            condition_text_measured: self.condition_text_measured,
            friction_code_displayed: self.friction_code_displayed,
            friction_code_measured: self.friction_code_measured,
            friction_value_displayed: self.friction_value_displayed,
            friction_value_measured: self.friction_value_measured,
            dirty_lens_score: self.dirty_lens_score,
            grip_text: self.grip_text,
            relative_humidity: self.relative_humidity,
            air_temp_primary: self.air_temp_primary,
            air_temp_tertiary: self.air_temp_tertiary
        )
    }
}

