RSpec::Matchers.define :validate_presence_of do |attribute|
  chain :with_message do |message|
    @message = message
  end

  match do |model|
    model.valid?

    @has_errors = model.errors.messages.key?(attribute)

    if @message
      @has_errors && model.errors[attribute].include?(@message)
    else
      @has_errors
    end
  end

  failure_message_for_should do |model|
    if @message
      "Validation errors #{model.errors[attribute].inspect} should include #{@message.inspect}"
    else
      "#{model.class} should have errors on attribute #{attribute.inspect}"
    end
  end

  failure_message_for_should_not do |model|
    "#{model.class} should not have an error on attribute #{attribute.inspect}"
  end
end

RSpec::Matchers.define :validate_uniqueness_of do |attribute|
  match do |model|
    model.class.stub!(:find).and_return(true)
    !model.valid? && model.errors.include?(attribute)
  end

  failure_message_for_should do |model|
    "#{model.class} should validate the uniqueness of #{attribute.inspect}"
  end

  failure_message_for_should_not do |model|
    "#{model.class} should not validate the uniqueness of #{attribute.inspect}"
  end
end

RSpec::Matchers.define :validate_numericality_of do |attribute|
  chain :with_restrictions do |options|
    @options = options
  end

  match do |model|
    model.send("#{attribute}=", "foobar")
    model.valid?

    @has_errors = model.errors.include?(attribute)
    if @options
      failures = []

      if @options[:greater_than_or_equal_to]
        model.send("#{attribute}=", @options[:greater_than_or_equal_to].to_i - 1)
        failures << (!model.valid? && model.errors.include?(attribute))
      end

      if @options[:less_than_or_equal_to]
        model.send("#{attribute}=", @options[:less_than_or_equal_to].to_i + 1)
        failures << (!model.valid? && model.errors.include?(attribute))
      end

      @has_errors = failures.reject{|x| x}.empty?
    else
      @has_errors
    end
  end

  failure_message_for_should do |model|
    if @options
      "#{attribute.inspect} should be restricted according to the criteria #{@options.inspect}"
    else
      "#{model.class} should validate the numericality of #{attribute.inspect}"
    end
  end

  failure_message_for_should_not do |model|
    if @options
      "#{attribute.inspect} should not be restricted according to the criteria #{@options.inspect}"
    else
      "#{model.class} should not validate the numericality of #{attribute.inspect}"
    end
  end
end

RSpec::Matchers.define :have_accessible do |attribute|
  match do |response|
    response.class.accessible_attributes.include?(attribute)
  end
  failure_message_for_should { ":#{attribute} should be accessible" }
  failure_message_for_should_not { ":#{attribute} should not be accessible" }
end
