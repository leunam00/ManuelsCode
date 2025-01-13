import numpy as np
from numpy.linalg import inv
from numpy.linalg import det


#############################################################
# test data
element_id = 1
node_coordinates = np.matrix( [[0.0, 0.0],
                               [1.0, 1.0],
                               [1.0, 2.0],
                               [0.0, 1.0] ])
E = 1000.0
prxy = 0.3
t = 0.01


def calculate_shapefunctions(xi,eta):
    N1 = ((1-xi)*(1-eta))/4  #shapefunction node 1
    N2 = ((1+xi)*(1-eta))/4  #shapefunction node 2
    N3 = ((1+xi)*(1+eta))/4  #shapefunction node 3
    N4 = ((1-xi)*(1+eta))/4  #shapefunction node 4
    return [N1,N2,N3,N4]

def calculate_shapefunctions_derivatives(xi,eta):
    
    dN1_deta = ((1-xi)*(-1))/4  #shapefunction node 1
    dN2_deta = ((1+xi)*(-1))/4  #shapefunction node 2
    dN3_deta = ((1+xi)*( 1))/4  #shapefunction node 3
    dN4_deta = ((1-xi)*( 1))/4  #shapefunction node 4

    dN1_dxi = ((-1)*(1-eta))/4  #shapefunction node 1
    dN2_dxi = (( 1)*(1-eta))/4  #shapefunction node 2
    dN3_dxi = (( 1)*(1+eta))/4  #shapefunction node 3
    dN4_dxi = ((-1)*(1+eta))/4  #shapefunction node 4

    return np.matrix([ [dN1_dxi,  dN2_dxi,  dN3_dxi,  dN4_dxi ],
                       [dN1_deta, dN2_deta, dN3_deta, dN4_deta] ])

#Material Matrix
def calculate_material_matrix(E, prxy):
    D = E/(1-prxy**2)*np.array([[1,prxy,0],
                  [prxy, 1, 0],
                  [0,0,(1-prxy)/2]])
    return D


# Jacobian
def calculate_jacobian(xi, eta, node_coords):
    dN = calculate_shapefunctions_derivatives(xi, eta)
    J = dN @ node_coords
    return J

# B-Matrix
def calculate_b_matrix(J, dN):
    J_inv = inv(J)
    dN_global = J_inv @ dN
    B = np.zeros((3, 8))  # 3 rows for strains, 8 columns for 4 nodes * 2 DOFs
    for i in range(4):  # Loop über Knoten
        B[0, 2*i] = dN_global[0, i] 
        B[1, 2*i+1] = dN_global[1, i] 
        B[2, 2*i] = dN_global[1, i]  
        B[2, 2*i+1] = dN_global[0, i]  
    return B


def comp_element_stiff_matrix_mem(id, node_coords, E, prxy, t):

    n_nodes = node_coords.shape[0]
    n_dof = 2

    ##initialize element stiffness matrix K_e
    K_e = np.zeros((n_nodes*n_dof,n_nodes*n_dof))

    ##Gauss Points (coordinates + weights)
    GP = [ [-0.577350269189626, -0.577350269189626],
           [ 0.577350269189626, -0.577350269189626],
           [ 0.577350269189626,  0.577350269189626],
           [-0.577350269189626,  0.577350269189626] ]
    WtFac = [1,1,1,1]
    
    D = calculate_material_matrix(E, prxy)

    for i in range(len(GP)):
        xi, eta = GP[i]
        weight = WtFac[i]

        # Jacobian and determinant
        J = calculate_jacobian(xi, eta, node_coords)
        det_J = det(J)

        # B-Matrix
        dN = calculate_shapefunctions_derivatives(xi, eta)
        B = calculate_b_matrix(J, dN)

        # Elementsteifigkeitsmatrix
        K_e += (B.T @ D @ B) * det_J * weight * t

    return K_e

element_stiffness = comp_element_stiff_matrix_mem(element_id, node_coordinates, E, prxy, t)

print (element_stiffness)
