return {
  {
    'b0o/incline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local helpers = require('incline.helpers')
      local devicons = require('nvim-web-devicons')

      local generic_filenames = {
        'index', 'init', 'main', 'mod', 'lib',
        'README', 'LICENSE', 'Makefile',
      }

      local function is_generic_filename(filename)
        local name_without_ext = vim.fn.fnamemodify(filename, ':r')
        for _, generic in ipairs(generic_filenames) do
          if name_without_ext == generic then
            return true
          end
        end
        return false
      end

      local function get_filename_with_context(buf)
        local bufname = vim.api.nvim_buf_get_name(buf)
        local filename = vim.fn.fnamemodify(bufname, ':t')

        if filename == '' then
          return '[No Name]'
        end

        if is_generic_filename(filename) then
          local parent = vim.fn.fnamemodify(bufname, ':h:t')
          if parent ~= '' and parent ~= '.' then
            return parent .. '/' .. filename
          end
        end

        return filename
      end

      local function get_diagnostic_info(buf)
        local icons = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' ',
        }
        local severity_order = { 'error', 'warn', 'info', 'hint' }
        local colors = {
          error = '#ff5555',
          warn = '#ffb86c',
          info = '#8be9fd',
          hint = '#50fa7b',
        }

        local result = {
          has_diagnostics = false,
          highest_severity = nil,
          content = {},
        }

        for _, severity in ipairs(severity_order) do
          local count = #vim.diagnostic.get(buf, {
            severity = vim.diagnostic.severity[string.upper(severity)],
          })
          if count > 0 then
            result.has_diagnostics = true
            if not result.highest_severity then
              result.highest_severity = severity
            end
            table.insert(result.content, {
              icons[severity] .. count .. ' ',
              guifg = colors[severity],
            })
          end
        end

        return result
      end

      require('incline').setup({
        window = {
          padding = 0,
          margin = { horizontal = 1 },
          placement = {
            horizontal = 'right',
            vertical = 'bottom',
          },
        },
        highlight = {
          groups = {
            InclineNormal = {
              default = true,
              group = 'NormalFloat',
            },
            InclineNormalNC = {
              default = true,
              group = 'Comment',
            },
          },
        },
        render = function(props)
          local filename = get_filename_with_context(props.buf)
          local ft_icon, ft_color = devicons.get_icon_color(
            vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          )
          local modified = vim.bo[props.buf].modified
          local diagnostics = get_diagnostic_info(props.buf)

          local text_color = props.focused and '#eeeeee' or '#888888'
          local bg_color = props.focused and '#44406e' or '#2e2e3e'

          if diagnostics.has_diagnostics and diagnostics.highest_severity then
            local diag_colors = {
              error = '#ff5555',
              warn = '#ffb86c',
              info = '#8be9fd',
              hint = '#50fa7b',
            }
            text_color = props.focused
              and diag_colors[diagnostics.highest_severity]
              or helpers.contrast_color(diag_colors[diagnostics.highest_severity])
          end

          local content = {}

          if ft_icon then
            local icon_fg = props.focused and ft_color or '#666666'
            table.insert(content, { ' ', ft_icon, ' ', guifg = icon_fg })
          else
            table.insert(content, ' ')
          end

          if diagnostics.has_diagnostics and props.focused then
            for _, diag in ipairs(diagnostics.content) do
              table.insert(content, diag)
            end
          elseif diagnostics.has_diagnostics then
            local icons = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
            table.insert(content, {
              icons[diagnostics.highest_severity],
              guifg = '#666666',
            })
          end

          table.insert(content, {
            filename,
            guifg = text_color,
            gui = modified and 'bold,italic' or 'bold',
          })

          if modified then
            table.insert(content, { ' ●', guifg = '#ff9e64' })
          end

          table.insert(content, ' ')

          content.guibg = bg_color

          return content
        end,
      })
    end,
    event = 'VeryLazy',
  },
}
