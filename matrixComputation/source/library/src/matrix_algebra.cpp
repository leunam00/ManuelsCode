#include "matrix_algebra.hpp"
#include <iostream>
#include <array>
#include <vector>
#include <stdexcept> 

namespace cie1 {
	Matrix::Matrix() :
		rows(0), cols(0), data() {}

	Matrix::Matrix(std::array<size_t, 2> size) :
		rows(size[0]), cols(size[1]), data(size[0], std::vector<double>(size[1], 0.0)) {}

	Matrix::Matrix(std::vector<std::vector<double>> matrix) :
		rows(matrix.size()), cols(matrix[0].size()), data(matrix) {}

	std::array<size_t, 2> const Matrix::size() {
		std::array<size_t, 2> size = { rows, cols };
		return size;
	}

	void const Matrix::print() {
		for (size_t i = 0; i < rows; ++i) {
			std::cout << "[";
				for (size_t j = 0; j < cols; ++j) {
					std::cout << " " << data[i][j] << " ";
			}
			std::cout << "]" << std::endl;
		}
		std::cout << std::endl;
	}

	void Matrix::resize(std::array<size_t, 2> newSize) {

		std::vector<std::vector<double>> newMatrix(newSize[0], std::vector<double>(newSize[1],0.0));

		for (size_t i = 0; i < newSize[0] && i < rows; ++i) {
			for (size_t j = 0; j < newSize[1] && j < cols; ++j) {
				newMatrix[i][j] = data[i][j];
			}
		}

		data.clear();
		data = newMatrix;
		rows = newSize[0];
		cols = newSize[1];
	}

	double& Matrix::operator()(size_t i, size_t j) {
		return data[i][j];
	}

	Matrix const Matrix::operator+(Matrix rhs) {
		//check if sizes match
		if (rows != rhs.size()[0] || cols != rhs.size()[1]) {
			std::cout << "Dimensions are not matching!" << std::endl;
			//throw std::invalid_argument("Dimensions are not matching!");
		}
		std::array<size_t, 2> size{ rows, cols };
		Matrix result(size);

		for(size_t i = 0; i < rows; ++i) {
			for (size_t j = 0; j < cols; ++j) {
				result(i, j) = data[i][j] + rhs(i, j);
			}
		}
		return result;
	}

	Matrix const Matrix::operator+(double scalar) {
		std::array<size_t, 2> size{ rows, cols };
		Matrix result(size);

		for (size_t i = 0; i < rows; ++i) {
			for (size_t j = 0; j < cols; ++j) {
				result(i, j) = data[i][j] + scalar;
			}
		}
		return result;
	}

	Matrix const Matrix::operator-(Matrix rhs) {
		//check if sizes match
		if (rows != rhs.size()[0] || cols != rhs.size()[1]) {
			std::cout << "Dimensions are not matching!" << std::endl;
			//throw std::invalid_argument("Dimensions are not matching!");
			throw std::runtime_error("Dimensions are not matching!");
		}

		std::array<size_t, 2> size{ rows, cols };
		Matrix result(size);

		for (size_t i = 0; i < rows; ++i) {
			for (size_t j = 0; j < cols; ++j) {
				result(i, j) = data[i][j] - rhs(i, j);
			}
		}
		return result;
	}

	Matrix const Matrix::operator-(double scalar) {
		std::array<size_t, 2> size{ rows, cols };
		Matrix result(size);

		for (size_t i = 0; i < rows; ++i) {
			for (size_t j = 0; j < cols; ++j) {
				result(i, j) = data[i][j] - scalar;
			}
		}
		return result;
	}

	Matrix const Matrix::operator*(Matrix rhs) {
		//check if sizes match
		if (rows != rhs.size()[0] || cols != rhs.size()[1]) {
			std::cout << "Dimensions are not matching!" << std::endl;
			throw std::runtime_error("Dimensions are not matching!");
			//throw std::invalid_argument("Dimensions are not matching!");
		}
		std::array<size_t, 2> size{ rows, cols };
		Matrix result(size);

		for (size_t i = 0; i < rows; ++i) {
			for (size_t j = 0; j < cols; ++j) {
				result(i, j) = data[i][j] * rhs(i, j);
			}
		}
		return result;

	}

	Matrix const Matrix::operator*(double scalar) {
		std::array<size_t, 2> size{ rows, cols };
		Matrix result(size);

		for (size_t i = 0; i < rows; ++i) { //rows
			for (size_t j = 0; j < cols; ++j) { //columns
					result(i, j) += data[i][j] * scalar;
			}
		}
		return result;
	}

	Matrix const Matrix::operator/(Matrix rhs) {
		//check if sizes match
		if (rows != rhs.size()[0] || cols != rhs.size()[1]) {
			std::cout << "Dimensions are not matching for matrix division!" << std::endl;
			throw std::runtime_error("Dimensions are not matching!");
			//throw std::invalid_argument("Dimensions are not matching!");
		}
		std::array<size_t, 2> size{ rows, cols };
		Matrix result(size);

		for (size_t i = 0; i < rows; ++i) {
			for (size_t j = 0; j < cols; ++j) {
				if (rhs(i, j) == 0.0) {
					std::cout << "Division by zero is not allowed!" << std::endl;
					throw std::runtime_error("Division by zero in matrix elementwise division!");
				}
				result(i, j) = data[i][j] / rhs(i, j);
			}
		}
		return result;
	}

	Matrix const Matrix::operator/(double scalar) {

		if (scalar == 0.0) {
			std::cout << "Division by zero is not allowed!" << std::endl;
			throw std::runtime_error("Division by zero is not allowed!");
		}
		std::array<size_t, 2> size{ rows, cols };
		Matrix result(size);

		for (size_t i = 0; i < rows; ++i) {
			for (size_t j = 0; j < cols; ++j) {
				result(i, j) = data[i][j] / scalar;
			}
		}
		return result;
	}

	Matrix const Matrix::operator^(double scalar) {
		std::array<size_t, 2> size{ rows, cols };
		Matrix result(size);

		for (size_t i = 0; i < rows; ++i) {
			for (size_t j = 0; j < cols; ++j) {
				result(i, j) = std::pow(data[i][j], scalar);
			}
		}
		return result;
	}

	double const Matrix::norm() {
		double sum = 0;
		for (size_t i = 0; i < rows; ++i) {
			for (size_t j = 0; j < cols; ++j) {
				sum += std::pow(data[i][j], 2);
			}
		}
		return std::sqrt(sum);
	}

	std::vector<double> const Matrix::dot(std::vector<double> vector) {
		//check if sizes match
		if (cols != vector.size()) {
			std::cout << "Dimensions of vector are not matching to matrix cols for dot product!" << std::endl;
			return {};
		}

		std::vector<double> resultVector(rows, 0.0);

		for (size_t i = 0; i < rows; ++i) { //matrix rows
			for (size_t j = 0; j < cols; ++j) { //matrix cols
				resultVector[i] += data[i][j]*vector[j];
			}
		}
		return resultVector;
	}

	Matrix const Matrix::matmul(Matrix rhs) {
		//check if sizes match
		if (cols != rhs.size()[0]) {
			std::cout << "Dimensions are not matching for matrix multiplication!" << std::endl;
			throw std::runtime_error("Dimensions are not matching!");
		}

		std::array<size_t, 2> size{ rows, rhs.size()[1] };
		Matrix result(size);

		for (size_t i = 0; i < rows; ++i) { //rows
			for (size_t j = 0; j < rhs.size()[1]; ++j) { //columns
				for (size_t k = 0; k < cols; ++k) { //columns
					result(i, j) += data[i][k] * rhs(k, j);
				}
			}
		}
		return result;
	}


}