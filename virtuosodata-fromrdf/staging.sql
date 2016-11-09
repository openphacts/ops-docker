-- Biggest ones first


-- -- Uniprot 
-- ld_dir('/staging/uniprot' , '*.nq.gz' , 'http://purl.uniprot.org' );

-- -- GOA
-- ld_dir('/staging/GOA' , '*.nq.gz' , 'http://www.openphacts.org/goa' );

-- -- ChEMBL v20
-- ld_dir('/staging/chembl20', '*.nq.gz', 'http://www.ebi.ac.uk/chembl');

-- -- Nextprot
-- ld_dir('/staging/nx_np', '*.nq.gz', 'http://www.nextprot.org');

-- -- Open PHACTS Chemical Registry

-- DONE
-- ld_dir('/staging/ocrs/data/CHEMBL' , '*.ttl.gz' , 'http://ops.rsc.org' );
-- ld_dir('/staging/ocrs/data/CHEBI' , '*.ttl.gz' , 'http://ops.rsc.org' );
-- ld_dir('/staging/ocrs/data/DRUGBANK' , '*.ttl.gz' , 'http://ops.rsc.org' );
-- ld_dir('/staging/ocrs/data/PDB' , '*.ttl.gz' , 'http://ops.rsc.org' );
-- ld_dir('/staging/ocrs/data/MESH' , '*.ttl.gz' , 'http://ops.rsc.org' );
-- ld_dir('/staging/ocrs/data/HUMAN_METABOLOME_DATABASE' , '*.ttl.gz' , 'http://ops.rsc.org' );

-- and then the rest


-- -- FDA Adverse Events
-- ld_dir('/staging/aers' , '*.nq.gz', 'http://aers.data2semantics.org/');

-- DONE
-- -- Caloha
-- ld_dir('/staging/caloha/data', '*.ttl.gz', 'http://www.nextprot.org/caloha');

-- DONE
-- -- ChEBI
-- ld_dir('/staging/chebi/data' , '*.owl.gz' , 'http://www.ebi.ac.uk/chebi' );

-- -- ConceptWiki
-- ld_dir('/staging/CW' , '*.nq.gz' , 'http://www.conceptwiki.org' );

-- -- DisGeneT
-- ld_dir('/staging/disgenet', '*.nq.gz', 'http://rdf.imim.es');

-- -- DrugBank v4.1
-- ld_dir('/staging/drugbank' , '*.nq.gz' , 'http://www.openphacts.org/bio2rdf/drugbank');

-- -- Enzyme
-- ld_dir('/staging/enzyme' , '*.nq.gz' , 'http://purl.uniprot.org/enzyme' );

-- -- Gene Ontology
-- ld_dir('/staging/GO' , '*.nq.gz' , 'http://www.geneontology.org' );





-- -- VoID Dataset Descriptors
-- ld_dir('/staging/void' , '*.nq.gz' , 'http://www.openphacts.org/api/datasetDescriptors' );

-- -- WikiPathways
-- ld_dir('/staging/WP' , '*.nq.gz' , 'http://www.wikipathways.org' );
-- ld_dir('/staging/WP/WPREACTRDF' , '*.nq.gz' , 'http://www.wikipathways.org' );
-- ld_dir('/staging/WP/OPSWPRDF' , '*.nq.gz' , 'http://www.wikipathways.org' );


rdf_loader_run();
