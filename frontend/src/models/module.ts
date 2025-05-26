import type { Episode } from './episode.ts';

type Module = {
  id: number;
  title: string;
  no: string;
  episodes: Episode[];
}

export type { Module };
