Stamps
==========

** Work in Progress **

Stamps is Stamps.com backed library for creating shipping labels,
calculate the shipping cost of packages, standardize domestic
addresses via USPS CASS certified Address Matching Software, and track
shipments.

Pre-requisites
----------
Register for the Stamps.com [Developer
Program](http://developer.stamps.com/developer) to receive you free
test account.

Sample Workflow
----------

1. Standardize Shipping Address - Ship-to addresses must be
standardized based on USPS rules for proper address conventions before
a shipping label can be issued.

2. Get Rates - allow users to view and select the best shipping
service for their needs.

3. Generate the Shipping Label - after choosing a shipping
service and ship-to address is standardized, the `Stamps.create` method
will generate the indicium required to ship the item. If
the customer changes their mind, they may want to select an option
that initiates a `Stamps.cancel`. `Stamps.cancel` refunds postage and
voids the shipping label.

4. Print the Shipping Label - Call the returned URL to obtain the shipping label image.
A URL is returned by the `Stamps.create` call in the :url item. The
integration will connect to this URL to retrieve their shipping label
and customs forms for printing.

Getting Started
----------
Once you have a test account with integration id, we can simple pass
them to the configure block:

    # Authenticate you stamps.com credentials
    Stamps.configure do |config|
      config.integration_id = 'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXXX'
      config.username       = 'STAMPS USERNAME'
      config.password       = 'STAMPS PASSWORD'
    end

Now we can now be able to retrieve information about our account:

    Stamps.account

Standardized Shipping Address
----------
Standardizes shipping address that complies with the USPS address
formatting guidelines

    standardized_address = Stamps.clean_address(
      :address => {
        :full_name => 'The White House',
        :address1  => '1600 Pennsylvania Avenue, NW',
        :city      => 'Washington',
        :state     => 'DC',
        :zip_code  => '20500'
    })

Get Rates
----------
To get a list of rates for all available USPS services based on the
ZIP Code or the foreign country being shipped to for a given package
weight and size.

    rates = Stamps.get_rates(
      :from_zip_code => '45440',
      :to_zip_code   => '20500',
      :weight_lb     => '0.5',
      :ship_date     => '2011-04-07'
    )

Creating a shipping label
----------
To generate the postage based on the shipping information provided in the request.
The `create!` method will return a URL that references either an image of the
domestic shipping label or a multi-page PDF document for international
labels with customs forms.

    stamp = Stamps.create!(
        :tracking_number => true,
        :rate          => rates.first,
        :to            => standardized_address,
        :from => {
          :full_name   => 'Littlelines',
          :address1    => '50 Chestnut Street',
          :address2    => 'Suite 234',
          :city        => 'Beavervcreek',
          :state       => 'OH',
          :zip_code    => '45440'
        },
        :memo => 'Thanks for shopping with us!'
    )

Now we can view or print the postage label:

    stamp.url

Installation Stamps
----------
First install the gem

    gem install stamps










