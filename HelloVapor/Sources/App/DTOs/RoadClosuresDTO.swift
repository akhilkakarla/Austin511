//
//  File.swift
//  
//
//  Created by akhil kakarla on 9/1/24.
//

import Fluent
import Vapor

struct RoadClosuresDTO: Content {
    
    var id: UUID?
    var sr_number: String?
    var sr_type_code: String?
    var sr_description: String?
    var owning_department: String?
    var method_received: String?
    var sr_status: String?
    var status_change_date: String?
    var created_date: String?
    var last_update_date: String?
    var close_date: String?
    var sr_location: String?
    var street_number: String?
    var zip_code: String?
    var county: String?
    var state_plane_x_coordinate: String?
    var state_plane_y_coordinate: String?
    var latitude_coordinate: Double?
    var longitude_coordinate: Double?
    var latitude_longitude: String?
    var council_district: String?
    var map_page: String?
    var map_tile: String?
    var date_and_time_of_closure: String?
    var date_and_time_of_reopening: String?
    var lanes_closed: String?
    var routine_or_emergency: String?
    var permit_number: String?
    var cross_streets: String?
    var detour_information: String?
    var business_or_dept_closing_road: String?
    var name_of_business: String?
    
    
    func toModel() -> RoadClosures {
        let model = RoadClosures()
        model.id = self.id
        
        if self.sr_number != nil {
            model.sr_number = self.sr_number!
        }
        
        if self.sr_type_code != nil {
            model.sr_type_code = self.sr_type_code!
        }
        
        if self.sr_description != nil {
            model.sr_description = self.sr_description!
        }
        
        if self.owning_department != nil {
            model.owning_department = self.owning_department!
        }
        
        if self.method_received != nil {
            model.method_received = self.method_received!
        }
        
        if self.sr_status != nil {
            model.sr_status = self.sr_status!
        }
        
        if self.status_change_date != nil {
            model.status_change_date = self.status_change_date!
        }
        
        if self.created_date != nil {
            model.created_date = self.created_date!
        }
        
        if self.last_update_date != nil {
            model.last_update_date = self.last_update_date!
        }
        
        if self.close_date != nil {
            model.close_date = self.close_date!
        }
        
        if self.sr_location != nil {
            model.sr_location = self.sr_location!
        }
        
        if self.street_number != nil {
            model.street_number = self.street_number!
        }
        
        if self.zip_code != nil {
            model.zip_code = self.zip_code!
        }
        
        if self.county != nil {
            model.county = self.county!
        }
        
        if self.state_plane_x_coordinate != nil {
            model.state_plane_x_coordinate = self.state_plane_x_coordinate!
        }
        
        if self.state_plane_y_coordinate != nil {
            model.state_plane_y_coordinate = self.state_plane_y_coordinate!
        }
        
        if self.latitude_coordinate != nil {
            model.latitude_coordinate = self.latitude_coordinate!
        }
        
        if self.longitude_coordinate != nil {
            model.longitude_coordinate = self.longitude_coordinate!
        }
        
        if self.latitude_longitude != nil {
            model.latitude_longitude = self.latitude_longitude!
        }
        
        if self.council_district != nil {
            model.council_district = self.council_district!
        }
        
        if self.map_page != nil {
            model.map_page = self.map_page!
        }
        
        if self.map_tile != nil {
            model.map_tile = self.map_tile!
        }
        
        if self.date_and_time_of_closure != nil {
            model.date_and_time_of_closure = self.date_and_time_of_closure!
        }
        
        if self.date_and_time_of_reopening != nil {
            model.date_and_time_of_reopening = self.date_and_time_of_reopening!
        }
        
        if self.lanes_closed != nil {
            model.lanes_closed = self.lanes_closed!
        }
        
        if self.routine_or_emergency != nil {
            model.routine_or_emergency = self.routine_or_emergency!
        }
        
        if self.permit_number != nil {
            model.permit_number = self.permit_number!
        }
        
        if self.cross_streets != nil {
            model.cross_streets = self.cross_streets!
        }
        
        if self.detour_information != nil {
            model.detour_information = self.detour_information!
        }
        
        if self.business_or_dept_closing_road != nil {
            model.business_or_dept_closing_road = self.business_or_dept_closing_road!
        }
        
        if self.name_of_business != nil {
            model.name_of_business = self.name_of_business!
        }

        return model
    }
}
