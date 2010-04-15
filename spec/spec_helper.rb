require 'rubygems'
require 'fakeweb'

dir = File.expand_path(File.dirname(__FILE__))
require File.join(dir, '..', 'lib', 'guardian')

FakeWeb.allow_net_connect = false

{ :elections        => 'http://www.guardian.co.uk/politics/api/general-election/all/json',
  :election_2010    => 'http://www.guardian.co.uk/politics/api/general-election/2010/results/json',
  :candidates_2010  => 'http://www.guardian.co.uk/politics/api/general-election/2010/candidates/json'
  
}.each do |fixture, url|
  FakeWeb.register_uri :get, url, :body => File.read(File.join dir, 'fixtures', "#{fixture}.json")
end

