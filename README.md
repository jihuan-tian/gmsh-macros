# gmsh-macros
Macros for generating typical geometric models and their mesh with Gmsh

Gmsh is a three-dimensional finite element mesh generator. A model in Gmsh is defined using its Boundary Representation (BRep): a volume is bounded by a set of surfaces, a surface is bounded by a series of curves, and a curve is bounded by two end points. Although Gmsh supports OpenCASCADE kernel for geometric modeling, mesh generation from BRep models is more robust and reliable.

To ease the inconvenience during the creation of BRep models, this project holds a collection of macros written in Gmsh scripting language for generating typical geometric models and their mesh. With the help of these scripts, it is expected to improve the efficiency of Gmsh preprocessing in a FEM/BEM simulation.

Reference: http://gmsh.info/doc/texinfo/#Overview
