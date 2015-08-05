canadiana
=======



[![Build Status](https://travis-ci.org/sckott/canadiana.svg)](https://travis-ci.org/sckott/canadiana)
[![codecov.io](https://codecov.io/github/sckott/canadiana/coverage.svg?branch=master)](https://codecov.io/github/sckott/canadiana?branch=master)

`canadiana` is an R client for the Canadiana API

* [Canadiana](http://search.canadiana.ca/) - _Search the digital collections of libraries, archives and museums from across Canada_
* API docs: [http://search.canadiana.ca/support/api](http://search.canadiana.ca/support/api)

## Install


```r
install.packages("devtools")
devtools::install_github("sckott/canadiana")
```


```r
library("canadiana")
```

## Search for records


```r
out <- cearch(q="railroads")
out$meta
#> $request
#> [1] "http://search.canadiana.ca/search?q=railroads&fmt=json"
#> 
#> $page
#> [1] 1
#> 
#> $pages
#> [1] 1576
#> 
#> $next_page
#> [1] "http://search.canadiana.ca/search/2?tx=&q=railroads&fmt=json"
#> 
#> $hits
#> [1] 15752
#> 
#> $hits_per_page
#> [1] "10"
#> 
#> $hits_from
#> [1] 1
#> 
#> $hits_to
#> [1] 10
#> 
#> $version
#> [1] "0.3"
#> 
#> $pubmin
#> [1] 1800
#> 
#> $pubmax
#> [1] 3099
```


```r
out$facet
#> $contributor
#>      contrib count
#> 1     oocihm  5846
#> 3  manitobia  2183
#> 5        bva  1822
#> 7   alouette  1690
#> 9       bvau  1334
#> 11       aeu   897
#> 13       oop   741
#> 15       otp   472
#> 17       otu   413
#> 19       ooe   238
#> 21       ams    44
#> 23       mun    30
#> 25        ac    25
#> 27      omcn    12
#> 29      nbfu     2
#> 31       bnm     1
#> 33       mov     1
#> 35      oong     1
#> 
#> $lang
#>    lang count
#> 1   eng 13851
#> 3   fra   635
#> 5   deu    15
#> 7   enb     5
#> 9   pol     4
#> 11  spa     4
#> 13  dan     2
#> 15  emg     1
#> 17  ita     1
#> 19  lat     1
#> 21  nld     1
#> 23  rus     1
#> 25  swe     1
#> 27  und     1
#> 
#> $collection
#>    coll count
#> 1   gvp   235
#> 3   ecl    84
#> 5   wmh    49
#> 7   nas    30
#> 9   hbc    19
#> 11  hfc    14
#> 13  per    14
#> 15  gvg     1
#> 17  jsr     1
#> 
#> $media
#>   format count
#> 1   text 11173
#> 3  image  4491
#> 5  audio     2
```


```r
head(out$docs)
#>   lang
#> 1  eng
#> 2  eng
#> 3  eng
#> 4  eng
#> 5  eng
#> 6  eng
#>                                                                                           creator
#> 1 Canada. Legislature. Legislative Assembly. Standing Committee on Railroads and Telegraph Lines.
#> 2                                                                                            NULL
#> 3                                                                                            NULL
#> 4                                                                                            NULL
#> 5                                                                                            NULL
#> 6                                                                                            NULL
#>                                      location
#> 1 http://eco.canadiana.ca/view/oocihm.9_01123
#> 2 http://eco.canadiana.ca/view/oocihm.8_06592
#> 3 http://eco.canadiana.ca/view/oocihm.8_04941
#> 4 http://eco.canadiana.ca/view/oocihm.8_05079
#> 5 http://eco.canadiana.ca/view/oocihm.8_06691
#> 6 http://eco.canadiana.ca/view/oocihm.8_04331
#>                                                                                                                                                                                                                                     subject
#> 1 Railroads -- Canada., Railroads and state -- Canada., Canals -- Canada., Telegraph lines -- Canada., Chemins de fer -- Canada., Chemins de fer -- Politique gouvernementale -- Canada., Canaux -- Canada., Lignes télégraphiques -- Canada.
#> 2                                                                                                                                                             Railroads -- Canada -- Periodicals., Chemins de fer -- Canada -- Periodicals.
#> 3                Railroads -- Canada -- Time-tables -- Periodicals., Railroads -- United States -- Time-tables -- Periodicals., Chemins de fer -- Canada -- Horaires -- Périodiques., Chemins de fer -- États-Unis -- Horaires -- Périodiques.
#> 4                                                                                                                                                              Railroads -- Canada -- Periodicals., Chemins de fer -- Canada -- Périodiques.
#> 5                                                                                                                                    Railroads -- Canada -- Timetables -- Periodicals., Chemins de fer -- Canada -- Horaires -- Périodiques.
#> 6                                                    Railroads -- Canada -- Timetables -- Periodicals., Steamboats -- Canada -- Periodicals., Chemins de fer -- Canada -- Horaires -- Périodiques., Bateaux à vapeur -- Canada -- Périodiques.
#>   collection
#> 1        gvp
#> 2        per
#> 3        per
#> 4        per
#> 5        per
#> 6        per
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     note
#> 1 Title from title screen., Libraries from which the original issues have been borrowed are identified on the microfiche., In 1847, the Legislative Assembly appointed a Standing Committee on Railroads and Telegraphic Lines to investigate all petitions and bills presented to the House. This committee was reappointed each year thereafter until 1867. In 1852, the investigation into canals was added and the committee became the Standing Committee on Railroads, Canals and Telegraphic Lines. Cf. Bishop., "Printed by order of the Railway Committee.", Description based on: 1859., Bishop, O.B. Publications of the government of the Province of Canada, 1841-1867, p. 324, v. ; 25 cm.
#> 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Ceased pub in 188-? Cf. Bibliothèque et Archives nationales du Québec., Title from caption., Title from title screen., Includes advertising matter., Issues reproduced: Vol. 2, no. 2 (Mar. 3, 1882), v. : ill.
#> 3                                                                                                                                                                                                                         Began pub. in 1866; ceased with May 1869 issue. Cf. La presse québé coise des origines à nos jours., Title from cover., Title from title screen., Includes advertising matter., Issues reproduced: No. 33 (June 1867); no. 38 (Oct. 1867); no. 50 (Oct. 1868), "Giving the time-tables of the Grand Trunk Railway of Canada and of all railways connecting Canada and the United States.", Tables., Imprint varies., Description based on: No. 33 (June 1867), v. : maps ; 21 cm.
#> 4                                                                                                                                                                                                                                                                                                                                          Ceased pub. in 1888? Cf. LAC., Title from title screen., Includes advertising matter., Issues reproduced: Vol. 2, no. 1 (Jan. 1887)-v. 3, no. 7 (July 1888); v. 3, no. 10 (Oct. 1888), Description based on: Vol. 2, no. 1 (Jan. 1887), "A Monthly Journal Devoted to Canadian Railway Interests.", Issues for May/June 1888 published together., v. ; 31 cm.
#> 5                                                                                                                                                                                                                                                                                                                                                                        Vol. 1, no. 1 (Oct. 11, 1880)-, Title from caption., Title from title screen., "Devoted to Raiway [sic], Commercial, Financial, Agricultural and Scientific Developments of our Day.", Imprint varies., Includes advertising matter., Issues reproduced: Vol. 1, no. 1 (Oct. 11, 1880); v. 12, no. 21 (May 25, 1891), v. : ill.
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                    Title from title screen., '"Giving a facility to the means of Travelling for strangers ..."', Issues reproduced: Vol. 4, no. 5 (Sept. 2, 1858), Includes advertising matter., Title from caption., Description based on: Vol. 4, no. 5 (Sept. 2, 1858), v. ; 31 cm.
#>              key
#> 1 oocihm.9_01123
#> 2 oocihm.8_06592
#> 3 oocihm.8_04941
#> 4 oocihm.8_05079
#> 5 oocihm.8_06691
#> 6 oocihm.8_04331
#>                                                              published
#> 1                                     Toronto : J. Lovell, [1849-1862]
#> 2                                     Montreal : H. Mott, [1881-188-?]
#> 3                                 Montreal : M. Longmoore, [1866-1869]
#> 4                               Toronto : W.B. Campbell, [1886?-1888?]
#> 5 Montreal : Railway and Steamboat Times Pub. Co., [1880-18-- or 19--]
#> 6 Montreal : Pub. for the proprietor by H. Rose, [1855?-18-- or 19- -]
#>   identifier media
#> 1    9_01123  text
#> 2    8_06592  text
#> 3    8_04941  text
#> 4    8_05079  text
#> 5    8_06691  text
#> 6    8_04331  text
#>                                                                                       label
#> 1 Proceedings of the Select Standing Committee on Railroads, Canals and Telegraph Lines ...
#> 2                                                                           Railway journal
#> 3                                                           The international railway guide
#> 4                                                                              Railway life
#> 5                                                           The railway and steamboat times
#> 6                                                      Canadian railway and steamboat guide
#>     type
#> 1 series
#> 2 series
#> 3 series
#> 4 series
#> 5 series
#> 6 series
#>                                                                                                                                                                                                  title
#> 1 Canada. Legislature. Legislative Assembly. Standing Committee on Railroads, Canals and Telegraph Lines., Proceedings of the Select Standing Committee on Railroads, Canals and Telegraph Lines ... .
#> 2                                                                                                                                                                                    Railway journal .
#> 3                                                                                                                                                                    The international railway guide .
#> 4                                                                                                                                                                                       Railway life .
#> 5                                                                                                                                                                    The railway and steamboat times .
#> 6                                                                                                                                                               Canadian railway and steamboat guide .
#>   contributor
#> 1      oocihm
#> 2      oocihm
#> 3      oocihm
#> 4      oocihm
#> 5      oocihm
#> 6      oocihm
```

By language


```r
cearch(lang="spa")$meta
#> $request
#> [1] "http://search.canadiana.ca/search?lang=spa&fmt=json"
#> 
#> $page
#> [1] 1
#> 
#> $pages
#> [1] 545
#> 
#> $next_page
#> [1] "http://search.canadiana.ca/search/2?tx=&lang=spa&q=&fmt=json"
#> 
#> $hits
#> [1] 5447
#> 
#> $hits_per_page
#> [1] "10"
#> 
#> $hits_from
#> [1] 1
#> 
#> $hits_to
#> [1] 10
#> 
#> $version
#> [1] "0.3"
#> 
#> $pubmin
#> [1] 1535
#> 
#> $pubmax
#> [1] 2018
```

By record type


```r
cearch(type="page")$meta
#> $request
#> [1] "http://search.canadiana.ca/search?t=page&fmt=json"
#> 
#> $page
#> [1] 1
#> 
#> $pages
#> [1] 911558
#> 
#> $next_page
#> [1] "http://search.canadiana.ca/search/2?tx=&q=&t=page&fmt=json"
#> 
#> $hits
#> [1] 9115572
#> 
#> $hits_per_page
#> [1] "10"
#> 
#> $hits_from
#> [1] 1
#> 
#> $hits_to
#> [1] 10
#> 
#> $version
#> [1] "0.3"
#> 
#> $pubmin
#> [1] 1558
#> 
#> $pubmax
#> [1] 2014
```

Date delimit


```r
cearch(q="railroads", df=1800, dt=1820)$meta
#> $request
#> [1] "http://search.canadiana.ca/search?q=railroads&df=1800&dt=1820&fmt=json"
#> 
#> $page
#> [1] 1
#> 
#> $pages
#> [1] 2
#> 
#> $next_page
#> [1] "http://search.canadiana.ca/search/2?tx=&df=1800&q=railroads&dt=1820&fmt=json"
#> 
#> $hits
#> [1] 19
#> 
#> $hits_per_page
#> [1] "10"
#> 
#> $hits_from
#> [1] 1
#> 
#> $hits_to
#> [1] 10
#> 
#> $version
#> [1] "0.3"
#> 
#> $pubmin
#> [1] 1800
#> 
#> $pubmax
#> [1] 1899
```

Sorting


```r
cearch(q="railroads", df=1800, dt=1820, sort="oldest")$docs
#>    lang                                                           location
#> 1   eng                        http://eco.canadiana.ca/view/oocihm.8_04331
#> 2  NULL http://www.torontopubliclibrary.ca/detail.jsp?R=DC-37131055430938D
#> 3  NULL http://www.torontopubliclibrary.ca/detail.jsp?R=DC-37131055430946D
#> 4  NULL http://www.torontopubliclibrary.ca/detail.jsp?R=DC-37131055430953D
#> 5  NULL http://www.torontopubliclibrary.ca/detail.jsp?R=DC-37131055430961D
#> 6  NULL http://www.torontopubliclibrary.ca/detail.jsp?R=DC-37131055430979D
#> 7  NULL http://www.torontopubliclibrary.ca/detail.jsp?R=DC-37131055430987D
#> 8   eng                             http://www.vpl.ca/cgi-bin/photos?11292
#> 9   eng                             http://www.vpl.ca/cgi-bin/photos?11292
#> 10  eng                             http://www.vpl.ca/cgi-bin/photos?11316
#>                                                                                                                                                                                    subject
#> 1   Railroads -- Canada -- Timetables -- Periodicals., Steamboats -- Canada -- Periodicals., Chemins de fer -- Canada -- Horaires -- Périodiques., Bateaux à vapeur -- Canada -- Périodiques.
#> 2                                                                                            Railroads--Nova Scotia--Periodicals., Railroads--Nova Scotia--History--19th century--Sources.
#> 3                                                                                            Railroads--Nova Scotia--Periodicals., Railroads--Nova Scotia--History--19th century--Sources.
#> 4                                                                                            Railroads--Nova Scotia--Periodicals., Railroads--Nova Scotia--History--19th century--Sources.
#> 5                                                                                            Railroads--Nova Scotia--Periodicals., Railroads--Nova Scotia--History--19th century--Sources.
#> 6                                                                                            Railroads--Nova Scotia--Periodicals., Railroads--Nova Scotia--History--19th century--Sources.
#> 7                                                                                            Railroads--Nova Scotia--Periodicals., Railroads--Nova Scotia--History--19th century--Sources.
#> 8                                                       Railroads - Rolling-stock, Railroads - Passenger - cars, Railroads - Employees, Canadian Pacific Railway Company, British Columbia
#> 9                                                                         Railroads - Rolling-stock--Railroads - Passenger - cars--Railroads - Employees, Canadian Pacific Railway Company
#> 10 Railroads - Rolling-stock, Railroads - Trains, Railroads - Passenger - cars, Railroad bridges, Kettle Valley Railway, Canadian Pacific Railway Company, British Columbia - Canyon Creek
#>    collection
#> 1         per
#> 2        NULL
#> 3        NULL
#> 4        NULL
#> 5        NULL
#> 6        NULL
#> 7        NULL
#> 8        NULL
#> 9        NULL
#> 10       NULL
#>                                                                                                                                                                                                                                                                   note
#> 1  Title from title screen., '"Giving a facility to the means of Travelling for strangers ..."', Issues reproduced: Vol. 4, no. 5 (Sept. 2, 1858), Includes advertising matter., Title from caption., Description based on: Vol. 4, no. 5 (Sept. 2, 1858), v. ; 31 cm.
#> 2                                                                                                                                                                                                                                Description based on: 1861. TPL,4351.
#> 3                                                                                                                                                                                                                                Description based on: 1861. TPL,4351.
#> 4                                                                                                                                                                                                                                Description based on: 1861. TPL,4351.
#> 5                                                                                                                                                                                                                                Description based on: 1861. TPL,4351.
#> 6                                                                                                                                                                                                                                Description based on: 1861. TPL,4351.
#> 7                                                                                                                                                                                                                                Description based on: 1861. TPL,4351.
#> 8                                                                                                                                                                                                                                                                 NULL
#> 9                                                                                                                                                                                                                                                                 NULL
#> 10                                                                                                                                                                                                                                                                NULL
#>                                                                   key
#> 1                                                      oocihm.8_04331
#> 2                                                 otp.37131055430938D
#> 3                                                 otp.37131055430946D
#> 4                                                 otp.37131055430953D
#> 5                                                 otp.37131055430961D
#> 6                                                 otp.37131055430979D
#> 7                                                 otp.37131055430987D
#> 8  alouette.Vancouver.Public.Library.VPL.LeonardFrankCollection.14332
#> 9                                                       bva.VPL.11292
#> 10  alouette.Vancouver.Public.Library.VPL.LeonardFrankCollection.1771
#>                                                                                                                   published
#> 1                                                      Montreal : Pub. for the proprietor by H. Rose, [1855?-18-- or 19- -]
#> 2                                                                                                                      NULL
#> 3                                                                                                                      NULL
#> 4                                                                                                                      NULL
#> 5                                                                                                                      NULL
#> 6                                                                                                                      NULL
#> 7                                                                                                                      NULL
#> 8                                       Caple, N., C.P.R. Dining Car "Holyrood", Vancouver: Vancouver Public Library, 18--.
#> 9                                                                                                                      NULL
#> 10 Unknown, C.P.R. passenger train on Kettle Valley Railway Canyon Creek Bridge, Vancouver: Vancouver Public Library, 18--.
#>                                                   identifier media
#> 1                                                    8_04331  text
#> 2                                            37131055430938D image
#> 3                                            37131055430946D image
#> 4                                            37131055430953D image
#> 5                                            37131055430961D image
#> 6                                            37131055430979D image
#> 7                                            37131055430987D image
#> 8  Vancouver.Public.Library.VPL.LeonardFrankCollection.14332 image
#> 9                                                  VPL.11292 image
#> 10  Vancouver.Public.Library.VPL.LeonardFrankCollection.1771 image
#>                                                                                         label
#> 1                                                        Canadian railway and steamboat guide
#> 2  Report of the Chief Commissioner of Railways for the Province of Nova Scotia, for the year
#> 3  Report of the Chief Commissioner of Railways for the Province of Nova Scotia, for the year
#> 4  Report of the Chief Commissioner of Railways for the Province of Nova Scotia, for the year
#> 5  Report of the Chief Commissioner of Railways for the Province of Nova Scotia, for the year
#> 6  Report of the Chief Commissioner of Railways for the Province of Nova Scotia, for the year
#> 7  Report of the Chief Commissioner of Railways for the Province of Nova Scotia, for the year
#> 8                                                                C.P.R. Dining Car "Holyrood"
#> 9                                                                C.P.R. Dining Car 'Holyrood'
#> 10                        C.P.R. passenger train on Kettle Valley Railway Canyon Creek Bridge
#>        type
#> 1    series
#> 2  document
#> 3  document
#> 4  document
#> 5  document
#> 6  document
#> 7  document
#> 8  document
#> 9  document
#> 10 document
#>                                                                  title
#> 1                               Canadian railway and steamboat guide .
#> 2                                                                 NULL
#> 3                                                                 NULL
#> 4                                                                 NULL
#> 5                                                                 NULL
#> 6                                                                 NULL
#> 7                                                                 NULL
#> 8                                         C.P.R. Dining Car "Holyrood"
#> 9                                         C.P.R. Dining Car 'Holyrood'
#> 10 C.P.R. passenger train on Kettle Valley Railway Canyon Creek Bridge
#>    contributor                                      creator
#> 1       oocihm                                         NULL
#> 2          otp Nova Scotia. Board of Railway Commissioners.
#> 3          otp Nova Scotia. Board of Railway Commissioners.
#> 4          otp Nova Scotia. Board of Railway Commissioners.
#> 5          otp Nova Scotia. Board of Railway Commissioners.
#> 6          otp Nova Scotia. Board of Railway Commissioners.
#> 7          otp Nova Scotia. Board of Railway Commissioners.
#> 8     alouette                                    Caple, N.
#> 9          bva                                         NULL
#> 10    alouette                                      Unknown
#>                                                                                                                                                                                                                                                                         abstract
#> 1                                                                                                                                                                                                                                                                           NULL
#> 2                                                                                                                                                                                                                                                                           NULL
#> 3                                                                                                                                                                                                                                                                           NULL
#> 4                                                                                                                                                                                                                                                                           NULL
#> 5                                                                                                                                                                                                                                                                           NULL
#> 6                                                                                                                                                                                                                                                                           NULL
#> 7                                                                                                                                                                                                                                                                           NULL
#> 8                                                                                                   Glass negative (20x25 cm), Glass - cracked and ends taped--Glass - stained--Glass - emulsion silvering--Glass - yellowing--Glass - deterioration advanced, Scanned at 600dpi
#> 9  Glass negative (20x25 cm), Glass - cracked and ends taped--Glass - stained--Glass - emulsion silvering--Glass - yellowing--Glass - deterioration advanced--Glass - broken, Scanned at 600 dpi on CD 161--GN scanned at 800 dpi on CD 1111--2 glass plates sandwiched together
#> 10                 C.P.R. passenger train on Kettle Valley Railway Canyon Creek Bridge - locie #3269., Copy negative (10x13 cm)--Postcard (9x14 cm)--Copy print (20x25 cm), Copy negative - brown tint--Postcard - yellowing--Copy print - yellowing, F-1772; Scanned at 1200dpi
#>        pkey
#> 1      <NA>
#> 2      <NA>
#> 3      <NA>
#> 4      <NA>
#> 5      <NA>
#> 6      <NA>
#> 7      <NA>
#> 8      <NA>
#> 9  bva.schp
#> 10     <NA>
```

Paging


```r
# FIX ME - paging doesn' work for some reason
cearch(q="railroads", page=2)$meta
```

## Get single item


```r
item("oocihm.00001")
#> $request
#> [1] "http://search.canadiana.ca/view/oocihm.00001?fmt=json"
#> 
#> $version
#> [1] "0.4"
#> 
#> $doc
#> $doc$lang
#> $doc$lang[[1]]
#> [1] "fra"
#> 
#> 
#> $doc$creator
#> $doc$creator[[1]]
#> [1] "Boucher, Pierre, sieur de Boucherville, 1622-1717."
#> 
#> 
#> $doc$location
#> [1] "http://eco.canadiana.ca/view/oocihm.00001"
#> 
#> $doc$subject
#> $doc$subject[[1]]
#> [1] "Canada -- Histoire -- Jusqu'à 1663 (Nouvelle-France)"
#> 
#> $doc$subject[[2]]
#> [1] "Canada -- Descriptions et voyages -- Ouvrages avant 1800."
#> 
#> $doc$subject[[3]]
#> [1] "Canada -- History -- To 1663 (New France)"
#> 
#> $doc$subject[[4]]
#> [1] "Canada -- Description and travel -- Early works to 1800."
#> 
#> 
#> $doc$collection
#> $doc$collection[[1]]
#> [1] "hfc"
#> 
#> 
#> $doc$note
#> $doc$note[[1]]
#> [1] "Titre de l'écran-titre."
#> 
#> $doc$note[[2]]
#> [1] "iv, [15], 168 p."
#> 
#> 
#> $doc$key
#> [1] "oocihm.00001"
#> 
#> $doc$published
#> $doc$published[[1]]
#> [1] "A Paris : Chez Florentin Lambert ... , 1664."
#> 
#> 
#> $doc$identifier
#> $doc$identifier[[1]]
#> [1] "00001"
#> 
#> 
#> $doc$media
#> $doc$media[[1]]
#> [1] "text"
#> 
#> 
#> $doc$label
#> [1] "Histoire veritable et naturelle des moeurs & productions du pays de la Nouvelle France, vulgairement dite le Canada / composé par Pierre Boucher, Escuyer Sieur de Gros- bois & Gouverneur des Trois-Rivieres, audit lieu de la Nouvelle-France."
#> 
#> $doc$type
#> [1] "document"
#> 
#> $doc$title
#> $doc$title[[1]]
#> [1] "Histoire veritable et naturelle des moeurs & productions du pays de la Nouvelle France, vulgairement dite le Canada"
#> 
#> 
#> $doc$contributor
#> [1] "oocihm"
```

