//
//  TupleMetadata.swift
//  Runtime
//
//  Created by Wes Wickwire on 11/4/17.
//  Copyright © 2017 Wes Wickwire. All rights reserved.
//

import Foundation



struct TupleMetadata: MetadataType {
    
    var type: Any.Type
    var metadata: UnsafeMutablePointer<TupleMetadataLayout>
    var base: UnsafeMutablePointer<Int>
    
    init(type: Any.Type) {
        self.type = type
        base = metadataPointer(type: type)
        metadata = base.advanced(by: -1).raw.assumingMemoryBound(to: TupleMetadataLayout.self)
    }
    
    func numberOfElements() -> Int {
        return metadata.pointee.numberOfElements
    }
    
    func labels() -> [String] {
        guard metadata.pointee.labelsString.hashValue != 0 else { return [] }
        var labels = String(cString: metadata.pointee.labelsString).components(separatedBy: " ")
        labels.removeLast()
        return labels
    }
    
    func elements() -> [TupleElementLayout] {
        let n = numberOfElements()
        guard n > 0 else { return [] }
        return metadata.pointee.elementVector.vector(n: n)
    }
}
