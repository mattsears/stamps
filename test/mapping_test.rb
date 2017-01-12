$:.unshift File.dirname(__FILE__) # allows command line to execute tests
require 'helper'

class MappingTest < Test::Unit::TestCase

  context 'a new instance' do

    setup do
      @params = {
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
        }
      @rate = Stamps::Mapping::Rate.new(@params)
    end

    should 'map :to property fields' do
      assert_equal @rate.to_hash['FromZIPCode'], '45440'
      assert_equal @rate.to_hash['ToZIPCode'], '45458'
      assert_equal @rate.to_hash['WeightOz'], '7.8'
      assert_equal @rate.to_hash['PackageType'], 'Package'
      assert_equal @rate.to_hash['ServiceType'], 'US-PM'
    end

    context 'with add_ons' do
      setup do
        @add_ons = [
          { add_on_type: "US-A-DC" },
          { amount: '3.3', add_on_type: "US-A-SC" }
        ]
        @expected = [
          { "AddOnType" => "US-A-DC" },
          { "Amount" => "3.3", "AddOnType" => "US-A-SC" }
        ]
      end

      context 'a rate with add_on_v4 add-ons' do
        setup do
          @params[:add_ons] = { add_on_v4: @add_ons}
          @rate = Stamps::Mapping::Rate.new(@params)
        end

        should 'map add_ons to AddOnsV4' do
          assert_equal @rate.to_hash['AddOns'], { "AddOnV4" => @expected }
        end
      end

      context 'a rate with add_on_v5 add-ons' do
        setup do
          @params[:add_ons] = { add_on_v5: @add_ons}
          @rate = Stamps::Mapping::Rate.new(@params)
        end

        should 'map add_ons to AddOnsV5' do
          assert_equal @rate.to_hash['AddOns'], { "AddOnV5" => @expected }
        end
      end
    end
  end

end
