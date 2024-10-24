//
//  File.swift
//  
//
//  Created by akhil kakarla on 9/1/24.
//

import Fluent
import Vapor

struct TrafficIncidentsDTO: Content {
    
    var id: UUID?
    var traffic_report_id: String?
    var published_date: String?
    var issue_reported: String?
    var location: String?
    var latitude: Double?
    var longitude: Double?
    var address: String?
    var status: String?
    var status_date: String?
    var agency: String?
    

    
    func toModel() -> TrafficIncidents {
        let model = TrafficIncidents()
        model.id = self.id
        
        if self.traffic_report_id != nil {
            model.traffic_report_id = self.traffic_report_id!
        }
        
        if self.published_date != nil {
            model.published_date = self.published_date!
        }
        
        if self.issue_reported != nil {
            model.issue_reported = self.issue_reported!
        }
        
        if self.location != nil {
            model.location = self.location!
        }
        
        if self.latitude != nil {
            model.latitude = self.latitude!
        }
        
        if self.longitude != nil {
            model.longitude = self.longitude!
        }
        
        if self.address != nil {
            model.address = self.address!
        }
        
        if self.status != nil {
            model.status = self.status!
        }
        
        if self.status_date != nil {
            model.status_date = self.status_date!
        }
        
        if self.agency != nil {
            model.agency = self.agency!
        }
        return model
    }
}

