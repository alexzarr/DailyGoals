//
//  TLGoalRecord.swift
//  Daily Goals
//
//  Created by alex.zarr on 2/14/21.
//

import Foundation
import CoreData

@objc(TLGoalRecord)
final class TLGoalRecord: NSManagedObject {
    @NSManaged public var date: Date
    @NSManaged public var goal: TLGoal?
}

extension TLGoalRecord {
    class func fetchRequest() -> NSFetchRequest<TLGoalRecord> {
        NSFetchRequest<TLGoalRecord>(entityName: "TLGoalRecord")
    }
}

// MARK: - Identifiable
extension TLGoalRecord: Identifiable { }
