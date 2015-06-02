-- ConceptWiki
ld_dir('/staging/CW' , 'pref-mapping-20131212.ttl' , 'http://www.conceptwiki.org' );
ld_dir('/staging/CW', 'inverted_CW_OCRS_via_CS.ttl' , 'http://www.conceptwiki.org' );
ld_dir('/staging/CW', 'inverted_CW_ChEMBL_TC_via_Uniprot.ttl', 'http://www.conceptwiki.org');

-- Enzyme
ld_dir('/staging/enzyme' , 'enzyme.rdf' , 'http://purl.uniprot.org/enzyme' );

-- DrugBank v4.1
ld_dir('/staging/drugbank' , 'drugbank.nt' , 'http://www.openphacts.org/bio2rdf/drugbank');

-- Uniprot 2015_1
ld_dir('/staging/uniprot' , 'swissprot_28012015.rdf.xml' , 'http://purl.uniprot.org' );
ld_dir('/staging/uniprot' , 'uniparc_28012015.rdf.xml' , 'http://purl.uniprot.org' );
ld_dir('/staging/uniprot' , 'uniref_28012015.rdf.xml' , 'http://purl.uniprot.org' );

-- ChEBI v125
ld_dir('/staging/chebi' , 'chebi.owl' , 'http://www.ebi.ac.uk/chebi' );

-- WikiPathways
ld_dir('/staging/WP' , '*.ttl' , 'http://www.wikipathways.org' );
ld_dir('/staging/WP/WPREACTRDF' , '*.ttl' , 'http://www.wikipathways.org' );
ld_dir('/staging/WP/OPSWPRDF' , '*.ttl' , 'http://www.wikipathways.org' );

-- Gene Ontology
ld_dir('/staging/GO' , 'go.owl' , 'http://www.geneontology.org' );

-- GOA
ld_dir('/staging/GOA' , '*.rdf' , 'http://www.openphacts.org/goa' );

-- VoID Dataset Descriptors
ld_dir('/staging/void' , '*.ttl' , 'http://www.openphacts.org/api/datasetDescriptors' );

-- FDA Adverse Events
ld_dir('/staging/aers' , 'faers-of-2012-generated-on-2012-07-09.nt', 'http://aers.data2semantics.org/');

-- ChEMBL v20
ld_dir('/staging/chembl20', '*.ttl', 'http://www.ebi.ac.uk/chembl');

-- Open PHACTS Chemical Registry
ld_dir('/staging/OCRS/20131111/CHEMBL' , 'PROPERTIES_CHEMBL20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEMBL' , 'SYNONYMS_CHEMBL20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEMBL' , 'LINKSET_EXACT_CHEMBL20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEBI' , 'PROPERTIES_CHEBI20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEBI' , 'SYNONYMS_CHEBI20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/CHEBI' , 'LINKSET_EXACT_CHEBI20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/DRUGBANK' , 'PROPERTIES_DRUGBANK20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/DRUGBANK' , 'LINKSET_EXACT_DRUGBANK20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/PDB' , 'PROPERTIES_PDB20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/PDB' , 'SYNONYMS_PDB20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/MESH' , 'PROPERTIES_MESH20131111.ttl' , 'http://ops.rsc.org' );
ld_dir('/staging/OCRS/20131111/MESH' , 'SYNONYMS_MESH20131111.ttl' , 'http://ops.rsc.org' );

-- DisGeneT
ld_dir('/staging/disgenet', '*.ttl', 'http://rdf.imim.es');

-- Nextprot
ld_dir('/staging/nx_np', '*.rdf', 'http://www.nextprot.org');
ld_dir('/staging/nx_np', '*.nquads', 'http://www.nextprot.org');

-- Caloha
ld_dir('/staging/caloha', 'caloha.ttl', 'http://www.nextprot.org/caloha');
