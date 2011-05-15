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
      'Oversized Package'].freeze

    SERVICE = {
      'US-FC'  => 'USPS First-Class Mail',
      'US-MM'  => 'USPS Media Mail',
      'US-PP'  => 'USPS Parcel Post',
      'US-PM'  => 'USPS Priority Mail',
      'US-XM'  => 'USPS Express Mail',
      'US-EMI' => 'USPS Express Mail International',
      'US-PMI' => 'USPS Priority Mail International',
      'US-FCI' => 'USPS First Class Mail International'
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
      'US-A-WDS'   => 'USPS Express - Waive Delivery Signature',
      'US-A-NDW'   => 'Do not Deliver on Saturday',
      'US-A-ESH'   => 'Sunday/Holiday Delivery Guaranteed',
      'US-A-NND'   => 'Notice of non-delivery',
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
