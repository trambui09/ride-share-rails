require "test_helper"

describe Trip do
  before do
    @passenger = Passenger.create(name: "Testing passenger",
                                  phone_num: "000-111-4567"
    )

    @driver = Driver.create(name: "Dr. Kenton Berge",
                            vin: "12345678901234567",
                            available: true
    )
  end
  let (:new_trip) {
    Trip.new(date: "2020-11-03", rating: 2, cost: 25.12, driver_id: @driver.id, passenger_id: @passenger.id )
  }
  it "can be instantiated" do
    # Your code here
    expect(new_trip.valid?).must_equal true
  end

  it "will have the required fields" do
    # Your code here
    # Arrange
    new_trip.save
    trip = Trip.first
    [:date, :rating, :passenger_id, :driver_id, :cost ].each do |field|
      expect(trip).must_respond_to field
    end
  end

  describe "relationships" do
    # Your tests go here
    it "belongs to one passenger" do
      new_trip.save
      # new_driver = Driver.create(name: "Kari", vin: "WBWSS52P9NEYLVDE9", available: true)
      # new_passenger = Passenger.create(name: "Test Pass", phone_num: "219-144-2635")

      # check with Jasmine to how write this test
      expect(new_trip.passenger.name).must_equal @passenger.name
      expect(new_trip.passenger.id).must_equal @passenger.id
      expect(new_trip.passenger.phone_num).must_equal @passenger.phone_num

    end

    it "belong to one driver" do
      new_trip.save

      # assert
      expect(new_trip.driver.name).must_equal @driver.name
      expect(new_trip.driver.vin).must_equal @driver.vin
      expect(new_trip.driver.available).must_equal @driver.available
    end




  end

  describe "validations" do
    # Your tests go here
    # do we have any validations for trip?
  end

  # Tests for methods you create should go here
  describe "custom methods" do
    # Your tests here
    # we don't have any custom methods for trip yet
  end
end
