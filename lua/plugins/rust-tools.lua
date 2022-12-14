local opts = {
  tools = {
    autoSetHints = true,
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
      lifetimeElisionHints = {
        enable = true,
        useParameterNames = true
      },
    },
  },
  assist = {
    importEnforceGranularity = true,
    importPrefix = "crate"
  },
  cargo = {
    allFeatures = true
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "K", ":RustHoverActions<CR>", { buffer = bufnr })
    end,
    capabilities = capabilities,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        cargo = {
          buildScripts = {
            enable = true,
          }
        },
        checkOnSave = {
          command = "clippy"
        },
      }
    }
  },
}

require('rust-tools').setup(opts)
