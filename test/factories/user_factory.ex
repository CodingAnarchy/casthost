defmodule Casthost.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %Casthost.Accounts.User{
          name: Faker.Name.name(),
          username: Faker.Internet.user_name(),
          password: "testing_password"
        }
      end
    end
  end
end
