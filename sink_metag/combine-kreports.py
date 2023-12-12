#! /usr/bin/env python
import sys
import csv
import argparse
import pandas as pd


def main():
    p = argparse.ArgumentParser()
    p.add_argument('kreport_files', nargs='+')
    p.add_argument('-o', '--output', required=True)
    args = p.parse_args()

    dfs = []
    for filename in args.kreport_files:
        name = filename.split('.')[0]
        df = pd.read_csv(filename, sep='\t',
                         names=['percent', 'bp', 'a', 'rank', 'empty', 'name'])

        df = df[df['rank'].isin(['S', 'U'])]
        df = df[['percent', 'name']]
        df = df.rename(columns={'percent': name})
        dfs.append(df)

    print(dfs[0].head())

    print('merging...')

    join_df = dfs.pop()
    while dfs:
        df = dfs.pop()
        join_df = join_df.merge(df, on='name', how='outer')

    # replace NA with 0
    join_df.fillna(0, inplace=True)
    print(join_df.head())

    # rearrange column order to have 'name' first
    cols = join_df.columns.tolist()
    cols.remove('name')
    cols.sort()
    data_cols = list(cols)

    # add name back in
    cols.insert(0, 'name')

    # reorder cols
    join_df = join_df[cols]

    # add in a max column
    join_df['max'] = join_df[data_cols].max(axis=1)

    # sort!
    join_df.sort_values(by='max', inplace=True, ascending=False)

    print(join_df.head())

    # save!
    join_df.to_csv(args.output)


if __name__ == '__main__':
    sys.exit(main())
