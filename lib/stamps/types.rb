# -*- coding: utf-8 -*-
module Stamps
  module Types

    # TODO:  Need to figure out how to parse the wsdl file for types
    # instead of hard-coding them here
    PACKAGE = [
      'Postcard',
      'Letter',
      'Large envelope or flat',
      'Thick envelope',
      'Package',
      'Flat Rate Box',
      'Small Flat Rate Box',
      'Large Flat Rate Box',
      'Flat Rate Envelope',
      'Flat Rate Padded Envelope',
      'Large Package',
      'Oversized Package',
      'Regional Rate Box A',
      'Regional Rate Box B',
      'Legal Flat Rate Envelope',
      'Regional Rate Box C'].freeze

    SERVICE = {
      'US-FC'  => 'USPS First-Class Mail',
      'US-MM'  => 'USPS Media Mail',
      'US-PM'  => 'USPS Priority Mail',
      'US-BP'  => 'USPS BP',
      'US-LM'  => 'USPS LM',
      'US-XM'  => 'USPS Express Mail',
      'US-EMI' => 'USPS Express Mail International',
      'US-PMI' => 'USPS Priority Mail International',
      'US-FCI' => 'USPS First Class Mail International',
      'US-CM'  => 'USPS Critical Mail',
      'US-PS'  => 'USPS Parcel Select'
    }

    ADD_ONS = {
      'SC-A-HP'    => 'Hidden Postage',
      'SC-A-INS'   => 'Insurance',
      'SC-A-INSRM' => 'Insurance for Registered Mail',
      'US-A-CM'    => 'Certified Mail',
      'US-A-COD'   => 'Collect on Delivery',
      'US-A-COM'   => 'Certificate of Mailing',
      'US-A-DC'    => 'USPS Delivery Confirmation',
      'US-A-ESH'   => 'USPS Express - Sunday / Holiday Guaranteed',
      'US-A-INS'   => 'USPS Insurance',
      'US-A-NDW'   => 'USPS Express - No Delivery on Saturdays',
      'US-A-RD'    => 'Restricted Delivery',
      'US-A-REG'   => 'Registered Mail',
      'US-A-RR'    => 'Return Receipt Requested',
      'US-A-RRM'   => 'Return Receipt for Merchandise',
      'US-A-SC'    => 'USPS Signature Confirmation',
      'US-A-SH'    => 'Special Handling',
      'US-A-NND'   => 'Notice of non-delivery',
      'US-A-SR'    => 'Unknow Service Name SR',
      'US-A-RRE'   => 'Unknow Service Name RRE'
    }

    CARRIER_PICKUP_LOCATION = {
      'FrontDoor'             => 'Packages are at front door',
      'BackDoor'              => 'Packages are at back door',
      'SideDoor'              => 'Packages are at side door',
      'KnockOnDoorOrRingBell' => 'Knock on door or ring bell',
      'MailRoom'              => 'Packages are in mail room',
      'Office'                => 'Packages are in office',
      'Reception'             => 'Packages are at reception area',
      'InOrAtMailbox'         => 'Packages are in mail box',
      'Other'                 => 'Other Location'
    }

  end
end
