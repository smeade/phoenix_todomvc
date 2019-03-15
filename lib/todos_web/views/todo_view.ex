defmodule TodosWeb.TodoView do
  use TodosWeb, :view

  def checked(todo) do
    if (todo.completed), do: "checked"
  end

  def clear_completed_style(completed_todos_count) do
    if (completed_todos_count == 0), do: "display: none;"
  end

  def completed_class(todo) do
    if (todo.completed), do: "completed"
  end

  def footer_style(active_todos_count) do
    if (active_todos_count == 0), do: "display: none;"
  end
end
