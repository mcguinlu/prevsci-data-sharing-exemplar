#Load required packages
devtools::install_github("elizagrames/litsearchr", ref="main")
install.packages("synthesisr")

# Import initial file
myfile <- "keyword_generation/synthesizable_pubmed.ris"

naiveimport <- litsearchr::import_results(file = myfile)


naiveresults <-
  litsearchr::remove_duplicates(naiveimport,
                                field = "title",
                                method = "string_osa")

rakedkeywords <-
  litsearchr::extract_terms(
    text = paste(naiveresults$title, naiveresults$abstract),
    method = "fakerake",
    min_freq = 2,
    ngrams = TRUE,
    min_n = 2,
    language = "English"
  )

taggedkeywords <-
  litsearchr::extract_terms(
    keywords = naiveresults$keywords,
    method = "tagged",
    min_freq = 2,
    ngrams = TRUE,
    min_n = 2,
    language = "English"
  )

all_keywords <- unique(append(taggedkeywords, rakedkeywords))

naivedfm <-
  litsearchr::create_dfm(
    elements = paste(naiveresults$title, naiveresults$abstract),
    features = all_keywords
  )

naivegraph <-
  litsearchr::create_network(
    search_dfm = as.matrix(naivedfm),
    min_studies = 2,
    min_occ = 2
  )

cutoff <-
  litsearchr::find_cutoff(
    naivegraph,
    method = "cumulative",
    percent = .80,
    imp_method = "strength"
  )

reducedgraph <-
  litsearchr::reduce_graph(naivegraph, cutoff_strength = cutoff[1])

searchterms <- litsearchr::get_keywords(reducedgraph)

head(searchterms, 20)
