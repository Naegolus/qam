-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--                                                                         --
--  This file is part of the DE0 Nano Linux project                        --
--  http://www.de0nanolinux.com                                            --
--                                                                         --
--  Author(s):                                                             --
--      - Helmut, redrocket@gmx.at                                         --
--                                                                         --
-----------------------------------------------------------------------------
--                                                                         --
--  Copyright (C) 2015 Authors and www.de0nanolinux.com                    --
--                                                                         --
--  This program is free software: you can redistribute it and/or modify   --
--  it under the terms of the GNU General Public License as published by   --
--  the Free Software Foundation, either version 3 of the License, or      --
--  (at your option) any later version.                                    --
--                                                                         --
--  This program is distributed in the hope that it will be useful,        --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of         --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the           --
--  GNU General Public License for more details.                           --
--                                                                         --
--  You should have received a copy of the GNU General Public License      --
--  along with this program. If not, see <http://www.gnu.org/licenses/>.   --
--                                                                         --
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

entity qam_mapper is

	generic
	(
		n : natural := 1
	);
	port
	(
		data		: in  std_ulogic_vector(4**n - 1 downto 0);
		in_phase	: out sfixed(1 downto -(4**(n - 1) - 2));
		quadrature	: out sfixed(1 downto -(4**(n - 1) - 2))
	);

begin

	assert 		n >= 1
	report 		"QAM-Mapper: n must be at least 1"
	severity 	error;

end entity qam_mapper;

architecture rtl of qam_mapper is

	constant DATA_LEN	: natural := 4**n;
	constant OUT_LEN	: natural := 4**(n - 1);

	signal sig_in_phase	: sfixed(1 downto -(OUT_LEN - 2));
	signal sig_quadrature	: sfixed(1 downto -(OUT_LEN - 2));

begin

	sig_in_phase(1)   <= data(DATA_LEN - 1);
	sig_quadrature(1) <= data(DATA_LEN);

	comb_a: for i in 1 to OUT_LEN - 2 generate
		sig_in_phase  (1 - i) <= sig_in_phase  (0 - i) xor data(DATA_LEN - 1 - 2*i);
		sig_quadrature(1 - i) <= sig_quadrature(0 - i) xor data(DATA_LEN - 2 - 2*i);
	end generate;

	in_phase   <= sig_in_phase;
	quadrature <= sig_quadrature;

end architecture rtl;
