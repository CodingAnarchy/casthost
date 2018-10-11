defmodule Casthost.Auth.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :casthost

  plug(Guardian.Plug.VerifySession, claims: %{typ: "access"})
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
end
