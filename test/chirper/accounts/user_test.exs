defmodule Chirper.Accounts.UserTest do
  use Chirper.DataCase

  alias Chirper.Repo
  alias Chirper.Accounts.User

  describe "users" do
    test "Changeset is not valid when email and name are not present" do
      changeset = User.changeset(%User{})
      refute changeset.valid?
      assert %{name: ["can't be blank"]} = errors_on(changeset)
      assert %{email: ["can't be blank"]} = errors_on(changeset)
      assert %{password: ["can't be blank"]} = errors_on(changeset)
    end

    test "User.changeset/2 not valid when name is blank" do
      chg =
        User.changeset(%User{}, %{email: "s@example.com", name: "      ", password: "secretpass"})

      refute chg.valid?
      assert %{name: ["can't be blank"]} = errors_on(chg)
    end

    test "User.changeset/2 not valid without a valid email" do
      chg =
        User.changeset(%User{}, %{email: "sexample.com", name: "DemoSan", password: "secretpass"})

      refute chg.valid?
      assert %{email: ["has invalid format"]} = errors_on(chg)
    end

    test "User.changeset/2 not valid length" do
      chg =
        User.changeset(%User{}, %{email: "s@example.com", name: "Demo", password: "secretpass"})

      refute chg.valid?
      assert %{name: ["should be at least 6 character(s)"]} = errors_on(chg)
    end

    test "User.changeset/2 is not valid for existing email" do
      chg =
        User.changeset(%User{}, %{email: "s@example.com", name: "DemoSan", password: "secretpass"})

      Repo.insert(chg)

      chg =
        User.changeset(%User{}, %{
          email: "S@example.COM",
          name: "Demo San",
          password: "secretpass"
        })

      {:error, changeset} = Repo.insert(chg)
      refute changeset.valid?
      assert %{email: ["has already been taken"]} = errors_on(changeset)
    end

    test "User.changeset/2 updates valid user" do
      chg =
        User.changeset(%User{}, %{email: "s@example.com", name: "DemoSan", password: "secretpass"})

      {:ok, user} = Repo.insert(chg)
      changeset = user |> User.changeset(%{name: "Demo San"})
      assert changeset.valid?
      assert {:ok, updated_user} = Repo.update(changeset)
    end
  end
end
