local status_ok, noice = pcall(require, "noice")
if not status_ok then
  return
end

noice.setup {
  {
    messages = {
      enabled = true, -- enables the Noice messages UI
    },
    popupmenu = {
      enabled = true, -- enables the Noice popupmenu UI
      ---@type 'nui'|'cmp'
      backend = "nui", -- backend to use to show regular cmdline completions
    },
    ---@type NoiceRouteConfig
    history = {
      -- options for the message history that you get with `:Noice`
      view = "split",
      opts = { enter = true, format = "details" },
      filter = { event = { "msg_show", "notify" }, ["not"] = { kind = { "search_count", "echo" } } },
    },
    notify = {
      -- Noice can be used as `vim.notify` so you can route any notification like other messages
      -- Notification messages have their level and other properties set.
      -- event is always "notify" and kind can be any log level as a string
      -- The default routes will forward notifications to nvim-notify
      -- Benefit of using Noice for this is the routing and consistent history view
      enabled = true,
    },
    lsp_progress = {
      enabled = false,
      -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
      -- See the section on formatting for more details on how to customize.
      --- @type NoiceFormat|string
      format = "lsp_progress",
      --- @type NoiceFormat|string
      format_done = "lsp_progress_done",
      throttle = 1000 / 30, -- frequency to update lsp progress message
    },
  },
}
