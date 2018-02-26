defmodule HabitsTwoWeb.LayoutView do
  use HabitsTwoWeb, :view

  def show_notification(conn, type, message) do
    conn
    |> flash_message(%{"#{type}" => message})
  end

  def flash_message(conn, %{"info" => message}) do
    if message do
      render "flash.html", class: "alert-primary", message: message
    end
  end

  def flash_message(conn, %{"error" => message}) do
    if message do
      render "flash.html", class: "alert-danger", message: message
    end
  end

  def flash_message(_), do: nil
end
