import Foundation
import Fluent
import Vapor
import FluentPostgresDriver
extension FireModel: Content { }
extension Camera: Content { }
extension RoadClosures: Content { }
extension RoadConditions: Content { }
extension TrafficIncidents: Content { }
extension Construction: Content { }


func routes(_ app: Application) throws {
    

    /*
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    try app.register(collection: TodoController())
     */
    
    
    // students table
/*    app.get("students") { req in
        Student.query(on: req.db).all()
    }
    
    app.post("students") { req -> EventLoopFuture<Student> in
        
        let student = try req.content.decode(Student.self)
        return student.create(on: req.db).map {student}
    }
*/
    
    //**********************************************************
    // fireincidents table
    app.get("fireincidents") { req in
        FireModel.query(on: req.db).all()
    }
    
    app.post("fireincidents") { req -> EventLoopFuture<FireModel> in
        let fire = try req.content.decode(FireModel.self)
        return fire.create(on: req.db).map {fire}
    }	
    
    //**********************************************************
    

    // Construction table
    app.get("construction") { req in
        Construction.query(on: req.db).limit(50).all()
    }
    
    // Cameras table
    app.get("cameras") { req in
        Camera.query(on: req.db).all()
    }
    
    // Traffic Incidents table
    app.get("trafficincidents") { req in
        TrafficIncidents.query(on: req.db).filter("status", .equal, "ACTIVE").all()
    }
    
    // Road Closures table
    app.get("roadclosures") { req in
        RoadClosures.query(on: req.db).limit(50).all()
    }
    
    // Road Conditions table
    app.get("roadconditions") { req in
        RoadConditions.query(on: req.db).limit(3).all()
    }
}
