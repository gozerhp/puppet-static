# Copyright 2015 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

# == Class: static
#
class static (
) {

  include apache
  include apache::mod::wsgi

  if !defined(A2mod['rewrite']) {
    a2mod { 'rewrite':
      ensure => present,
    }
  }

  if !defined(A2mod['proxy']) {
    a2mod { 'proxy':
      ensure => present,
    }
  }

  if !defined(A2mod['proxy_http']) {
    a2mod { 'proxy_http':
      ensure => present,
    }
  }

  file { '/srv/static':
    ensure => directory,
  }

}
