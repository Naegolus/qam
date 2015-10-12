#!/bin/sh

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# --                                                                         --
# --  This file is part of the DE0_Nano_Linux project                        --
# --  http://www.de0nanolinux.com                                            --
# --                                                                         --
# --  Author(s):                                                             --
# --      - Helmut, redrocket@gmx.at                                         --
# --                                                                         --
# -----------------------------------------------------------------------------
# --                                                                         --
# --  Copyright (C) 2015 Authors and www.de0nanolinux.com                    --
# --                                                                         --
# --  This program is free software: you can redistribute it and/or modify   --
# --  it under the terms of the GNU General Public License as published by   --
# --  the Free Software Foundation, either version 3 of the License, or      --
# --  (at your option) any later version.                                    --
# --                                                                         --
# --  This program is distributed in the hope that it will be useful,        --
# --  but WITHOUT ANY WARRANTY; without even the implied warranty of         --
# --  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the           --
# --  GNU General Public License for more details.                           --
# --                                                                         --
# --  You should have received a copy of the GNU General Public License      --
# --  along with this program. If not, see <http://www.gnu.org/licenses/>.   --
# --                                                                         --
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

src_root=src

vlib work
vmap work work

# packages
vcom ${src_root}/pkg_global.vhd

# basic units
vcom ${src_root}/qam_mapper.vhd
vcom ${src_root}/qam_demapper.vhd

# testbench
vcom ${src_root}/tb_qam.vhd
