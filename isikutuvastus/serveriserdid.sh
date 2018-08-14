#!/bin/bash

# Loo fail server.key 

openssl genrsa -out server.key 1024

# Loo edaspidiseks signeerimiseks mõeldud fail server.csr, vastates mitmetele küsimustele:

openssl req -new -key server.key -out server.csr

# Loo katsetamiseks ise signeeritud fail server.crt. 
# Seda ei pea veebiserver usaldusväärseks sertifikaadiks ning nõuab kasutajalt erikinnitust, 
# et ta on ikka nõus selle sertifikaadiga saidile minema.
# Taoline kinnituse küsimine ei ole muidugi aktsepteeritav avalikult kasutuses veebilehel, 
# küll on ta aga OK katsetamiseks:

openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

# Ametliku ja usaldusväärse server.crt faili saad ise signeerimise asemel AS Sertifitseerimiskeskusest
# tellides: mine lehele http://sk.ee/teenused/veebiserveri-sertifikaadid . 
# Selliselt tellitud sertifikaadifaili korral ei anna brauser enam mingeid hoiatusi.

# Hangi AS Sertifitseerimiskeskusest kesksed sertifikaadid, vt ka https://sk.ee/repositoorium/sk-sertifikaadid/

wget https://sk.ee/upload/files/EE_Certification_Centre_Root_CA.pem.crt
wget https://sk.ee/upload/files/ESTEID-SK_2011.pem.crt
wget https://sk.ee/upload/files/ESTEID-SK_2015.pem.crt
wget https://sk.ee/upload/files/EID-SK_2011.pem.crt
wget https://sk.ee/upload/files/EID-SK_2016.pem.crt

# Liida mitu sertifikaati üheks failiks:

cat EE_Certification_Centre_Root_CA.pem.crt ESTEID-SK_2011.pem.crt ESTEID-SK_2015.pem.crt EID-SK_2011.pem.crt EID-SK_2016.pem.crt > id.crt

