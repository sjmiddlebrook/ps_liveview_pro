defmodule PsLiveviewPro.Repo do
  use Ecto.Repo,
    otp_app: :ps_liveview_pro,
    adapter: Ecto.Adapters.Postgres
end
