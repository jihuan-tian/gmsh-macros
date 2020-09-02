// Copyright (C) 2020 Jihuan Tian <jihuan_tian@hotmail.com>
//  
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//  
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//  
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
//  

_sphere_radius = 1;
_sphere_center_x = 0;
_sphere_center_y = 0;
_sphere_center_z = 0;
_sphere_surface_orient = 1;
_sphere_element_size = 0.1;
//+ Sphere model dimension: 0 for points, 1 for lines and line loops, 2 for surfaces and surface loops, 3 for volume.
_sphere_model_dim = 3;

Function CreateSphere

If (_sphere_model_dim >= 0)
  _sphere_start_point_index = newp - 1;

  // Origin
  Point(_sphere_start_point_index + 1) = {_sphere_center_x, _sphere_center_y, _sphere_center_z, _sphere_element_size};
  // Top
  Point(_sphere_start_point_index + 2) = {_sphere_center_x, _sphere_center_y, _sphere_center_z + _sphere_radius, _sphere_element_size};
  // Bottom
  Point(_sphere_start_point_index + 3) = {_sphere_center_x, _sphere_center_y, _sphere_center_z - _sphere_radius, _sphere_element_size};
  // Right
  Point(_sphere_start_point_index + 4) = {_sphere_center_x, _sphere_center_y + _sphere_radius, _sphere_center_z, _sphere_element_size};
  // Left
  Point(_sphere_start_point_index + 5) = {_sphere_center_x, _sphere_center_y - _sphere_radius, _sphere_center_z, _sphere_element_size};
  // Front
  Point(_sphere_start_point_index + 6) = {_sphere_center_x + _sphere_radius, _sphere_center_y, _sphere_center_z, _sphere_element_size};
  // Back
  Point(_sphere_start_point_index + 7) = {_sphere_center_x - _sphere_radius, _sphere_center_y, _sphere_center_z, _sphere_element_size};
EndIf

If (_sphere_model_dim >= 1)
  // Create circles
  // N.B. A maximum circle arc with Pi radian can be created by using the Circle command.
  _sphere_start_line_index = newl - 1;
  Circle(_sphere_start_line_index + 1) = { _sphere_start_point_index + 2, _sphere_start_point_index + 1, _sphere_start_point_index + 4 };
  Circle(_sphere_start_line_index + 2) = { _sphere_start_point_index + 2, _sphere_start_point_index + 1, _sphere_start_point_index + 5 };
  Circle(_sphere_start_line_index + 3) = { _sphere_start_point_index + 2, _sphere_start_point_index + 1, _sphere_start_point_index + 6 };
  Circle(_sphere_start_line_index + 4) = { _sphere_start_point_index + 2, _sphere_start_point_index + 1, _sphere_start_point_index + 7 };
  Circle(_sphere_start_line_index + 5) = { _sphere_start_point_index + 3, _sphere_start_point_index + 1, _sphere_start_point_index + 4 };
  Circle(_sphere_start_line_index + 6) = { _sphere_start_point_index + 3, _sphere_start_point_index + 1, _sphere_start_point_index + 5 };
  Circle(_sphere_start_line_index + 7) = { _sphere_start_point_index + 3, _sphere_start_point_index + 1, _sphere_start_point_index + 6 };
  Circle(_sphere_start_line_index + 8) = { _sphere_start_point_index + 3, _sphere_start_point_index + 1, _sphere_start_point_index + 7 };
  Circle(_sphere_start_line_index + 9) = { _sphere_start_point_index + 6, _sphere_start_point_index + 1, _sphere_start_point_index + 4 };
  Circle(_sphere_start_line_index + 10) = { _sphere_start_point_index + 4, _sphere_start_point_index + 1, _sphere_start_point_index + 7 };
  Circle(_sphere_start_line_index + 11) = { _sphere_start_point_index + 7, _sphere_start_point_index + 1, _sphere_start_point_index + 5 };
  Circle(_sphere_start_line_index + 12) = { _sphere_start_point_index + 5, _sphere_start_point_index + 1, _sphere_start_point_index + 6 };

  _sphere_start_line_loop_index = newll - 1;

  Line Loop(_sphere_start_line_loop_index + 1) = { _sphere_start_line_index + 4, _sphere_start_line_index + 11, -(_sphere_start_line_index + 2) };
  Line Loop(_sphere_start_line_loop_index + 2) = { _sphere_start_line_index + 2, _sphere_start_line_index + 12, -(_sphere_start_line_index + 3) };
  Line Loop(_sphere_start_line_loop_index + 3) = { _sphere_start_line_index + 3, _sphere_start_line_index + 9, -(_sphere_start_line_index + 1) };
  Line Loop(_sphere_start_line_loop_index + 4) = { _sphere_start_line_index + 1, _sphere_start_line_index + 10, -(_sphere_start_line_index + 4) };
  Line Loop(_sphere_start_line_loop_index + 5) = { _sphere_start_line_index + 8, _sphere_start_line_index + 11, -(_sphere_start_line_index + 6) };
  Line Loop(_sphere_start_line_loop_index + 6) = { _sphere_start_line_index + 6, _sphere_start_line_index + 12, -(_sphere_start_line_index + 7) };
  Line Loop(_sphere_start_line_loop_index + 7) = { _sphere_start_line_index + 7, _sphere_start_line_index + 9, -(_sphere_start_line_index + 5) };
  Line Loop(_sphere_start_line_loop_index + 8) = { _sphere_start_line_index + 5, _sphere_start_line_index + 10, -(_sphere_start_line_index + 8) };
EndIf

If (_sphere_model_dim >= 2)
  _sphere_start_surface_index = news - 1;

  For _sphere_i In {1:4}
    Ruled Surface(_sphere_start_surface_index + _sphere_i) = _sphere_surface_orient * { _sphere_start_line_loop_index + _sphere_i} In Sphere { _sphere_start_point_index + 1};
  EndFor

  For _sphere_i In {5:8}
    Ruled Surface(_sphere_start_surface_index + _sphere_i) = _sphere_surface_orient * { -(_sphere_start_line_loop_index + _sphere_i)} In Sphere { _sphere_start_point_index + 1};
  EndFor

  _sphere_surface_loop_index = newsl;
  Surface Loop(_sphere_surface_loop_index) = {_sphere_start_surface_index + 1:_sphere_start_surface_index + 8};
EndIf

If (_sphere_model_dim == 3)
  _sphere_start_volume_index = newv - 1;
  Volume(_sphere_start_volume_index + 1) = {_sphere_surface_loop_index};
EndIf

Return
