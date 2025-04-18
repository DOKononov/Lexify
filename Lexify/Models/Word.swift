//
//  Word.swift
//  Lexify
//
//  Created by Dmitry Kononov on 17.04.25.
//

import Foundation
import RealmSwift

final class Word: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    override class func primaryKey() -> String? { "id" }
    
    @Persisted var language: String = "EN"
    @Persisted var word: String = ""
    @Persisted var translate: String = ""
    @Persisted var wordDescription: String = ""
    @Persisted var weight: Int = 0
}
