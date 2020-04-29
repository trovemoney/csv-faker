#!/usr/bin/env ruby

require 'ffaker'
require 'rubystats'

# init random generator to get reproducible data
FFaker::Random.seed = 12345

line = ''
delimiter = ','
i = 1
max = ARGV[0].to_i

if max < 1
  abort 'usage: ruby make-csv.rb 100'
end

def random_normal_dist(m, s, min, max)
  gen = Rubystats::NormalDistribution.new(m, s)
  begin
    y = gen.rng.to_i
  end until (y >= min && y <=max)
  y
end

while i <= max do


  # Account Name
  firstName = FFaker::NameIT.first_name
  lastName = FFaker::NameIT.last_name

  line << firstName + ' ' + lastName
  line << delimiter

  # Person Account: Title
  titles = ['Mr','Ms','Dr','Don']
  line << titles.sample
  line << delimiter

  # Person Account: First Name
  line << firstName
  line << delimiter

  # Person Account: Last Name
  line << lastName
  line << delimiter

  # UDID
  line << fn = FFaker::Guid.guid
  line << delimiter

  # Device Type
  deviceType = ['IOS','Android']
  line << deviceType.sample
  line << delimiter

  # Accepted T&C
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # TroveAccountId
  line << fn = FFaker::Guid.guid
  line << delimiter

  # Person Account: Mobile
  line << fn = FFaker::PhoneNumberAU.mobile_phone_number
  line << delimiter

  # Person Account: Email
  line << fn = FFaker::Internet.safe_email
  line << delimiter

  # Birth Date
  birthday = Date.today - rand(365*70) - 16*365
  line << birthday.to_s
  line << delimiter

  # Person Account: Mailing Street
  buildingNumber = FFaker::AddressAU.building_number
  street = FFaker::AddressAU.street_name
  line << buildingNumber + ' ' + street
  line << delimiter

  # Person Account: Mailing Address Line1
  line << fn = FFaker::AddressAU.secondary_address
  line << delimiter

  # Person Account: Mailing Address Line2
  line << fn = FFaker::AddressAU.suburb
  line << delimiter

  # Person Account: Mailing City
  line << fn = FFaker::AddressAU.city
  line << delimiter

  # Person Account: Mailing State/Province
  line << fn = FFaker::AddressAU.state
  line << delimiter

  # Person Account: Mailing Zip/Postal Code
  line << fn = FFaker::AddressAU.postcode
  line << delimiter

  # Person Account: Mailing Country
  line << "New Zealand"
  line << delimiter

  # Address Lookup
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Age Income
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Confirm Investments
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Email Pass
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # First Deposit
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Goal Reach
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Goal Split
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Id Method
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Id Pending
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Id Verified
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Personal Details
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Select Goals
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Terms
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Email Verified
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Income
  line << rand(30000..250000).to_s
  line << delimiter

  # IRD Number
  line << rand.to_s[2..9]
  line << delimiter

  # PIR
  pirRate = [0.105, 0.175, 0.28]
  line << pirRate.sample.to_s
  line << delimiter

  # Risk Profile
  line << rand(1..5).to_s
  line << delimiter

  # Tax Resident
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Person Account: Email Opt Out
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Description
  cheesy = FFaker::CheesyLingo.word
  title = FFaker::Book.title
  line << cheesy + ' ' + title
  line << delimiter

  # Person Account: Mobile Opt Out
  line << fn = FFaker::Boolean.random.to_s
  line << delimiter

  # Account Source
  source = ['Website','Adviser']
  line << source.sample
  line << delimiter

  # Account Record Type
  line << 'On-boarding'

  puts line
  line = ''
  i += 1
end
