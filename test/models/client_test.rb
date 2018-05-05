require 'test_helper'

class ClientTest < ActiveSupport::TestCase

    def setup
        @client = Client.new(first_name: "Usuario",
                             last_name: "Ejemplo",
                             email: "usuario.ejemplo@mail.com",
                             address: "44 Shirley Ave. West Chicago, IL 60185",
                             phone: 1234567891,
                             rut: 18461592)
    end

    test "should be valid" do
        assert @client.valid?
    end
end
