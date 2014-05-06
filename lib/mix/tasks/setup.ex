defmodule Mix.Tasks.Setup do
  use Mix.Task

  @shortdoc "Create admin user and lobby room"

  @moduledoc """
  A test task.
  """
  def run(_) do
    :application.ensure_all_started(:mogo_chat)
    admin_user = User.new(
        email: "admin@example.com",
        password: "password",
        name: "Admin",
        role: "admin",
        archived: false)
    |> User.encrypt_password()
    |> User.assign_auth_token()

    case User.validate(admin_user) do
      [] ->
        _saved_user = Repo.insert(admin_user)
        IO.puts "Created admin user with email admin@example.com and password \"password\" ~!"
      errors ->
        IO.puts "Error while creating admin user..."
        IO.puts errors
    end


    lobby = Room.new(name: "Lobby")
    case Room.validate(lobby) do
      [] ->
        _saved_room = Repo.insert(lobby)
        IO.puts "Created your first room called \"lobby\""
      errors ->
        IO.puts "Error while creating first room..."
        IO.puts errors
    end

    IO.puts ""
    IO.puts "*** DONE ***"
  end
end
