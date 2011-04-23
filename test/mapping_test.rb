$:.unshift File.dirname(__FILE__) # allows command line to execute tests
require 'helper'

class MappingTest < Test::Unit::TestCase

  context 'a new instance' do

    setup do
      @rate = Stamps::Mapping::Rate.new({
          :from_zip_code => '45440',
          :to_zip_code   => '45458',
          :weight_oz     => '7.8',
          :package_type  => 'Package',
          :service_type  => 'US-PM',
          :add_ons       => {
            :add_on => [
              { :amount  => '2.30', :type => 'US-A-RR' },
              { :amount  => '0.19', :type => 'US-A-DC' }
            ]
          }
        })
    end

    should 'map :to property fields' do
      assert_equal @rate.to_hash['FromZIPCode'], '45440'
      assert_equal @rate.to_hash['ToZIPCode'], '45458'
      assert_equal @rate.to_hash['WeightOz'], '7.8'
      assert_equal @rate.to_hash['PackageType'], 'Package'
      assert_equal @rate.to_hash['ServiceType'], 'US-PM'
    end

  end
end
