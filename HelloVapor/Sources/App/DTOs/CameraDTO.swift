//
//  File.swift
//  
//
//  Created by akhil kakarla on 8/25/24.
//

import Fluent
import Vapor

struct CameraDTO: Content {
    
    var id: UUID?
    var cameraid: String?
    var locationname: String?
    var camerastatus: String?
    var turnondate: String?
    var cameramanufacturer: String?
    var atdlocationid: String?
    var landmark: String?
    var signalengineerarea: String?
    var councildistrict: String?
    var jurisdiction: String?
    var locationtype: String?
    var primarystsegmentid: String?
    var crossstsegmentid: String?
    var primarystreetblock: String?
    var primarystreet: String?
    var primary_st_aka: String?
    var crossstreetblock: String?
    var crossstreet: String?
    var cross_st_aka: String?
    var coaintersectionid: String?
    var modifieddate: String?
    var publishedscreenshots: String?
    var screenshotaddress: String?
    var funding: String?
    var camid: String?
    var coordinates: String?
    
    func toModel() -> Camera {
        let model = Camera()
        model.id = self.id
        
        if self.cameraid != nil {
            model.cameraid = self.cameraid!
        }
        
        if self.locationname != nil {
            model.locationname = self.locationname!
        }
        
        if self.camerastatus != nil {
            model.camerastatus = self.camerastatus!
        }
        
        if self.turnondate != nil {
            model.turnondate = self.turnondate!
        }
        
        if self.cameramanufacturer != nil {
            model.cameramanufacturer = self.cameramanufacturer!
        }
        
        if self.atdlocationid != nil {
            model.atdlocationid = self.atdlocationid!
        }
        
        if self.landmark != nil {
            model.landmark = self.landmark!
        }
        
        if self.signalengineerarea != nil {
            model.signalengineerarea = self.signalengineerarea!
        }
        
        if self.councildistrict != nil {
            model.councildistrict = self.councildistrict!
        }
        
        if self.jurisdiction != nil {
            model.jurisdiction = self.jurisdiction!
        }
        
        if self.locationtype != nil {
            model.locationtype = self.locationtype!
        }
        
        if self.primarystsegmentid != nil {
            model.primarystsegmentid = self.primarystsegmentid!
        }
        
        if self.crossstsegmentid != nil {
            model.crossstsegmentid = self.crossstsegmentid!
        }
        
        if self.primarystreetblock != nil {
            model.primarystreetblock = self.primarystreetblock!
        }
        
        if self.primarystreet != nil {
            model.primarystreet = self.primarystreet!
        }
        
        if self.primary_st_aka != nil {
            model.primary_st_aka = self.primary_st_aka!
        }
        
        if self.crossstreetblock != nil {
            model.crossstreetblock = self.crossstreetblock!
        }
        
        if self.crossstreet != nil {
            model.crossstreet = self.crossstreet!
        }
        
        if self.cross_st_aka != nil {
            model.cross_st_aka = self.cross_st_aka!
        }
        
        if self.coaintersectionid != nil {
            model.coaintersectionid = self.coaintersectionid!
        }
        
        if self.modifieddate != nil {
            model.modifieddate = self.modifieddate!
        }
        
        if self.publishedscreenshots != nil {
            model.publishedscreenshots = self.publishedscreenshots!
        }
        
        if self.screenshotaddress != nil {
            model.screenshotaddress = self.screenshotaddress!
        }
        
        if self.funding != nil {
            model.funding = self.funding!
        }
        
        if self.camid != nil {
            model.camid = self.camid!
        }
        
        if self.coordinates != nil {
            model.coordinates = self.coordinates!
        }

        return model
    }
}
