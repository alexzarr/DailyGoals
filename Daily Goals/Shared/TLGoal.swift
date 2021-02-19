//
//  TLGoal.swift
//  Daily Goals
//
//  Created by alex.zarr on 2/14/21.
//

import Foundation
import CoreData

@objc(TLGoal)
final class TLGoal: NSManagedObject {
    @NSManaged public var id: UUID?
    @NSManaged public var icon: String
    @NSManaged public var title: String
    @NSManaged public var position: Int16
    @NSManaged public var addedOn: Date
    @NSManaged public var modifiedOn: Date
    @NSManaged public var isRemoved: Bool
    @NSManaged public var records: Set<TLGoalRecord>?
}

extension TLGoal {
    class func fetchRequest() -> NSFetchRequest<TLGoal> {
        let request = NSFetchRequest<TLGoal>(entityName: "TLGoal")
        request.predicate = NSPredicate(format: "isRemoved == false")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TLGoal.position, ascending: true)]
        return request
    }
}

// MARK: - Identifiable
extension TLGoal: Identifiable { }
