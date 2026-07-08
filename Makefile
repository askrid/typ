TYPST      ?= typst
SRC_DIR    ?= src
OUT_DIR    ?= out
FONT_DIR   ?= fonts
ROOT       ?= .

# Extra flags passed to `typst compile`
TYPST_FLAGS ?=

FONT_FLAG := $(if $(wildcard $(FONT_DIR)),--font-path $(FONT_DIR),)
COMMON    := --root $(ROOT) $(FONT_FLAG) $(TYPST_FLAGS)

SOURCES := $(shell find $(SRC_DIR) -name '*.typ' 2>/dev/null)
PDFS    := $(patsubst $(SRC_DIR)/%.typ,$(OUT_DIR)/%.pdf,$(SOURCES))

.PHONY: all watch open png fmt clean list

all: $(PDFS)

$(OUT_DIR)/%.pdf: $(SRC_DIR)/%.typ
	@mkdir -p $(dir $@)
	$(TYPST) compile $(COMMON) $< $@

watch:
	@test -n "$(F)" || { echo "usage: make watch F=src/file.typ"; exit 1; }
	$(TYPST) watch $(COMMON) $(F) $(OUT_DIR)/$(patsubst $(SRC_DIR)/%.typ,%.pdf,$(F))

open: $(OUT_DIR)/$(patsubst $(SRC_DIR)/%.typ,%.pdf,$(F))
	@test -n "$(F)" || { echo "usage: make open F=src/file.typ"; exit 1; }
	@open "$(OUT_DIR)/$(patsubst $(SRC_DIR)/%.typ,%.pdf,$(F))"

fmt:
	@command -v typstfmt >/dev/null 2>&1 || { echo "typstfmt not installed; skipping"; exit 0; }
	@find $(SRC_DIR) lib templates -name '*.typ' 2>/dev/null | xargs -r typstfmt

clean:
	rm -rf $(OUT_DIR)

list:
	@echo "$(SOURCES)" | tr ' ' '\n'
