public import Linear
public import Symmetry

extension Shear where N == 2, Scalar: ExpressibleByIntegerLiteral {

    @inlinable
    public func linear<Space>() -> Linear<Scalar, Space>.Matrix<2, 2> {
        .init(a: 1, b: x, c: y, d: 1)
    }
}
