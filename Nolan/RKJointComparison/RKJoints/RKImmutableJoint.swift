//
//  RKImmutableJoint.swift
//  Motion Recorder
//
//  Created by Enzo Maruffa Moreira on 28/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import RealityKit

/// A class representing a single immutable joint
class RKImmutableJoint: Codable {
    
    /// An immutable String with the joint's name
    let name: String
    
    /// An immutable SIMD3<Float> with the joint's position relative to it's parent
    let relativeTranslation: SIMD3<Float>
    
    /// An immutable SIMD3<Float> with the absoulute joint's position
    let absoluteTranslation: SIMD3<Float>
    
    /// An immutable SIMD4<Float> with the joint's position relative to it's parent
    let rotation: SIMD4<Float>
    
    /// A list of the joint's children
    var childrenJoints: [RKImmutableJoint] = []
    
    /// An optional parent  joint
    var parent: RKImmutableJoint?
    
    /// The amount of descendants this joint has, recursevely calculated by each children.
    var descendantCount: Int {
        // Start with a count of 0 then sum each child descendantCount. Then, add the  total children joints this joint has to the sum.
        return childrenJoints.reduce(0, { $0 + $1.descendantCount }) + childrenJoints.count
    }
    
    init(name: String, relativeTranslation: SIMD3<Float>, absoluteTranslation: SIMD3<Float>, rotation: SIMD4<Float>, childrenJoints: [RKImmutableJoint], parent: RKImmutableJoint?) {
        self.name = name
        self.relativeTranslation = relativeTranslation
        self.absoluteTranslation = absoluteTranslation
        self.rotation = rotation
        self.childrenJoints = childrenJoints
        self.parent = parent
    }
    
    /// Initializes the immutable joint using information from a RKJoint
    /// - Parameter joint: a RKJoint that contains a name, relative and absolute translation, a rotation. No children or parent is created.
    convenience init(joint: RKJoint) {
        self.init(name: joint.name, relativeTranslation: joint.relativeTranslation, absoluteTranslation: joint.absoluteTranslation, rotation: joint.rotation, childrenJoints: [], parent: nil)
    }
    
    /// Creates and adds a joint as a child based on it's name and translation
   /// - Parameter joint: An RKImmutableJoint with the to be children joint
   internal func addChild(joint: RKImmutableJoint) {
       // Checks if the joint to be added already has a parent
       if let oldParent = joint.parent {
           oldParent.childrenJoints.removeAll(where: { $0.name == joint.name} )
       }
       
       childrenJoints.append(joint)
       joint.parent = self
   }
    

    /// Searchs for a joint on this joint's children by name
    /// - Parameter name: The searched joint's name
    /// - Returns: The searched joint if it was found. nil if no proper joint was found.
    func findChildrenBy(name: String) -> RKImmutableJoint? {
        return self.childrenJoints.filter( {$0.name == name} ).first
    }
    
    /// Searchs for a joint on this joint's descendants by name
    /// - Parameter name: The searched joint's name
    /// - Returns: The searched joint if it was found. nil if no proper joint was found.
    func findDescendantBy(name: String) -> RKImmutableJoint? {
        // If it's a direct children, instantly returns it
        if let joint = self.findChildrenBy(name: name) {
            return joint
        }
        
        // Searches for a descentand in our children, find the first non nil and return it
        let returnJoint = childrenJoints.map( { $0.findDescendantBy(name: name)} ).filter( {$0 != nil} ).first
        
        return returnJoint ?? nil //TODO: Entender esse RKImmutableJoint??
    }
    
    /// Searchs for a joint on this joint's descendants by name, but also checks if this joint is the searched one
    /// - Parameter name: The searched joint's name
    /// - Returns: The searched joint if it was found. nil if no proper joint was found.
    func findSelfOrDescendantBy(name: String) -> RKImmutableJoint? {
        if name == self.name {
            return self
        }
        
        return findDescendantBy(name: name)
    }
    
    
    /// Checks the equivalence between two joints
    /// - Parameter to other: The immutable joint that "self" will be compared to
    /// - Returns: a Bool with the comparison result
    func isEquivalent(to other: RKImmutableJoint) -> Bool {
        
        // If children count is different, instantly return as false
        if childrenJoints.count != other.childrenJoints.count {
            return false
        }
        
        for child in childrenJoints {
            // For each child, we check if the other joint contains a child with the same name. If so, we go down it's tree checking the same thing
            if let otherJoint = other.childrenJoints.filter( {$0.name == name} ).first {
                if !child.isEquivalent(to: otherJoint) {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
    }
    
    
    /// Checks the equivalence between two joints
    /// - Parameter to other: The immutable joint that "self" will be compared to
    /// - Returns: a Bool with the comparison result
    func isEquivalent(to other: RKJoint) -> Bool {
        
        // If children count is different, instantly return as false
        if childrenJoints.count != other.childrenJoints.count {
            return false
        }
        
        for child in childrenJoints {
            // For each child, we check if the other joint contains a child with the same name. If so, we go down it's tree checking the same thing
            if let otherJoint = other.childrenJoints.filter( {$0.name == name} ).first {
                if !child.isEquivalent(to: otherJoint) {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
    }
    
    
    // ================== Codable stuff ===================
    
    enum CodingKeys: String, CodingKey {
        case name
        case relativeTranslation
        case absoluteTranslation
        case rotation
        case childrenJoints
        //case parent
        case descendantCount
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(relativeTranslation, forKey: .relativeTranslation)
        try container.encode(absoluteTranslation, forKey: .absoluteTranslation)
        try container.encode(rotation, forKey: .rotation)
        try container.encode(childrenJoints, forKey: .childrenJoints)
        //try container.encode(parent, forKey: .parent)
        try container.encode(descendantCount, forKey: .descendantCount)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        relativeTranslation = try values.decode(SIMD3<Float>.self, forKey: .relativeTranslation)
        absoluteTranslation = try values.decode(SIMD3<Float>.self, forKey: .absoluteTranslation)
        rotation = try values.decode(SIMD4<Float>.self, forKey: .rotation)
        childrenJoints = try values.decode([RKImmutableJoint].self, forKey: .childrenJoints)
        
        for children in childrenJoints {
            children.parent = self
        }
        
    }
    
    
}


extension RKImmutableJoint: CustomStringConvertible {
    var description: String {
        return "\(name) | absolute: \(absoluteTranslation) | rotation: \(rotation)"
    }
}
