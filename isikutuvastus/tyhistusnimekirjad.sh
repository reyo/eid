#!/bin/bash

# Hangi AS Sertifitseerimiskeskusest tühistusnimekirjad. Vt ka http://sk.ee/repositoorium/CRL/ 

wget https://sk.ee/crls/eeccrca/eeccrca.crl
wget https://sk.ee/crls/esteid/esteid2015.crl
wget https://sk.ee/repository/crls/esteid2011.crl
wget https://sk.ee/repository/crls/eid2011.crl

# Konverteeri tühistusnimekirjad PEM formaati

openssl crl -in eeccrca.crl -out eeccrca.crl -inform DER
openssl crl -in esteid2015.crl -out esteid2015.crl -inform DER
openssl crl -in esteid2011.crl -out esteid2011.crl -inform DER  
openssl crl -in eid2011.crl -out eid2011.crl -inform DER

# Loo tühistusnimekirjade symlingid, mille failinimi baseerub CRL faili hashil:

ln -s eeccrca.crl `openssl crl -hash -noout -in eeccrca.crl`.r0
ln -s esteid2015.crl `openssl crl -hash -noout -in esteid2015.crl`.r0
ln -s esteid2011.crl `openssl crl -hash -noout -in esteid2011.crl`.r0  
ln -s eid2011.crl `openssl crl -hash -noout -in eid2011.crl`.r0
