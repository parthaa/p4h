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

class p4h::lesson3() {

	file { '/root/README':
		content => "##lesson3
For this lesson, please do the following:
* Know about the `concat`, `count`, `delete`, `flatten`, `getvar`, `has_key`,
`join`, `keys`, `member`, `merge`, `parseyaml` and `type` functions from stdlib

Bonus:
* Can you think about what `getvar` is useful for ?
* Can you think about what `parseyaml` could be useful for ?

Happy hacking!\n",
	}

 $foo = concat(['2','4'], '3')
 notice("test")
 notice(inline_template("<%= @foo.inspect %>"))
 $count = count($foo)
 notice("Count ${count}")
 $deleted = delete($foo, 2)
 notice(inline_template("<%= @deleted.inspect %>"))

 $flattened = flatten(['a', ['1', ['2']]])
 notice(inline_template("Flattened => <%= @flattened.inspect %>"))

 $hash = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}

 if has_key($hash, 'a') {
    notice("great!! has key")
  }

 if has_key($hash, 'x') {
    notice("boo!! has key")
  }

 notice(join($foo, ":::"))
 notice(join(keys($hash), ":::"))

 if member($foo, "3") {
  notice("3 is a member")
 }


 if member($foo, "32") {
  notice("Boo !! 32 is not a member")
 }

 $merged = merge($hash, {'d' => 100})
 notice(inline_template("Merged => <%= @merged.inspect %>"))

 $parsed = parseyaml(inline_template("<%= @merged.to_yaml %>"))

 if keys($parsed) == keys($merged) {
  notice("Yaay !  parsed keys are equal")
 }
 else {
   notice("Boo! parsed keys are not equal")
   notice(inline_template("parsed => <%= @parsed.inspect %>"))
   notice(inline_template("Merged => <%= @merged.inspect %>"))
 }

 $tp = type($hash)
 notice("$hash is of type ${tp}")

}

# vim: ts=8
