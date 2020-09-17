__Using Pubmed as a literature source for identifying title, abstract, and keywords:__  
1. Run your naive search in PubMed  
2. Export (select ALL) results in PubMed format (need this version for the abstract field to populate and export) and save to your computer  
3. Import exported file into Zotero, choosing to create a new collection.  
4. Export the new collection from Zotero as an RIS file and save to your computer; this is the file that you will use in Step 5. 
5. Follow the `litsearchr` [R vignette](https://elizagrames.github.io/litsearchr/litsearchr_vignette_v041.html) instructions until step 3; this will collect the most important keywords for use (what evidence synthesists are likely to use to find your research). The R script to apply the `litsearchr` process to this project, using three different record sets, is provided in `litsearchr_mindfulness.R`.