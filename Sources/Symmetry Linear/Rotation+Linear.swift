public import Linear
public import Symmetry

extension Rotation where N == 2, Scalar: ExpressibleByIntegerLiteral {

    @inlinable
    public func linear<Space>() -> Linear<Scalar, Space>.Matrix<2, 2> {
        .init(a: matrix[0][0], b: matrix[0][1], c: matrix[1][0], d: matrix[1][1])
    }
}
