defmodule ChirperWeb.LayoutView do
  use ChirperWeb, :view

  def title("about.html"), do: build_title("About")
  def title("home.html"), do: build_title("Home")
  def title("help.html"), do: build_title("Help")
  def title("contact.html"), do: build_title("Contact")

  def title(_), do: "Chirper"

  defp build_title(page) do
    "#{page} | Chirper"
  end
end
