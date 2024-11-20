import {
  defineConfig,
  presetIcons,
  presetWebFonts,
  presetWind,
 } from 'unocss'

export default defineConfig({
  cli: {
    entry: [
      {
        patterns: [ '**/*.html', '*.html'],
        outFile: 'assets/uno.css'
      }
    ], // CliEntryItem | CliEntryItem[]
  },
  shortcuts: [],
  theme: {
    colors: {
      english: '#4B3F72',
      sunglow: {
        light: '#DA5451',
        DEFAULT: '#FFC857',
      },
      thulian: {
        // light: '#ecb1a2',
        DEFAULT: '#E56399',
      },
      payne: {
        // light: '#ecb1a2',
        DEFAULT: '#19647E',
      },
    },
  },
  presets: [
    presetWind(),
    presetWebFonts({
        provider: 'google',
        fonts: {
          sans: 'Lato',
          mono: ['Fira Code'],
        },
      },
    ),
    presetIcons(),
  ],
  // ...
})
