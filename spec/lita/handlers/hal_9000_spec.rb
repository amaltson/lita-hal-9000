require "spec_helper"

describe Lita::Handlers::Hal9000, lita_handler: true do
  it { is_expected.to route_event(:unhandled_message) }
end
