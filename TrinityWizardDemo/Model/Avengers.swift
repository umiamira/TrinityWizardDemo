//
//  Avengers.swift
//  TrinityWizardDemo
//
//  Created by Umi Amira on 22/03/2024.
//

import UIKit

struct Avengers: Codable {
    let id: Int
    let imageName: String
    let name: String
    let description: String
    var rating: Int
}

// To save Avengers array to UserDefaults
func saveAvengersToUserDefaults(avengers: [Avengers]) {
    do {
        let data = try JSONEncoder().encode(avengers)
        UserDefaults.standard.set(data, forKey: "avengers")
    } catch {
        print("Error encoding Avengers array: \(error.localizedDescription)")
    }
}

// To retrieve Avengers array from UserDefaults
func loadAvengersFromUserDefaults() -> [Avengers] {
    if let data = UserDefaults.standard.data(forKey: "avengers") {
        do {
            let avengers = try JSONDecoder().decode([Avengers].self, from: data)
            return avengers
        } catch {
            print("Error decoding Avengers array: \(error.localizedDescription)")
        }
    }
    return [] // Return an empty array if there's no data or decoding error
}

func updateAvengerRatingInUserDefaults(avengerID: Int, newRating: Int) {
    // Retrieve the list of Avengers from UserDefaults
    var avengers = loadAvengersFromUserDefaults()

    // Find the index of the Avenger whose rating needs to be updated
    if let avengerIndex = avengers.firstIndex(where: { $0.id == avengerID }) {
        // Update the rating for the selected Avenger
        avengers[avengerIndex].rating = newRating
        
        // Save the updated list of Avengers back to UserDefaults
        saveAvengersToUserDefaults(avengers: avengers)
        
    } else {
        print("Avenger with ID \(avengerID) not found.")
    }
}


