#include <iostream>
#include "matrix_algebra.hpp"

int main(){
	cie1::Matrix m1;
	m1.print();

	std::array<size_t, 2> size = { 2, 3 };
	cie1::Matrix m2(size);
	m2.print();

	std::vector<std::vector<double>> vec = { {1,1,1,1},{1,1,1,1},{1,1,1,1} };
	cie1::Matrix m3(vec);
	m3.print();

	std::array<size_t, 2> newSize{ 5, 5 };
	m3.resize(newSize);
	m3.print();

	std::cout <<"Der Wert an 1,3 ist: "<< m3(1, 3)<<std::endl;

	std::cout << "M4: " << std::endl;
	cie1::Matrix m4(vec);
	m4.print();

	std::cout << "M5: " << std::endl;
	cie1::Matrix m5(vec);
	m5.print();

	std::array<size_t, 2> size2 = { 3, 4 };
	cie1::Matrix m6(size2);
	m6 = m4 + m5;
	m6.print();

	m6 = m4 + 3.0;
	m6.print();

	std::cout << "M4-M5: " << std::endl;
	m6 = m4 - m5;
	m6.print();

	std::cout << "M4-3.0: " << std::endl;
	m6 = m4 - 3.0;
	m6.print();

	std::cout << "M7: " << std::endl;
	std::vector<std::vector<double>> vec2 = { {1,1,1,3},{1,1,1,1},{1,1,1,1}, {1,1,1,1} };
	cie1::Matrix m7(vec2);
	m7.print();

	//std::cout << "M4*M7: " << std::endl;
	//m6 = m4 * m7;
	//m6.print();

	std::cout << "M4.matmul(m7): " << std::endl;
	m6 = m4.matmul(m7);
	m6.print();

	std::cout << "M7*3: " << std::endl;
	m6 = m7 * 3;
	m6.print();

	std::cout << "M4/M5: " << std::endl;
	m6 = m4 / m5;
	m6.print();

	std::cout << "M7/3: " << std::endl;
	m6 = m7 / 3;
	m6.print();

	std::cout << "M7^3: " << std::endl;
	m6 = m7^3;
	m6.print();

	std::cout << "M8: " << std::endl;
	std::vector<std::vector<double>> vec3 = { {1,1,1},{1,1,1}};
	cie1::Matrix m8(vec3);
	m8.print();

	std::cout << "M8.norm(): " <<m8.norm()<< std::endl;

	std::vector<double> vec44 = { 1,1,3 };
	std::cout << "dot prod m8*[1,1,3]: " << std::endl;
	std::vector<double> erg = m8.dot(vec44);
	for (size_t i = 0; i < erg.size(); ++i) {
		std::cout << erg[i] << " ";
	}

	cie1::Matrix matrixA({ {	2.0,	3.0	},
				{	5.0,	4.0	} });
	std::cout << "mA: " << std::endl;
	matrixA.print();

	cie1::Matrix matrixB({ {	3.0,	2.0	},
					{	3.0,	2.0	} });
	std::cout << "mB: " << std::endl;

	matrixB.print();

	cie1::Matrix matrixD = matrixA * matrixB;
	std::cout << "mA*mB: " << std::endl;

	matrixD.print();


	//Exercise 3
	std::vector<std::vector<double>> imA = {
		{52, 48, 53, 49, 51},
		{51, 98, 102, 99, 52},
		{48, 101, 152, 97, 51},
		{49, 103, 98, 101, 50},
		{50, 47, 51, 52, 48}
	};
	cie1::Matrix imageA(imA);
	imageA.print();

	std::vector<std::vector<double>> imB = {
	{50, 50, 50, 50, 50},
	{50, 100, 100, 100, 50},
	{50, 100, 150, 100, 50},
	{50, 100, 100, 100, 50},
	{50, 50, 50, 50, 50}
	};
	cie1::Matrix imageB(imB);
	imageB.print();

	std::array<size_t, 2> sizeAB = { 5, 5 };
	cie1::Matrix imAmB(sizeAB);

	imAmB = imageA - imageB;

	std::cout << "Error: " << imAmB.norm() << std::endl;

}
