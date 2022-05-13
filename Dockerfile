FROM postgres:12.10

# Delete our left over sample_data.sql
RUN mkdir preloaded_data

# COPY ALL OF OUR DATA_SHEETS OVER (We copy all of them over since there's no conditional COPY)
COPY ./pg_sample_data/adsb/000000-setup.sql \
		./pg_sample_data/adsb/000000-setup.sql \ 
		./pg_sample_data/adsb/000455Z.json.sql \
		./pg_sample_data/adsb/000955Z.json.sql \
		./pg_sample_data/adsb/001455Z.json.sql \
		./pg_sample_data/adsb/001955Z.json.sql \
		./pg_sample_data/adsb/002455Z.json.sql \
		./pg_sample_data/adsb/002955Z.json.sql \
		./pg_sample_data/adsb/003455Z.json.sql \
		./pg_sample_data/adsb/003955Z.json.sql \
		./pg_sample_data/adsb/004455Z.json.sql \
		./pg_sample_data/adsb/004955Z.json.sql \
		./pg_sample_data/adsb/005455Z.json.sql \
		./pg_sample_data/adsb/005955Z.json.sql \
		./pg_sample_data/adsb/010455Z.json.sql \
		./pg_sample_data/adsb/020000-extract-record.sql \
		./pg_sample_data/adsb/020001-cleanup.sql \
		./pg_sample_data/random/001_SISO.sql \
		./pg_sample_data/random/002_MEPED.sql \
		./pg_sample_data/random/003_t_oil.sql \
		./pg_sample_data/random/004_Meteorite_Landings.sql \
		./pg_sample_data/random/005_Near-Earth_Comets_-_Orbital_Elements.sql \
		./pg_sample_data/random/006_Extra-vehicular_Activity__EVA__-_US_and_Russia.sql \
		./pg_sample_data/random/007-brfss_prevalence_data.sql \
		/preloaded_data/

# Retrieve all of the files from the folder
RUN file="$(ls -1 /preloaded_data)" && echo $file

#RUN cp -r /preloaded_data /docker-entrypoint-initdb.d/
#RUN array="$(ls -1)"; for i in ${array}; do cp "$i" "/docker-entrypoint-initdb.d/$i"; done
RUN array=$(ls ./preloaded_data -1); for i in ${array}; do cp ./preloaded_data/$i /docker-entrypoint-initdb.d/$i; echo $i; done

# Cleanup
RUN rm -rf /preloaded_data

