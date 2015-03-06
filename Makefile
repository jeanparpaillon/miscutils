prefix = /usr/local
bindir = $(prefix)/bin
datadir = $(prefix)/share/utils

install_bin = install -o root -g root -m 755
install_data = install -o root -g root -m 644

programs = vm_clone vm_generate_ips
data = vm_modify.xsl

edit = sed -e \
	's,@bindir@,'$(bindir)',' \
	's,@datadir@,'$(datadir)','

all: $(programs)

%: %.in
	$(edit) < $< > $@

install: $(programs)
	mkdir -p $(bindir)
	for bin in $(programs); do \
	  $(install_bin) $$bin $(bindir); \
	done
	mkdir -p $(datadir)
	for data in $(data); do \
	  $(install_data) $$data $(datadir); \
	done

clean:
	-rm -f vm_clone
