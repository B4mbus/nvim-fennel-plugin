project_name = nvim-fennel-plugin

src_dir = fnl
out_dir = lua
macro_dir = macros

src_files = $(shell find $(src_dir) -mindepth 1)
out_files = $(subst $(src_dir)/,$(out_dir)/,$(subst .fnl,.lua,$(src_files)))

compile: $(out_files)

lua/%.lua: $(src_dir)/%.fnl $(out_dir)
	@echo Compiling $<
	@fennel --add-macro-path "$(macro_dir)"/?.fnl --compile $< > $@

$(out_dir):
ifeq ("$(wildcard $(out_dir))", "")
	@echo Creating output directory - \"$(out_dir)\"...
	@mkdir -p "$(out_dir)" "$(out_dir)/$(project_name)"
endif

clean:
ifeq ("$(wildcard $(out_dir))", "")
	@echo Nothing to do
else
	@echo Removing the output directory \"$(out_dir)\"...
	@rm -rf "$(out_dir)"
endif

.PHONY: clean compile run
