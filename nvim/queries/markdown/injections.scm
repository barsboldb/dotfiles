; Override nvim-treesitter (frozen `master`) markdown injections, whose
; custom `#set-lang-from-info-string!` directive crashes Neovim 0.12's core
; treesitter highlighter (nil node in get_range). This mirrors Neovim's
; bundled query, which uses the info string as the injection language directly.
; No `; extends` modeline on purpose: this fully replaces the plugin's version.

(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
