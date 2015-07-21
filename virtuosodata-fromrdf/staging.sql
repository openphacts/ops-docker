-- Biggest ones first


-- Uniprot 
ld_dir('/staging/uniprot' , '*.nq.gz' , 'http://purl.uniprot.org' );

-- GOA
ld_dir('/staging/GOA' , '*.nq.gz' , 'http://www.openphacts.org/goa' );

-- ChEMBL v20
ld_dir('/staging/chembl20', '*.nq.gz', 'http://www.ebi.ac.uk/chembl');

-- Nextprot
ld_dir('/staging/nx_np', '*.nq.gz', 'http://www.nextprot.org');

-- Open PHACTS Chemical Registry

ld_dir('/staging/OCRS/20131111/CHEMBL' , 'PROPERTIES_CHEMBL20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEMBL' , 'SYNONYMS_CHEMBL20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEMBL' , 'LINKSET_EXACT_CHEMBL20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEBI' , 'PROPERTIES_CHEBI20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEBI' , 'SYNONYMS_CHEBI20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEBI' , 'LINKSET_EXACT_CHEBI20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/DRUGBANK' , 'PROPERTIES_DRUGBANK20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/DRUGBANK' , 'LINKSET_EXACT_DRUGBANK20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/PDB' , 'PROPERTIES_PDB20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/PDB' , 'SYNONYMS_PDB20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/MESH' , 'PROPERTIES_MESH20131111.nq.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/MESH' , 'SYNONYMS_MESH20131111.nq.gz' , 'http://ops.rsc.org' );

-- and then the rest


-- FDA Adverse Events
ld_dir('/staging/aers' , '*.nq.gz', 'http://aers.data2semantics.org/');

-- Caloha
ld_dir('/staging/caloha', '*.nq.gz', 'http://www.nextprot.org/caloha');

-- ChEBI
ld_dir('/staging/chebi' , '*.nq.gz' , 'http://www.ebi.ac.uk/chebi' );


-- ConceptWiki
ld_dir('/staging/CW' , '*.nq.gz' , 'http://www.conceptwiki.org' );

-- DisGeneT
ld_dir('/staging/disgenet', '*.nq.gz', 'http://rdf.imim.es');

-- DrugBank v4.1
ld_dir('/staging/drugbank' , '*.nq.gz' , 'http://www.openphacts.org/bio2rdf/drugbank');

-- Enzyme
ld_dir('/staging/enzyme' , '*.nq.gz' , 'http://purl.uniprot.org/enzyme' );

-- Gene Ontology
ld_dir('/staging/GO' , '*.nq.gz' , 'http://www.geneontology.org' );





-- VoID Dataset Descriptors
ld_dir('/staging/void' , '*.nq.gz' , 'http://www.openphacts.org/api/datasetDescriptors' );

-- WikiPathways
ld_dir('/staging/WP' , '*.nq.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/WP/WPREACTRDF' , '*.nq.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/WP/OPSWPRDF' , '*.nq.gz' , 'http://www.wikipathways.org' );






