//
//  NavigationLink.swift
//  Lexify
//
//  Created by Dmitry Kononov on 17.04.25.
//

import Foundation
import RealmSwift

final class WordLink: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    override class func primaryKey() -> String? { "id" }
    
    @Persisted var title: String = ""
    @Persisted var linkStr: String = ""
}
