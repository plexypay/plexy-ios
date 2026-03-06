//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// A wrapper around a base instance, to enable scoped system types extensions without conflict with the host app code.
@_spi(PlexyInternal)
public struct PlexyScope<Base> {
    
    public let base: Base
    
    public init(base: Base) {
        self.base = base
    }
}

/// Describes a type that needs scoped extension.
@_spi(PlexyInternal)
public protocol PlexyCompatible {
    
    associatedtype PlexyBase
    
    var plexy: PlexyScope<PlexyBase> { get }
}

/// Provides default implementation of the `plexy` property,
/// to enable any conforming type to inherit the `plexy` scope.
@_spi(PlexyInternal)
public extension PlexyCompatible {
    
    var plexy: PlexyScope<Self> {
        PlexyScope(base: self)
    }
}
