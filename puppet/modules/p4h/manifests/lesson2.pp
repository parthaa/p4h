# Puppet for Hackers course module by James
# Copyright (C) 2013-2014+ James Shubin
# Written by James Shubin <james@shubin.ca>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# README: this is a module built for use with: Oh My Vagrant!

class p4h::lesson2() {

	file { '/root/README':
		content => "##lesson2
For this lesson, please do the following:
* Use the `inline_template` function	# optional, as it was covered in prep!
* Use the `notice` function -- what is the difference between this and notify ?
* Use the `regsubst` function -- highly useful for simple transformations
* Use the `sha1` function -- useful for occasionally transforming / hashing
* Use the `split` function -- highly useful -- why ?
* Use the `sprintf` function -- very useful
* Use the `template` function -- used most often with the file `type`

Bonus:
* Use the `shellquote` function -- occasionally it is useful
* Use the `versioncmp` function -- has been quite useful for certain modules

Happy hacking!\n",
	}
  $inliner = inline_template("Test <%= @hostname %>")
  notice("The value is: ${inliner}")
  $brian  = regsubst($inliner, '([^\\.]*)', '\1')
  notice("The value is: ${brian}")
  $sha = sha1("eric")
  notice("Sha1 eric : ${sha}")
  $splitted = split("5.6.7.8.9", ".")
  notice("splitted value ${splitted}")
  $sprinter = sprintf("%s is a genius %d", "Davidd", 1 )
  notice("sprinter ->  ${sprinter} ")

 file { '/tmp/david':
   ensure  => file,
   content => template('p4h/boo.erb'),
  }
}

# vim: ts=8
