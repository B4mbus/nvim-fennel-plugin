(import-macros {: greet} :test)
(local {: add} (require :nvim-fennel-plugin))

(greet :world)
(print (string.format "2 + 2 = %s" (add 2 2)))
