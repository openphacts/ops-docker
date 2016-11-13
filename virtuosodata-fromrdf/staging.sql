
-- ToDo (MISSING):
--   surechembl
--   BAO
--   NCATS

-- BAO
ld_dir('/staging/bao/data' , '*.gz' , 'http://www.bioassayontology.org' );


-- NCATS

-- in Graph: <http://rdf.ncats.nih.gov/opddr>
ld_dir('/staging/ncats/data' , 'npcpd2_assay.ttl.gz' , 'http://rdf.ncats.nih.gov/opddr' );
ld_dir('/staging/ncats/data' , 'npcpd2_bao.ttl.gz' , 'http://rdf.ncats.nih.gov/opddr' );
ld_dir('/staging/ncats/data' , 'npcpd2_substance.ttl.gz' , 'http://rdf.ncats.nih.gov/opddr' );

-- in Graph: <http://rdf.ncats.nih.gov/opddr/pubchem>
ld_dir('/staging/ncats/data' , 'pubchem_*.ttl.gz' , 'http://rdf.ncats.nih.gov/opddr/pubchem' );


-- surechembl
ld_dir('/staging/surechembl/data' , '*.ttl.gz' , 'http://www.ebi.ac.uk/surechembl' );

-- Biggest ones first

-- Uniprot
ld_dir('/staging/uniprot/data' , '*.rdf.xml.gz' , 'http://purl.uniprot.org' );
ld_dir('/staging/uniprot/data' , '*.ttl.gz' , 'http://purl.uniprot.org' );

-- GOA
ld_dir('/staging/goa/data' , '*.rdf.gz' , 'http://www.openphacts.org/goa' );

-- ChEMBL v20
ld_dir('/staging/chembl/data', '*.ttl.gz', 'http://www.ebi.ac.uk/chembl');

-- Nextprot
ld_dir('/staging/nextprot/data', '*.nq.gz', 'http://www.nextprot.org');

-- Open PHACTS Chemical Registry

ld_dir('/staging/ocrs/data/CHEMBL' , '*.ttl.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/ocrs/data/CHEBI' , '*.ttl.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/ocrs/data/DRUGBANK' , '*.ttl.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/ocrs/data/PDB' , '*.ttl.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/ocrs/data/MESH' , '*.ttl.gz' , 'http://ops.rsc.org' );
ld_dir('/staging/ocrs/data/HUMAN_METABOLOME_DATABASE' , '*.ttl.gz' , 'http://ops.rsc.org' );


-- and then the rest

-- FDA Adverse Events
ld_dir('/staging/aers/data' , '*.nt.gz', 'http://aers.data2semantics.org/');

-- Caloha
ld_dir('/staging/caloha/data', '*.ttl.gz', 'http://www.nextprot.org/caloha');

-- ChEBI
ld_dir('/staging/chebi/data' , '*.owl.gz' , 'http://www.ebi.ac.uk/chebi' );

-- ConceptWiki
ld_dir('/staging/conceptwiki/data/' , '*.ttl.gz' , 'http://www.conceptwiki.org' );

-- DisGeneT
ld_dir('/staging/disgenet/data', '*.ttl.gz', 'http://rdf.imim.es');

-- DrugBank v4.1
ld_dir('/staging/drugbank/data' , '*.nt.gz' , 'http://www.openphacts.org/bio2rdf/drugbank');

-- Enzyme
ld_dir('/staging/enzyme/data' , '*.rdf.gz' , 'http://purl.uniprot.org/enzyme' );

-- Gene Ontology
ld_dir('/staging/go/data' , '*.owl.gz' , 'http://www.geneontology.org' );



-- doid
ld_dir('/staging/doid/data' , '*.owl.gz' , 'http://www.openphacts.org/api/datasetDescriptors' );


-- VoID Dataset Descriptors
ld_dir('/staging/void/data' , '*.ttl.gz' , 'http://www.openphacts.org/api/datasetDescriptors' );



-- WikiPathways
ld_dir('/staging/wikipathways/data' , '*.ttl.gz' , 'http://www.wikipathways.org' );

ld_dir('/staging/wikipathways/data/gpml/Dog' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Rice' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Fruit_fly' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Arabidopsis_thaliana' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Zebra_fish' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Yeast' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Mouse' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Maize' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Escherichia_coli' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Worm' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Mosquito' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Bacillus_subtilis' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Human' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Cow' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Chicken' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Chimpanzee' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Rat' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/gpml/Fusarium_graminearum' , '*.ttl.gz' , 'http://www.wikipathways.org' );

ld_dir('/staging/wikipathways/data/wp/Dog' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Rice' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Fruit_fly' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Arabidopsis_thaliana' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Zebra_fish' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Yeast' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Mouse' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Maize' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Escherichia_coli' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Worm' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Mosquito' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Bacillus_subtilis' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Human' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Cow' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Chicken' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Chimpanzee' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Rat' , '*.ttl.gz' , 'http://www.wikipathways.org' );
ld_dir('/staging/wikipathways/data/wp/Fusarium_graminearum' , '*.ttl.gz' , 'http://www.wikipathways.org' );


rdf_loader_run();
