//
//  AddNewGoalViewModel.swift
//  Daily Goals (iOS)
//
//  Created by alex.zarr on 3/4/21.
//

import Foundation

final class AddNewGoalViewModel: ObservableObject {
    @Published var title = ""
    @Published var icon = GoalIcon.all[0]
    
    let icons: [String] = GoalIcon.all
    
    private let dataManager: GoalDataManagerProtocol
    
    init(dataManager: GoalDataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
    
    func save() {
        guard !title.isEmpty else { return }
        dataManager.createGoal(title: title, icon: icon)
    }
}
