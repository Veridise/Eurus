FROM chyanju/eurus:base

# copy current version of Eurus
COPY ./ /Eurus/

CMD [ "/bin/bash" ]