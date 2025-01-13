#pragma once
#include <iostream>
#include <array>
#include <vector>
#include <stdexcept> 

namespace cie1 {
	class Matrix
	{
	public:
		Matrix();

		Matrix(std::array<size_t, 2> size);

		Matrix(std::vector<std::vector<double>> matrix);

		std::array<size_t, 2> const size();

		void const print();

		void resize(std::array<size_t, 2> newSize);

		double& operator()(size_t i, size_t j);

		Matrix const operator+(Matrix rhs);

		Matrix const operator+(double scalar);

		Matrix const operator-(Matrix rhs);

		Matrix const operator-(double scalar);
		
		Matrix const operator*(Matrix rhs);

		Matrix const operator*(double scalar);

		Matrix const operator/(Matrix rhs);

		Matrix const operator/(double scalar);

		Matrix const operator^(double scalar);

		double const norm();

		std::vector<double> const dot(std::vector<double> vector);

		Matrix const matmul(Matrix rhs);

	private:

		size_t rows; //number of rows
		size_t cols; //number of columns
		std::vector<std::vector<double>> data; //matrixdata

	};
}