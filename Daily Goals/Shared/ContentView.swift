//
//  ContentView.swift
//  Shared
//
//  Created by alex.zarr on 2/13/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(fetchRequest: TLGoal.fetchRequest(), animation: .default)
    private var goals: FetchedResults<TLGoal>

    var body: some View {
        List {
            ForEach(goals) { goal in
                HStack {
                    Text(goal.icon)
                    Text(goal.title)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
