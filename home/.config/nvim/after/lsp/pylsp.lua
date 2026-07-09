
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pylsp
-- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
--
-- Defaults as of 2026-01:
-- - pylsp.plugins.autopep8.enabled:             true  -- formatting
-- - pylsp.plugins.flake8.enabled:               false
-- - pylsp.plugins.jedi_completion.enabled:      true
-- - pylsp.plugins.jedi_definition.enabled:      true
-- - pylsp.plugins.jedi_hover.enabled:           true
-- - pylsp.plugins.jedi_references.enabled:      true
-- - pylsp.plugins.jedi_signature_help.enabled:  true
-- - pylsp.plugins.jedi_symbols.enabled:         true
-- - pylsp.plugins.jedi_type_definition.enabled: true
-- - pylsp.plugins.mccabe.enabled:               true  -- complexity linter
-- - pylsp.plugins.preload.enabled:              true
-- - pylsp.plugins.pycodestyle.enabled:          true
-- - pylsp.plugins.pydocstyle.enabled:           false -- docstring style checking
-- - pylsp.plugins.pyflakes.enabled:             true  -- linter
-- - pylsp.plugins.pylint.enabled:               false
-- - pylsp.plugins.rope_completion.enabled:      false -- completions and renaming
-- - pylsp.plugins.yapf.enabled:                 true  -- formatting (preferred over autopep8)
return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = false -- use basedpyright instead, which respects pyproject.toml
        }
      }
    }
  }
}
