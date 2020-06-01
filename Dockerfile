FROM rocker/tidyverse:3.6.3

RUN apt-get update && apt-get install -y --no-install-recommends clang

RUN Rscript -e 'dotR <- file.path(Sys.getenv("HOME"), ".R"); if (!file.exists(dotR)) dir.create(dotR); M <- file.path(dotR, "Makevars"); if (!file.exists(M)) file.create(M); cat("\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC","CXX14=clang++",file = M, sep = "\n", append = TRUE)'

RUN Rscript -e 'options(repos = list(CRAN = "http://mran.revolutionanalytics.com/snapshot/2020-06-01")); \
  install.packages("rstan")'

