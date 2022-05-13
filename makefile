# Makefile for controlling and running the postgres database
# Usage: $ make help

THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: help cleanup down destroy restart start stop logs ps build build-image pre-load-db make-pre-load-folder *.sql

# The variable to the path/files to create for the various different sample datasets
pathToSample = pg_sample_data/random/

# All of the files that we might need to download (excluded the
#	https, because it tends to confuse the targets in make)
SampleDataFiles = nextcloud.shoc.us/s/cz8SLKWYAfk9apa/download/001_SISO.sql nextcloud.shoc.us/s/NQKy2x2sCtj6f9e/download/002_MEPED.sql nextcloud.shoc.us/s/XroWygfKeFkwFFa/download/003_t_oil.sql nextcloud.shoc.us/s/ERqt2Dy9RsPCpwY/download/004_Meteorite_Landings.sql nextcloud.shoc.us/s/85rH3frrELjW3gq/download/005_Near-Earth_Comets_-_Orbital_Elements.sql nextcloud.shoc.us/s/2JPt7K4Pjx6wFeN/download/006_Extra-vehicular_Activity__EVA__-_US_and_Russia.sql nextcloud.shoc.us/s/K4EMtQ9RKkg8wwe/download/007-brfss_prevalence_data.sql

define skipFileMessage
	@echo "------------------------------------------------------\nSkipping $(1)\n"
endef
define downloadFile
	@echo "------------------------------------------------------\nDownloading $(1)"
	@wget --no-check-certificate -O ${pathToSample}$(notdir $(1)) https://$(strip ${1})
endef


help:
	@echo "Printing help for this make file, used to control/manage the postgresql database project"
	@make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

cleanup: down 
	rm -rf data && mkdir data
	rm -rf pg_sample_data/random/
	docker image rm h20/bi-postgres
down:
	docker-compose -f docker-compose.yml down $(c)
destroy:
	docker-compose -f docker-compose.yml down -v $(c)
restart: stop start
start: pre-load-db build
	docker-compose -f docker-compose.yml start $(c)
stop:
	docker-compose -f docker-compose.yml stop $(c)
logs:
	docker-compose -f docker-compose.yml logs --tail=100 -f $(c)
ps:
	docker-compose -f docker-compose.yml  ps
build: build-image
	docker-compose -f docker-compose.yml up -d $(c)
build-image: pre-load-db
	docker build -t h20/bi-postgres .
pre-load-db: $(SampleDataFiles)
make-pre-load-folder:
ifeq ($(wildcard ${pathToSample}),)
	@mkdir -p ${pathToSample}
endif
%.sql: make-pre-load-folder
	$(if $(wildcard $(strip $(addsuffix $(notdir $@),$(pathToSample)))), $(call skipFileMessage, $@),$(call downloadFile, $@))
