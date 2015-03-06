prefix = /usr/local
bindir = $(prefix)/bin
datadir = $(prefix)/share/utils

install_bin = install -o root -g root -m 755
install_data = install -o root -g root -m 644

programs = vm_clone vm_generate_ips
data = vm_modify.xsl

V=0

gen_v = $(gen_v_$(V))
gen_v_ = 
gen_v_0 = @echo "       GEN" $@;

edit = sed \
	-e 's,@bindir@,'$(bindir)',' \
	-e 's,@datadir@,'$(datadir)','

all: $(programs)

vm_clone: vm_clone.in
	$(gen_v) $(edit) < $< > $@
	@chmod 755 $@

install: $(programs)
	@mkdir -p $(bindir)
	@for bin in $(programs); do \
	  echo " INSTALL" $$bin; $(install_bin) $$bin $(bindir); \
	done
	@mkdir -p $(datadir)
	@for d in $(data); do \
	  echo " INSTALL" $$d; $(install_data) $$d $(datadir); \
	done

clean:
	-rm -f vm_clone
