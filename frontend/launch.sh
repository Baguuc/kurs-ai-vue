#!/usr/bin/env bash
source .env
npm i
npx vite build && npx serve -p $SERVE_PORT ./dist
