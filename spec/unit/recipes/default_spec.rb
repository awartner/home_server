#
# Cookbook Name:: home_server
# Spec:: default
#
# The MIT License (MIT)
#
# Copyright (c) 2016 Aaron M. Wartner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'spec_helper'

describe 'home_server::default' do
  context 'When all attributes are default, on Debian 9.0' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'debian', version: '9.0') do |node|
        node.override['backuppc']['cgi']['admin_pass'] = 'admin'
        node.override['backuppc']['cgi']['certificate'] = '/etc/nginx/ssl/fake.cert.pem'
        node.override['backuppc']['cgi']['certificate_key'] = '/etc/nginx/ssl/fake.key.pem'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
