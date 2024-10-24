//
//  File.swift
//  
//
//  Created by akhil kakarla on 8/7/24.
//

import Fluent
import Vapor

struct FireDTO: Content {
    
    var id: UUID?
    var incidentid: String
    var yearnum: String
    var date: String
    var problem: String
    var priority: String
    

    
    func toModel() -> FireModel {
        let model = FireModel()
        model.id = self.id
        model.incidentid = self.incidentid
        model.yearnum = self.yearnum
        model.date = self.date
        model.problem = self.problem
        model.priority = self.priority
        
        return model
    }
}
