import pandas as pd

df = pd.read_csv('syri.out', sep='\t', header=None)
df.columns = ['ref_chromosome_id', 'ref_start', 'ref_end', 'ref_seq', 'qry_seq', 'qry_chromosome_id', 'qry_start', 'qry_end', 'unique_id', 'parent_id', 'type', 'cp_status']
df.to_csv('syri_table.tsv', sep='\t', index=False)
