# TODO

- [x] improve lsp configuration (see lsp-zero documentation)
- [ ] improve "ui"
  - [ ] lsp borders
  - [x] lsp errors
  - [ ] filetree errors

# Setup explanation

## Package manager

The current package manager is Lazy. It is setup as follows:

- The `init.lua` file initializes Lazy
- Lazy cycles through every file in the lua/plugins directory. Each of these files returs a table with the configurations of one of more plugins.

## LSP setup

> [!WARNING] Note to self
> Do not touch the LSP configuration! Please...

### Installing an LSP

_Mason_ plugin is used to install different LSPs, as well as Linters, DAP and Formatters.
The _Mason_ plugin is configured in its own file, since this configuration is used also by the debbuger and _NoneLs_. All that configuration does in ensure certain LSPs are installed.

For LSP to play nice with Mason, _mason-lspconfig.nvim_ plugin is used. This plugin has to be setup before the setup of the rest of the LSPs. For that reason, it is setup in the `lsp.lua` file.

To setup a new LSP, use _Mason_ (`:Mason`) to install the desired LSP. Then, in the `lsp.lua` file, add a line calling the LSP setup function for that LSP. Eg.:

```lua
lspconfig.lua_ls.setup({})
```

### Completion

Completion is setup with the _nvim-cmp_ and _cmp-nvim-lsp_ plugins. Some of the config for _cmp-nvim-lsp_ must be done before the rest of the LSP setup, which is why all the completion setup is also done in the `lsp.lua` file.

The used snippet engine is _luasnip_, which allows for easy integration with vscode snippets, _friendly-snippets_ (which brings some really usefull snippets for html). Note that these snippets require the _cmp_luasnip_ plugin.

## Formatting / linting

_NoneLS_ is used for formatting and linting, whith _Mason_ being used to install all the formatters and linters.

To add a new formatter or linter, add a line to the setup table in the `nonels.lua` file, for eg.:

```lua
null_ls.builtins.formatting.prettier,
null_ls.builtins.diagnostics.eslint_d,
```

(*none-ls* is a fork of *null_ls* and keeps all the bindings, which is why we use `null_ls` properties)

## Keybindings

Most keybindings are setup in the plugins config functions they are associated to. Generic keybindings not related to any plugin are setup in the `vim-options.lua` file. (Note: this file may need to be broken down, if it grows).

Keybindings are generaly prefixed with the `<leader>` key, which is configured to be " " (`<space>`), followed by a key that relates to the function.

*Whichkey* is a usefull plugin to help find keybindings. In normal mode, when starting a keybinding, a popup will appear with the possible keys to follow up with.

