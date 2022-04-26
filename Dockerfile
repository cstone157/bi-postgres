FROM postgres:12.10

# Possible values for the enviroment variable (DATA_SET), to be used to pre-load our database
#   all - everything (default)
#   parametric
#   t_oil
#   data_gov

# if DATA_SET is null, set it to 'all' (or leave as is otherwise).
ENV DATA_SET=${DATA_SET:-all}

# Delete our left over sample_data.sql
RUN mkdir preloaded_data

# COPY ALL OF OUR DATA_SHEETS OVER (We copy all of them over since there's no conditional COPY)
COPY ./pg_sample_data/001_SISO.sql /preloaded_data/
COPY ./pg_sample_data/002_MEPED.sql /preloaded_data/
COPY ./pg_sample_data/003_t_oil.sql /preloaded_data/
COPY ./pg_sample_data/004_Meteorite_Landings.sql /preloaded_data/
COPY ./pg_sample_data/005_Near-Earth_Comets_-_Orbital_Elements.sql /preloaded_data/
COPY ./pg_sample_data/006_Extra-vehicular_Activity__EVA__-_US_and_Russia.sql /preloaded_data/
#COPY ./pg_sample_data/007-Behavioral_Risk_Factor_Surveillance_System__BRFSS__Prevalence_Data__2011_to_present.sql /preloaded_data/
COPY ./pg_sample_data/007-brfss_prevalence_data.sql /preloaded_data/

# RUN touch /preloaded_data/sample_data.sql


# Conditionally copy, the different data-sets as requested by the enviroment variables
# PARAMETRIC COPY
RUN if [ "$DATA_SET" = "all" ]          ; then cp /preloaded_data/001_SISO.sql  /docker-entrypoint-initdb.d/001_SISO.sql ; fi
RUN if [ "$DATA_SET" = "parametric" ]   ; then cp /preloaded_data/001_SISO.sql  /docker-entrypoint-initdb.d/001_SISO.sql ; fi
RUN if [ "$DATA_SET" = "all" ]          ; then cp /preloaded_data/002_MEPED.sql  /docker-entrypoint-initdb.d/002_MEPED.sql ; fi
RUN if [ "$DATA_SET" = "parametric" ]   ; then cp /preloaded_data/002_MEPED.sql  /docker-entrypoint-initdb.d/002_MEPED.sql ; fi

# T_OIL COPY
RUN if [ "$DATA_SET" = "all" ]      ; then cp /preloaded_data/003_t_oil.sql  /docker-entrypoint-initdb.d/003_t_oil.sql ; fi
RUN if [ "$DATA_SET" = "t_oil" ]    ; then cp /preloaded_data/003_t_oil.sql  /docker-entrypoint-initdb.d/003_t_oil.sql ; fi

# Add all the sample data_gov sets
RUN if [ "$DATA_SET" = "all" ]      ; then cp /preloaded_data/004_Meteorite_Landings.sql /docker-entrypoint-initdb.d/004_Meteorite_Landings.sql ; fi
RUN if [ "$DATA_SET" = "data_gov" ] ; then cp /preloaded_data/004_Meteorite_Landings.sql /docker-entrypoint-initdb.d/004_Meteorite_Landings.sql ; fi
RUN if [ "$DATA_SET" = "all" ]      ; then cp /preloaded_data/005_Near-Earth_Comets_-_Orbital_Elements.sql /docker-entrypoint-initdb.d/005_Near-Earth_Comets_-_Orbital_Elements.sql ; fi
RUN if [ "$DATA_SET" = "data_gov" ] ; then cp /preloaded_data/005_Near-Earth_Comets_-_Orbital_Elements.sql /docker-entrypoint-initdb.d/005_Near-Earth_Comets_-_Orbital_Elements.sql ; fi
RUN if [ "$DATA_SET" = "all" ]      ; then cp /preloaded_data/006_Extra-vehicular_Activity__EVA__-_US_and_Russia.sql /docker-entrypoint-initdb.d/006_Extra-vehicular_Activity__EVA__-_US_and_Russia.sql ; fi
RUN if [ "$DATA_SET" = "data_gov" ] ; then cp /preloaded_data/006_Extra-vehicular_Activity__EVA__-_US_and_Russia.sql /docker-entrypoint-initdb.d/006_Extra-vehicular_Activity__EVA__-_US_and_Russia.sql ; fi
RUN if [ "$DATA_SET" = "all" ]      ; then cp /preloaded_data/007-brfss_prevalence_data.sql /docker-entrypoint-initdb.d/007-brfss_prevalence_data.sql ; fi
RUN if [ "$DATA_SET" = "data_gov" ] ; then cp /preloaded_data/007-brfss_prevalence_data.sql /docker-entrypoint-initdb.d/007-brfss_prevalence_data.sql ; fi


