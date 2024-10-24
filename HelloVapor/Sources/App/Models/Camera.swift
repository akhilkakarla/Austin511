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
final class Camera: Model, @unchecked Sendable {
    
    static let schema = "cameras"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "cameraid")
    var cameraid: String?
    
    @Field(key: "locationname")
    var locationname: String?
    
    @Field(key: "camerastatus")
    var camerastatus: String?
    
    @Field(key: "turnondate")
    var turnondate: String?
    
    @Field(key: "cameramanufacturer")
    var cameramanufacturer: String?
    
    @Field(key: "atdlocationid")
    var atdlocationid: String?
    
    @Field(key: "landmark")
    var landmark: String?
    
    @Field(key: "signalengineerarea")
    var signalengineerarea: String?
    
    @Field(key: "councildistrict")
    var councildistrict: String?
    
    @Field(key: "jurisdiction")
    var jurisdiction: String?
    
    @Field(key: "locationtype")
    var locationtype: String?
    
    @Field(key: "primarystsegmentid")
    var primarystsegmentid: String?
    
    @Field(key: "crossstsegmentid")
    var crossstsegmentid: String?
    
    @Field(key: "primarystreetblock")
    var primarystreetblock: String?
    
    @Field(key: "primarystreet")
    var primarystreet: String?
    
    @Field(key: "primary_st_aka")
    var primary_st_aka: String?
    
    @Field(key: "crossstreetblock")
    var crossstreetblock: String?
    
    @Field(key: "crossstreet")
    var crossstreet: String?
    
    @Field(key: "cross_st_aka")
    var cross_st_aka: String?
    
    @Field(key: "coaintersectionid")
    var coaintersectionid: String?
    
    @Field(key: "modifieddate")
    var modifieddate: String?
    
    @Field(key: "publishedscreenshots")
    var publishedscreenshots: String?
    
    @Field(key: "screenshotaddress")
    var screenshotaddress: String?
    
    @Field(key: "funding")
    var funding: String?
    
    @Field(key: "camid")
    var camid: String?
    
    @Field(key: "coordinates")
    var coordinates: String?
    
    
    init() { }

    init(id: UUID? = nil,
        cameraid: String? = nil,
        locationname: String? = nil,
        camerastatus: String? = nil,
        turnondate: String? = nil,
        cameramanufacturer: String? = nil,
        atdlocationid: String? = nil,
        landmark: String? = nil,
        signalengineerarea: String? = nil,
        councildistrict: String? = nil,
        jurisdiction: String? = nil,
        locationtype: String? = nil,
        primarystsegmentid: String? = nil,
        crossstsegmentid: String? = nil,
        primarystreetblock: String? = nil,
        primarystreet: String? = nil,
        primary_st_aka: String? = nil,
        crossstreetblock: String? = nil,
        crossstreet: String? = nil,
        cross_st_aka: String? = nil,
        coaintersectionid: String? = nil,
        modifieddate: String? = nil,
        publishedscreenshots: String? = nil,
        screenshotaddress: String? = nil,
        funding: String? = nil,
        camid: String? = nil,
        coordinates: String? = nil
         
) {
        self.id = id
        self.cameraid = cameraid!
        self.locationname = locationname!
        self.camerastatus = camerastatus!
        self.turnondate = turnondate!
        self.cameramanufacturer = cameramanufacturer!
        self.atdlocationid = atdlocationid!
        self.landmark = landmark!
        self.signalengineerarea = signalengineerarea!
        self.councildistrict = councildistrict!
        self.jurisdiction = jurisdiction!
        self.locationtype = locationtype!
        self.primarystsegmentid = primarystsegmentid!
        self.crossstsegmentid = crossstsegmentid!
        self.primarystreetblock = primarystreetblock!
        self.primarystreet = primarystreet!
        self.primary_st_aka = primary_st_aka!
        self.crossstreetblock = crossstreetblock!
        self.crossstreet = crossstreet!
        self.cross_st_aka = cross_st_aka!
        self.coaintersectionid = coaintersectionid!
        self.modifieddate = modifieddate!
        self.publishedscreenshots = publishedscreenshots!
        self.screenshotaddress = screenshotaddress!
        self.funding = funding!
        self.camid = camid!
        self.coordinates = coordinates!
        
    }
    
    
    
    func toDTO() -> CameraDTO {
        .init(
            id: self.id,
            cameraid: self.cameraid,
            locationname: self.locationname,
            camerastatus: self.camerastatus,
            turnondate: self.turnondate,
            cameramanufacturer: self.cameramanufacturer,
            atdlocationid: self.atdlocationid,
            landmark: self.landmark,
            signalengineerarea: self.signalengineerarea,
            councildistrict: self.councildistrict,
            jurisdiction: self.jurisdiction,
            locationtype: self.locationtype,
            primarystsegmentid: self.primarystsegmentid,
            crossstsegmentid: self.crossstsegmentid,
            primarystreetblock: self.primarystreetblock,
            primarystreet: self.primarystreet,
            primary_st_aka: self.primary_st_aka,
            crossstreetblock: self.crossstreetblock,
            crossstreet: self.crossstreet,
            cross_st_aka: self.cross_st_aka,
            coaintersectionid: self.coaintersectionid,
            modifieddate: self.modifieddate,
            publishedscreenshots: self.publishedscreenshots,
            screenshotaddress: self.screenshotaddress,
            funding: self.funding,
            camid: self.camid,
            coordinates: self.coordinates
        )
    }
}
