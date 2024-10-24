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
final class RoadClosures: Model, @unchecked Sendable {
    
    static let schema = "lane_and_road_closures"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "sr_number")
    var sr_number: String?
    
    @Field(key: "sr_type_code")
    var sr_type_code: String?
    
    @Field(key: "sr_description")
    var sr_description: String?
    
    @Field(key: "owning_department")
    var owning_department: String?
    
    @Field(key: "method_received")
    var method_received: String?
    
    @Field(key: "sr_status")
    var sr_status: String?
    
    @Field(key: "status_change_date")
    var status_change_date: String?
    
    @Field(key: "created_date")
    var created_date: String?
    
    @Field(key: "last_update_date")
    var last_update_date: String?
    
    @Field(key: "close_date")
    var close_date: String?
    
    @Field(key: "sr_location")
    var sr_location: String?
    
    @Field(key: "street_number")
    var street_number: String?
    
    @Field(key: "zip_code")
    var zip_code: String?
    
    @Field(key: "county")
    var county: String?
    
    @Field(key: "state_plane_x_coordinate")
    var state_plane_x_coordinate: String?
    
    @Field(key: "state_plane_y_coordinate")
    var state_plane_y_coordinate: String?
    
    @Field(key: "latitude_coordinate")
    var latitude_coordinate: Double?
    
    @Field(key: "longitude_coordinate")
    var longitude_coordinate: Double?
    
    @Field(key: "latitude_longitude")
    var latitude_longitude: String?
    
    @Field(key: "council_district")
    var council_district: String?
    
    @Field(key: "map_page")
    var map_page: String?
    
    @Field(key: "map_tile")
    var map_tile: String?
    
    @Field(key: "date_and_time_of_closure")
    var date_and_time_of_closure: String?
    
    @Field(key: "date_and_time_of_reopening")
    var date_and_time_of_reopening: String?
    
    @Field(key: "lanes_closed")
    var lanes_closed: String?
    
    @Field(key: "routine_or_emergency")
    var routine_or_emergency: String?
    
    @Field(key: "permit_number")
    var permit_number: String?
    
    @Field(key: "cross_streets")
    var cross_streets: String?
    
    @Field(key: "detour_information")
    var detour_information: String?
    
    @Field(key: "business_or_dept_closing_road")
    var business_or_dept_closing_road: String?
    
    @Field(key: "name_of_business")
    var name_of_business: String?
    
    init() { }

    init(id: UUID? = nil,
     sr_number: String? = nil,
     sr_type_code: String? = nil,
     sr_description: String? = nil,
     owning_department: String? = nil,
     method_received: String? = nil,
     sr_status: String? = nil,
     status_change_date: String? = nil,
     created_date: String? = nil,
     last_update_date: String? = nil,
     close_date: String? = nil,
     sr_location: String? = nil,
     street_number: String? = nil,
     zip_code: String? = nil,
     county: String? = nil,
     state_plane_x_coordinate: String? = nil,
     state_plane_y_coordinate: String? = nil,
     latitude_coordinate: Double? = nil,
     longitude_coordinate: Double? = nil,
     latitude_longitude: String? = nil,
     council_district: String? = nil,
     map_page: String? = nil,
     map_tile: String? = nil,
     date_and_time_of_closure: String? = nil,
     date_and_time_of_reopening: String? = nil,
     lanes_closed: String? = nil,
     routine_or_emergency: String? = nil,
     permit_number: String? = nil,
     cross_streets: String? = nil,
     detour_information: String? = nil,
     business_or_dept_closing_road: String? = nil,
     name_of_business: String? = nil

) {
        self.id = id
        self.sr_number = sr_number!
        self.sr_type_code = sr_type_code!
        self.sr_description = sr_description!
        self.owning_department = owning_department!
        self.method_received = method_received!
        self.sr_status = sr_status!
        self.status_change_date = status_change_date!
        self.created_date = created_date!
        self.last_update_date = last_update_date!
        self.close_date = close_date!
        self.sr_location = sr_location!
        self.street_number = street_number!
        self.zip_code = zip_code!
        self.county = county!
        self.state_plane_x_coordinate = state_plane_x_coordinate!
        self.state_plane_y_coordinate = state_plane_y_coordinate!
        self.latitude_coordinate = latitude_coordinate!
        self.longitude_coordinate = longitude_coordinate!
        self.latitude_longitude = latitude_longitude!
        self.council_district = council_district!
        self.map_page = map_page!
        self.map_tile = map_tile!
        self.date_and_time_of_closure = date_and_time_of_closure!
        self.date_and_time_of_reopening = date_and_time_of_reopening!
        self.lanes_closed = lanes_closed!
        self.routine_or_emergency = routine_or_emergency!
        self.permit_number = permit_number!
        self.cross_streets = cross_streets!
        self.detour_information = detour_information!
        self.business_or_dept_closing_road = business_or_dept_closing_road!
        self.name_of_business = name_of_business!
    }
    
    
    
    func toDTO() -> RoadClosuresDTO {
        .init(
            id: self.id,
            sr_number: self.sr_number,
            sr_type_code: self.sr_type_code,
            sr_description: self.sr_description,
            owning_department: self.owning_department,
            method_received: self.method_received,
            sr_status: self.sr_status,
            status_change_date: self.status_change_date,
            created_date: self.created_date,
            last_update_date: self.last_update_date,
            close_date: self.close_date,
            sr_location: self.sr_location,
            street_number: self.street_number,
            zip_code: self.zip_code,
            county: self.county,
            state_plane_x_coordinate: self.state_plane_x_coordinate,
            state_plane_y_coordinate: self.state_plane_y_coordinate,
            latitude_coordinate: self.latitude_coordinate,
            longitude_coordinate: self.longitude_coordinate,
            latitude_longitude: self.latitude_longitude,
            council_district: self.council_district,
            map_page: self.map_page,
            map_tile: self.map_tile,
            date_and_time_of_closure: self.date_and_time_of_closure,
            date_and_time_of_reopening: self.date_and_time_of_reopening,
            lanes_closed: self.lanes_closed,
            routine_or_emergency: self.routine_or_emergency,
            permit_number: self.permit_number,
            cross_streets: self.cross_streets,
            detour_information: self.detour_information,
            business_or_dept_closing_road: self.business_or_dept_closing_road,
            name_of_business: self.name_of_business
        )
    }
}
