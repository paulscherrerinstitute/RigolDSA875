require stream

epicsEnvSet ("STREAM_PROTOCOL_PATH", "$(RigolDSA875_DIR):$(STREAM_PROTOCOL_PATH="")")

drvAsynIPPortConfigure("$(PORT=RIG1)", "$(IP):$(SCPI_PORT=5555)")

dbLoadTemplate("$(RigolDSA875_TEMPLATES)/SpectAnly.subs", "S=$(SYS), STRM_PORT=$(PORT)")
## END of configuration
