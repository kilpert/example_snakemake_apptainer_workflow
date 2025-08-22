import pandas as pd
import sys


print("{:#^100}".format(" argv "))
print(sys.argv)


infile_bed = sys.argv[1]
outfile_tsv = sys.argv[2]


## Read the BED file to df
df = pd.read_csv(infile_bed, sep="\t", header=None)
df.columns = ["chrom", "start", "end", "name"]
print("{:#^100}".format(" df "))
print(df)


print("{:#^100}".format(" Output TSV "))
try:
    df.to_csv(outfile_tsv, sep="\t", index=False)
    print("Output file written successfully:", outfile_tsv)
except:
    print("Error! Unable to write output file:", outfile_tsv)
    sys.exit(1)

