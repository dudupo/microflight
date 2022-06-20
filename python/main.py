import numpy
from stl import mesh

# Using an existing stl file:
your_mesh = mesh.Mesh.from_file('./newstl.stl') #'./new_stl_file.stl')

# print(your_mesh.points[0])

# Or creating a new mesh (make sure not to overwrite the `mesh` import by
# naming it `mesh`):
VERTICE_COUNT = 1000
data = numpy.zeros(VERTICE_COUNT, dtype=mesh.Mesh.dtype)
# your_mesh = mesh.Mesh(data, remove_empty_areas=False)

# The mesh normals (calculated automatically)
your_mesh.normals
# The mesh vectors

print(your_mesh.vectors[0])
# print(your_mesh.points[0].reshape(3,3))
# your_mesh.v0, your_mesh.v1, your_mesh.v2

# your_mesh.vectors = [  

#         [   [0, 2,0],
#             [0, 4,0],
#             [3, 4,0] ],
#         [   [3, 7,0],
#             [2, 8,0],
#             [11, 12,0] ],
#         [   [20, 32,0],
#             [19, 18,0],
#             [21, 20,0] ],

# ]

# def rect(p1,p2):
#     x1, y1, z1 = p1 
#     x2, y2, z2 = p2
    
#     return [[   [x1, y1, z1],
#                 [  ],
#             [  ] ],
#             [[  ],
#             [  ],
#             [  ] ]]

# for _ in range(20):
#     your_mesh.vectors[_] =  [[ 391.25903,  -83.16467, -230.     ],
#                             [ 391.25903,   83.16467, -230.     ],
#                             [ 400.,         0.,      -230.     ]]

# print(your_mesh.points[0])


# from stl import mesh
from mpl_toolkits import mplot3d
from matplotlib import pyplot

# # Create a new plot
figure = pyplot.figure()
axes = mplot3d.Axes3D(figure)

# # Load the STL files and add the vectors to the plot
# your_mesh = mesh.Mesh.from_file('./new_stl_file.stl')
axes.add_collection3d(mplot3d.art3d.Poly3DCollection(your_mesh.vectors))
# axes.add_collection3d(mplot3d.art3d.Poly3DCollection(your_mesh.points[:80].reshape(80,3,3)))

# # Auto scale to the mesh size
scale = your_mesh.points.flatten()
axes.auto_scale_xyz(scale, scale, scale)

# # Show the plot to the screen
pyplot.show()