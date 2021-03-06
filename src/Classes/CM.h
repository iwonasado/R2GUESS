/* This file is part of GUESS.
 *      Copyright (c) Marc Chadeau-Hyam (m.chadeau@imperial.ac.uk)
 *                    Leonardo Bottolo (l.bottolo@imperial.ac.uk)
 *                    David Hastie (d.hastie@imperial.ac.uk)
 *      2010
 *
 * GUESS is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * GUESS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GUESS.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef CM_H
#define CM_H

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iostream>
#include <vector>

#include <gsl/gsl_sort_vector.h>
#include <gsl/gsl_vector.h>

using namespace std;

class CM
{
 public:
  CM();
  ~CM(){};

  unsigned int n_max_breakpoint;
  vector < unsigned int  > list_CM_moves_enabled;
  vector < double > unit_move_pbty_cum;
  unsigned int n_possible_CM_moves;
  void set_CM(unsigned int k_max,
	      vector < unsigned int  > &list_CM_moves_enabled_from_read);

  void display_CM();
 
};

#endif /* !defined CM_H */
