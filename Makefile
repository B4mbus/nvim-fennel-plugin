project_name = PLACEHOLDER

src_dir = fnl
out_dir = lua
macro_dir = macros

src_files = $(shell find $(src_dir) -type f)
out_files = $(subst $(src_dir)/,$(out_dir)/,$(subst .fnl,.lua,$(src_files)))

compile: $(out_files)

lua/%.lua: $(src_dir)/%.fnl
	@echo Compiling $<
	@mkdir -p $(@D)
	@fennel --add-macro-path "$(macro_dir)"/?.fnl --compile $< > $@

clean:
ifeq ("$(wildcard $(out_dir))", "")
	@echo Nothing to do
else
	@echo Removing the output directory \"$(out_dir)\"...
	@rm -rf "$(out_dir)"
endif

.PHONY: clean compile run
