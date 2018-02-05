#
#    $HeadURL$
#
#    $LastChangedRevision$
#    $LastChangedDate$
#
#    $LastChangedBy$
#
#    Copyright (c) 2009,2010 California Institute of Technology.
#    All rights reserved.
#

FUSEKI_PID ?= $(WORKFLOW)/fuseki.pid
FUSEKI_LOG ?= $(WORKFLOW)/log/fuseki.log
FUSEKI_CONFIG ?= $(WORKFLOW_SOURCES)/etc/fuseki

clean:
	/bin/rm -rf $(WORKFLOW) $(FUSEKI_BASE)
	mkdir $(WORKFLOW)
	mkdir $(WORKFLOW)/artifacts
	mkdir $(WORKFLOW)/log


# Copy required files, and create directory target/workflow in the process
# if it does not already exist

$(WORKFLOW)/log4j.properties: $(WORKFLOW_SOURCES)/log4j.properties
	cp -p $< $@

$(WORKFLOW)/logging.properties: $(WORKFLOW_SOURCES)/logging.properties
	cp -p $< $@

.PHONY: start-fuseki stop-fuseki

$(WORKFLOW)/log:
	mkdir $@

$(FUSEKI_BASE):
	mkdir $@

start-fuseki: $(WORKFLOW)/log $(FUSEKI_BASE)
	cp -pv $(ETC)/fuseki/imce-ontologies.ttl $(FUSEKI_BASE)/config.ttl
	(cd $(FUSEKI_BASE); nohup $(FUSEKI_HOME)/fuseki-server --port=$(JENA_PORT) > $(FUSEKI_LOG) 2>&1 & echo $$! > $(FUSEKI_PID) )

stop-fuseki:
	[ -f $(FUSEKI_PID) ] && kill `cat $(FUSEKI_PID)` && rm $(FUSEKI_PID)
