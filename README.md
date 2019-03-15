# Todos

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## SCRATCHPAD

<h1>Listing Todos</h1>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Completed</th>

      <th></th>
    </tr>
  </thead>
  <tbody>
<%= for todo <- @todos do %>
    <tr>
      <td><%= todo.title %></td>
      <td><%= todo.completed %></td>

      <td>
        <%= link "Show", to: Routes.todo_path(@conn, :show, todo) %>
        <%= link "Edit", to: Routes.todo_path(@conn, :edit, todo) %>
        <%= link "Delete", to: Routes.todo_path(@conn, :delete, todo), method: :delete, data: [confirm: "Are you sure?"] %>
      </td>
    </tr>
<% end %>
  </tbody>
</table>

<span><%= link "New Todo", to: Routes.todo_path(@conn, :new) %></span>


