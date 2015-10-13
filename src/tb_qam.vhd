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

entity tb_qam is
end entity tb_qam;

architecture bhv of tb_qam is

	constant QAM_1_N	: natural := 1;
	constant QAM_1_DATA_LEN	: natural := 4**QAM_1_N;
	constant QAM_1_OUT_LEN	: natural := QAM_1_DATA_LEN / 2;
	signal qam_1_data	: std_ulogic_vector(QAM_1_DATA_LEN - 1 downto 0) := (others => '0');
	signal qam_1_in_phase	: sfixed(QAM_1_OUT_LEN - 1 downto 0);
	signal qam_1_quadrature	: sfixed(QAM_1_OUT_LEN - 1 downto 0);

begin

	qam_1: entity work.qam_mapper(rtl)
	generic map
	(
		n		=> QAM_1_N
	)
	port map
	(
		data		=> qam_1_data,
		in_phase	=> qam_1_in_phase,
		quadrature	=> qam_1_quadrature
	);

	stimu: process
	begin
		-- TODO: Set input
		wait for 2 ns;
		-- TODO: Check output
		assert false report "Simulation failed" severity error;

		assert false report "SIMULATION ENDED SUCCESSFULLY" severity note;
		wait;
	end process;

end architecture bhv;
