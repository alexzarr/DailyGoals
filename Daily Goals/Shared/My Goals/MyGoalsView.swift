//
//  ContentView.swift
//  Shared
//
//  Created by alex.zarr on 2/13/21.
//

import SwiftUI
import CoreData

struct MyGoalsView: View {
    @FetchRequest(fetchRequest: TLGoal.fetchRequest(), animation: .default)
    private var goals: FetchedResults<TLGoal>
    
    private var columns: [GridItem] { [GridItem(.adaptive(minimum: 100, maximum: 160), spacing: 10.0)] }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10.0) {
                ForEach(goals) { goal in
                    MyGoalsItemView(goal: goal)
                }
            }
            .padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyGoalsView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
