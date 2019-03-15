defmodule TodosWeb.TodoView do
  use TodosWeb, :view

  def checked(todo) do
    if (todo.completed), do: "checked"
  end

  def clear_completed_style(todos) do
    if (Enum.count(todos, &(&1.completed == true)) == 0), do: "display: none;"
  end

  def completed_class(todo) do
    if (todo.completed), do: "completed"
  end

  def footer_style(todos) do
    if (Enum.count(todos) == 0), do: "display: none;"
  end
end
