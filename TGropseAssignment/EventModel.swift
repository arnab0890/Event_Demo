// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let eventDetailsModel = try EventDetailsModel(json)

import Foundation

// MARK: - EventDetailsModel
struct EventDetailsModel: Codable {
    var error: Bool?
    var errorCode: Int?
    var message: String?
    var data: DataClass?

    enum CodingKeys: String, CodingKey {
        case error
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: EventDetailsModel convenience initializers and mutators

extension EventDetailsModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EventDetailsModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        error: Bool?? = nil,
        errorCode: Int?? = nil,
        message: String?? = nil,
        data: DataClass?? = nil
    ) -> EventDetailsModel {
        return EventDetailsModel(
            error: error ?? self.error,
            errorCode: errorCode ?? self.errorCode,
            message: message ?? self.message,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    var eventID, evUserID, evEventType, evCategoryID: String?
    var evTagID, evVenueID, evEventFee, evIsPublic: String?
    var evFeatured, evName, evNameAr, evTitle: String?
    var evTitleAr, evOrganizerName, evOrganizerID, evStartDate: String?
    var evEndDate, evStartTime, evEndTime: String?
    var evImage: [EvImage]?
    var evSeatingMapImage: [JSONAny]?
    var evVennueName, evVennueNameAr, evCountry, evRegion: String?
    var evCity, evAddress, evLat, evLong: String?
    var evGender, evAgeID, evLanguage, evImpNotes: String?
    var evImpNotesAr, evDescription, evDescriptionAr, evDetail: String?
    var evDetailAr, evEmail, evContact, evWhatsappNo: String?
    var evWebsite: String?
    var evViews, evLike, evStatus, evIsPromoted: String?
    var evPromoteCountry, evPromoteCity, evPromotedPoints, evCreatedAt: String?
    var evIsFav, categoryName, categoryColor: String?
    var eventTag: [EventTag]?
    var evUsersPoints, evCountryID, evCityID, evRegionID: String?
    var evCountryPoints, evRegionPoints, evCityPoints, evEventTypeName: String?
    var evReminder, evIsReminder, evNew, distance: String?
    var eventOrganizer: [EventOrganizer]?
    var eventSponser: [EventSponser]?
    var eventPerformer: [EventPerformer]?
    var commentCount: String?
    var comment: [Comment]?
    var viewPromotePoints, durationPromotePoints: [PromotePoint]?

    enum CodingKeys: String, CodingKey {
        case eventID = "event_id"
        case evUserID = "ev_user_id"
        case evEventType = "ev_event_type"
        case evCategoryID = "ev_category_id"
        case evTagID = "ev_tag_id"
        case evVenueID = "ev_venue_id"
        case evEventFee = "ev_event_fee"
        case evIsPublic = "ev_is_public"
        case evFeatured = "ev_featured"
        case evName = "ev_name"
        case evNameAr = "ev_name_ar"
        case evTitle = "ev_title"
        case evTitleAr = "ev_title_ar"
        case evOrganizerName = "ev_organizer_name"
        case evOrganizerID = "ev_organizer_id"
        case evStartDate = "ev_start_date"
        case evEndDate = "ev_end_date"
        case evStartTime = "ev_start_time"
        case evEndTime = "ev_end_time"
        case evImage = "ev_image"
        case evSeatingMapImage = "ev_seating_map_image"
        case evVennueName = "ev_vennue_name"
        case evVennueNameAr = "ev_vennue_name_ar"
        case evCountry = "ev_country"
        case evRegion = "ev_region"
        case evCity = "ev_city"
        case evAddress = "ev_address"
        case evLat = "ev_lat"
        case evLong = "ev_long"
        case evGender = "ev_gender"
        case evAgeID = "ev_age_id"
        case evLanguage = "ev_language"
        case evImpNotes = "ev_imp_notes"
        case evImpNotesAr = "ev_imp_notes_ar"
        case evDescription = "ev_description"
        case evDescriptionAr = "ev_description_ar"
        case evDetail = "ev_detail"
        case evDetailAr = "ev_detail_ar"
        case evEmail = "ev_email"
        case evContact = "ev_contact"
        case evWhatsappNo = "ev_whatsapp_no"
        case evWebsite = "ev_website"
        case evViews = "ev_views"
        case evLike = "ev_like"
        case evStatus = "ev_status"
        case evIsPromoted = "ev_is_promoted"
        case evPromoteCountry = "ev_promote_country"
        case evPromoteCity = "ev_promote_city"
        case evPromotedPoints = "ev_promoted_points"
        case evCreatedAt = "ev_created_at"
        case evIsFav = "ev_is_fav"
        case categoryName = "category_name"
        case categoryColor = "category_color"
        case eventTag = "event_tag"
        case evUsersPoints = "ev_users_points"
        case evCountryID = "ev_country_id"
        case evCityID = "ev_city_id"
        case evRegionID = "ev_region_id"
        case evCountryPoints = "ev_country_points"
        case evRegionPoints = "ev_region_points"
        case evCityPoints = "ev_city_points"
        case evEventTypeName = "ev_event_type_name"
        case evReminder = "ev_reminder"
        case evIsReminder = "ev_is_reminder"
        case evNew = "ev_new"
        case distance
        case eventOrganizer = "event_organizer"
        case eventSponser = "event_sponser"
        case eventPerformer = "event_performer"
        case commentCount, comment
        case viewPromotePoints = "view_promote_points"
        case durationPromotePoints = "duration_promote_points"
    }
}

// MARK: DataClass convenience initializers and mutators

extension DataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DataClass.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        eventID: String?? = nil,
        evUserID: String?? = nil,
        evEventType: String?? = nil,
        evCategoryID: String?? = nil,
        evTagID: String?? = nil,
        evVenueID: String?? = nil,
        evEventFee: String?? = nil,
        evIsPublic: String?? = nil,
        evFeatured: String?? = nil,
        evName: String?? = nil,
        evNameAr: String?? = nil,
        evTitle: String?? = nil,
        evTitleAr: String?? = nil,
        evOrganizerName: String?? = nil,
        evOrganizerID: String?? = nil,
        evStartDate: String?? = nil,
        evEndDate: String?? = nil,
        evStartTime: String?? = nil,
        evEndTime: String?? = nil,
        evImage: [EvImage]?? = nil,
        evSeatingMapImage: [JSONAny]?? = nil,
        evVennueName: String?? = nil,
        evVennueNameAr: String?? = nil,
        evCountry: String?? = nil,
        evRegion: String?? = nil,
        evCity: String?? = nil,
        evAddress: String?? = nil,
        evLat: String?? = nil,
        evLong: String?? = nil,
        evGender: String?? = nil,
        evAgeID: String?? = nil,
        evLanguage: String?? = nil,
        evImpNotes: String?? = nil,
        evImpNotesAr: String?? = nil,
        evDescription: String?? = nil,
        evDescriptionAr: String?? = nil,
        evDetail: String?? = nil,
        evDetailAr: String?? = nil,
        evEmail: String?? = nil,
        evContact: String?? = nil,
        evWhatsappNo: String?? = nil,
        evWebsite: String?? = nil,
        evViews: String?? = nil,
        evLike: String?? = nil,
        evStatus: String?? = nil,
        evIsPromoted: String?? = nil,
        evPromoteCountry: String?? = nil,
        evPromoteCity: String?? = nil,
        evPromotedPoints: String?? = nil,
        evCreatedAt: String?? = nil,
        evIsFav: String?? = nil,
        categoryName: String?? = nil,
        categoryColor: String?? = nil,
        eventTag: [EventTag]?? = nil,
        evUsersPoints: String?? = nil,
        evCountryID: String?? = nil,
        evCityID: String?? = nil,
        evRegionID: String?? = nil,
        evCountryPoints: String?? = nil,
        evRegionPoints: String?? = nil,
        evCityPoints: String?? = nil,
        evEventTypeName: String?? = nil,
        evReminder: String?? = nil,
        evIsReminder: String?? = nil,
        evNew: String?? = nil,
        distance: String?? = nil,
        eventOrganizer: [EventOrganizer]?? = nil,
        eventSponser: [EventSponser]?? = nil,
        eventPerformer: [EventPerformer]?? = nil,
        commentCount: String?? = nil,
        comment: [Comment]?? = nil,
        viewPromotePoints: [PromotePoint]?? = nil,
        durationPromotePoints: [PromotePoint]?? = nil
    ) -> DataClass {
        return DataClass(
            eventID: eventID ?? self.eventID,
            evUserID: evUserID ?? self.evUserID,
            evEventType: evEventType ?? self.evEventType,
            evCategoryID: evCategoryID ?? self.evCategoryID,
            evTagID: evTagID ?? self.evTagID,
            evVenueID: evVenueID ?? self.evVenueID,
            evEventFee: evEventFee ?? self.evEventFee,
            evIsPublic: evIsPublic ?? self.evIsPublic,
            evFeatured: evFeatured ?? self.evFeatured,
            evName: evName ?? self.evName,
            evNameAr: evNameAr ?? self.evNameAr,
            evTitle: evTitle ?? self.evTitle,
            evTitleAr: evTitleAr ?? self.evTitleAr,
            evOrganizerName: evOrganizerName ?? self.evOrganizerName,
            evOrganizerID: evOrganizerID ?? self.evOrganizerID,
            evStartDate: evStartDate ?? self.evStartDate,
            evEndDate: evEndDate ?? self.evEndDate,
            evStartTime: evStartTime ?? self.evStartTime,
            evEndTime: evEndTime ?? self.evEndTime,
            evImage: evImage ?? self.evImage,
            evSeatingMapImage: evSeatingMapImage ?? self.evSeatingMapImage,
            evVennueName: evVennueName ?? self.evVennueName,
            evVennueNameAr: evVennueNameAr ?? self.evVennueNameAr,
            evCountry: evCountry ?? self.evCountry,
            evRegion: evRegion ?? self.evRegion,
            evCity: evCity ?? self.evCity,
            evAddress: evAddress ?? self.evAddress,
            evLat: evLat ?? self.evLat,
            evLong: evLong ?? self.evLong,
            evGender: evGender ?? self.evGender,
            evAgeID: evAgeID ?? self.evAgeID,
            evLanguage: evLanguage ?? self.evLanguage,
            evImpNotes: evImpNotes ?? self.evImpNotes,
            evImpNotesAr: evImpNotesAr ?? self.evImpNotesAr,
            evDescription: evDescription ?? self.evDescription,
            evDescriptionAr: evDescriptionAr ?? self.evDescriptionAr,
            evDetail: evDetail ?? self.evDetail,
            evDetailAr: evDetailAr ?? self.evDetailAr,
            evEmail: evEmail ?? self.evEmail,
            evContact: evContact ?? self.evContact,
            evWhatsappNo: evWhatsappNo ?? self.evWhatsappNo,
            evWebsite: evWebsite ?? self.evWebsite,
            evViews: evViews ?? self.evViews,
            evLike: evLike ?? self.evLike,
            evStatus: evStatus ?? self.evStatus,
            evIsPromoted: evIsPromoted ?? self.evIsPromoted,
            evPromoteCountry: evPromoteCountry ?? self.evPromoteCountry,
            evPromoteCity: evPromoteCity ?? self.evPromoteCity,
            evPromotedPoints: evPromotedPoints ?? self.evPromotedPoints,
            evCreatedAt: evCreatedAt ?? self.evCreatedAt,
            evIsFav: evIsFav ?? self.evIsFav,
            categoryName: categoryName ?? self.categoryName,
            categoryColor: categoryColor ?? self.categoryColor,
            eventTag: eventTag ?? self.eventTag,
            evUsersPoints: evUsersPoints ?? self.evUsersPoints,
            evCountryID: evCountryID ?? self.evCountryID,
            evCityID: evCityID ?? self.evCityID,
            evRegionID: evRegionID ?? self.evRegionID,
            evCountryPoints: evCountryPoints ?? self.evCountryPoints,
            evRegionPoints: evRegionPoints ?? self.evRegionPoints,
            evCityPoints: evCityPoints ?? self.evCityPoints,
            evEventTypeName: evEventTypeName ?? self.evEventTypeName,
            evReminder: evReminder ?? self.evReminder,
            evIsReminder: evIsReminder ?? self.evIsReminder,
            evNew: evNew ?? self.evNew,
            distance: distance ?? self.distance,
            eventOrganizer: eventOrganizer ?? self.eventOrganizer,
            eventSponser: eventSponser ?? self.eventSponser,
            eventPerformer: eventPerformer ?? self.eventPerformer,
            commentCount: commentCount ?? self.commentCount,
            comment: comment ?? self.comment,
            viewPromotePoints: viewPromotePoints ?? self.viewPromotePoints,
            durationPromotePoints: durationPromotePoints ?? self.durationPromotePoints
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Comment
struct Comment: Codable {
    var commentID, ecEventID, ecUserID, ecComment: String?
    var ecStatus, ecCreatedAt, uName: String?
    var uImage: String?

    enum CodingKeys: String, CodingKey {
        case commentID = "comment_id"
        case ecEventID = "ec_event_id"
        case ecUserID = "ec_user_id"
        case ecComment = "ec_comment"
        case ecStatus = "ec_status"
        case ecCreatedAt = "ec_created_at"
        case uName = "u_name"
        case uImage = "u_image"
    }
}

// MARK: Comment convenience initializers and mutators

extension Comment {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Comment.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        commentID: String?? = nil,
        ecEventID: String?? = nil,
        ecUserID: String?? = nil,
        ecComment: String?? = nil,
        ecStatus: String?? = nil,
        ecCreatedAt: String?? = nil,
        uName: String?? = nil,
        uImage: String?? = nil
    ) -> Comment {
        return Comment(
            commentID: commentID ?? self.commentID,
            ecEventID: ecEventID ?? self.ecEventID,
            ecUserID: ecUserID ?? self.ecUserID,
            ecComment: ecComment ?? self.ecComment,
            ecStatus: ecStatus ?? self.ecStatus,
            ecCreatedAt: ecCreatedAt ?? self.ecCreatedAt,
            uName: uName ?? self.uName,
            uImage: uImage ?? self.uImage
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PromotePoint
struct PromotePoint: Codable {
    var id, views, points, type: String?
    var durationStatus: String?

    enum CodingKeys: String, CodingKey {
        case id, views, points, type
        case durationStatus = "duration_status"
    }
}

// MARK: PromotePoint convenience initializers and mutators

extension PromotePoint {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PromotePoint.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String?? = nil,
        views: String?? = nil,
        points: String?? = nil,
        type: String?? = nil,
        durationStatus: String?? = nil
    ) -> PromotePoint {
        return PromotePoint(
            id: id ?? self.id,
            views: views ?? self.views,
            points: points ?? self.points,
            type: type ?? self.type,
            durationStatus: durationStatus ?? self.durationStatus
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - EvImage
struct EvImage: Codable {
    var image: String?
}

// MARK: EvImage convenience initializers and mutators

extension EvImage {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EvImage.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        image: String?? = nil
    ) -> EvImage {
        return EvImage(
            image: image ?? self.image
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - EventOrganizer
struct EventOrganizer: Codable {
    var organizerID, oName, oNameAr: String?
    var oLogo: String?
    var oDetail, oDetailAr, oContact, oEmail: String?
    var oWebsite: String?
    var oImage, oStatus, oCreatedAt, eventOrganizerID: String?

    enum CodingKeys: String, CodingKey {
        case organizerID = "organizer_id"
        case oName = "o_name"
        case oNameAr = "o_name_ar"
        case oLogo = "o_logo"
        case oDetail = "o_detail"
        case oDetailAr = "o_detail_ar"
        case oContact = "o_contact"
        case oEmail = "o_email"
        case oWebsite = "o_website"
        case oImage = "o_image"
        case oStatus = "o_status"
        case oCreatedAt = "o_created_at"
        case eventOrganizerID = "event_organizer_id"
    }
}

// MARK: EventOrganizer convenience initializers and mutators

extension EventOrganizer {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EventOrganizer.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        organizerID: String?? = nil,
        oName: String?? = nil,
        oNameAr: String?? = nil,
        oLogo: String?? = nil,
        oDetail: String?? = nil,
        oDetailAr: String?? = nil,
        oContact: String?? = nil,
        oEmail: String?? = nil,
        oWebsite: String?? = nil,
        oImage: String?? = nil,
        oStatus: String?? = nil,
        oCreatedAt: String?? = nil,
        eventOrganizerID: String?? = nil
    ) -> EventOrganizer {
        return EventOrganizer(
            organizerID: organizerID ?? self.organizerID,
            oName: oName ?? self.oName,
            oNameAr: oNameAr ?? self.oNameAr,
            oLogo: oLogo ?? self.oLogo,
            oDetail: oDetail ?? self.oDetail,
            oDetailAr: oDetailAr ?? self.oDetailAr,
            oContact: oContact ?? self.oContact,
            oEmail: oEmail ?? self.oEmail,
            oWebsite: oWebsite ?? self.oWebsite,
            oImage: oImage ?? self.oImage,
            oStatus: oStatus ?? self.oStatus,
            oCreatedAt: oCreatedAt ?? self.oCreatedAt,
            eventOrganizerID: eventOrganizerID ?? self.eventOrganizerID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - EventPerformer
struct EventPerformer: Codable {
    var performerID, pName, pNameAr: String?
    var pLogo: String?
    var pDetail, pDetailAr, pType, pContact: String?
    var pEmail, pWebsite, pImage, pStatus: String?
    var pCreatedAt, eventOrganizerID: String?

    enum CodingKeys: String, CodingKey {
        case performerID = "performer_id"
        case pName = "p_name"
        case pNameAr = "p_name_ar"
        case pLogo = "p_logo"
        case pDetail = "p_detail"
        case pDetailAr = "p_detail_ar"
        case pType = "p_type"
        case pContact = "p_contact"
        case pEmail = "p_email"
        case pWebsite = "p_website"
        case pImage = "p_image"
        case pStatus = "p_status"
        case pCreatedAt = "p_created_at"
        case eventOrganizerID = "event_organizer_id"
    }
}

// MARK: EventPerformer convenience initializers and mutators

extension EventPerformer {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EventPerformer.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        performerID: String?? = nil,
        pName: String?? = nil,
        pNameAr: String?? = nil,
        pLogo: String?? = nil,
        pDetail: String?? = nil,
        pDetailAr: String?? = nil,
        pType: String?? = nil,
        pContact: String?? = nil,
        pEmail: String?? = nil,
        pWebsite: String?? = nil,
        pImage: String?? = nil,
        pStatus: String?? = nil,
        pCreatedAt: String?? = nil,
        eventOrganizerID: String?? = nil
    ) -> EventPerformer {
        return EventPerformer(
            performerID: performerID ?? self.performerID,
            pName: pName ?? self.pName,
            pNameAr: pNameAr ?? self.pNameAr,
            pLogo: pLogo ?? self.pLogo,
            pDetail: pDetail ?? self.pDetail,
            pDetailAr: pDetailAr ?? self.pDetailAr,
            pType: pType ?? self.pType,
            pContact: pContact ?? self.pContact,
            pEmail: pEmail ?? self.pEmail,
            pWebsite: pWebsite ?? self.pWebsite,
            pImage: pImage ?? self.pImage,
            pStatus: pStatus ?? self.pStatus,
            pCreatedAt: pCreatedAt ?? self.pCreatedAt,
            eventOrganizerID: eventOrganizerID ?? self.eventOrganizerID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - EventSponser
struct EventSponser: Codable {
    var sponsorID, sName, sNameAr: String?
    var sLogo: String?
    var sDetail, sDetailAr, sContact, sType: String?
    var sEmail: String?
    var sWebsite: String?
    var sImage, sStatus, sCreatedAt, eventOrganizerID: String?

    enum CodingKeys: String, CodingKey {
        case sponsorID = "sponsor_id"
        case sName = "s_name"
        case sNameAr = "s_name_ar"
        case sLogo = "s_logo"
        case sDetail = "s_detail"
        case sDetailAr = "s_detail_ar"
        case sContact = "s_contact"
        case sType = "s_type"
        case sEmail = "s_email"
        case sWebsite = "s_website"
        case sImage = "s_image"
        case sStatus = "s_status"
        case sCreatedAt = "s_created_at"
        case eventOrganizerID = "event_organizer_id"
    }
}

// MARK: EventSponser convenience initializers and mutators

extension EventSponser {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EventSponser.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        sponsorID: String?? = nil,
        sName: String?? = nil,
        sNameAr: String?? = nil,
        sLogo: String?? = nil,
        sDetail: String?? = nil,
        sDetailAr: String?? = nil,
        sContact: String?? = nil,
        sType: String?? = nil,
        sEmail: String?? = nil,
        sWebsite: String?? = nil,
        sImage: String?? = nil,
        sStatus: String?? = nil,
        sCreatedAt: String?? = nil,
        eventOrganizerID: String?? = nil
    ) -> EventSponser {
        return EventSponser(
            sponsorID: sponsorID ?? self.sponsorID,
            sName: sName ?? self.sName,
            sNameAr: sNameAr ?? self.sNameAr,
            sLogo: sLogo ?? self.sLogo,
            sDetail: sDetail ?? self.sDetail,
            sDetailAr: sDetailAr ?? self.sDetailAr,
            sContact: sContact ?? self.sContact,
            sType: sType ?? self.sType,
            sEmail: sEmail ?? self.sEmail,
            sWebsite: sWebsite ?? self.sWebsite,
            sImage: sImage ?? self.sImage,
            sStatus: sStatus ?? self.sStatus,
            sCreatedAt: sCreatedAt ?? self.sCreatedAt,
            eventOrganizerID: eventOrganizerID ?? self.eventOrganizerID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - EventTag
struct EventTag: Codable {
    var etID, etNameEn, etColor: String?

    enum CodingKeys: String, CodingKey {
        case etID = "et_id"
        case etNameEn = "et_name_en"
        case etColor = "et_color"
    }
}

// MARK: EventTag convenience initializers and mutators

extension EventTag {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EventTag.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        etID: String?? = nil,
        etNameEn: String?? = nil,
        etColor: String?? = nil
    ) -> EventTag {
        return EventTag(
            etID: etID ?? self.etID,
            etNameEn: etNameEn ?? self.etNameEn,
            etColor: etColor ?? self.etColor
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
