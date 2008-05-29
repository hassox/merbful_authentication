require File.join( File.dirname(__FILE__), "..", "spec_helper" )
gem "dm-core"  
require 'data_mapper'

describe "MA User Model" do
  
  before(:all) do
    DataMapper.setup(:default, 'sqlite3:///:memory:')
    Merb.stub!(:orm_generator_scope).and_return("datamapper")
    
    adapter_path = File.join( File.dirname(__FILE__), "..", "..", "lib", "merbful_authentication", "adapters")
    MA.register_adapter :datamapper, "#{adapter_path}/datamapper"
    MA.register_adapter :activerecord, "#{adapter_path}/activerecord"    
    MA.loaded
  end
  
  it_should_behave_like "A MerbfulAuthentication User Model"

end