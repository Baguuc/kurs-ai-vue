export default {
  content: [
    "./index.html",
    "./src/**/*.{html,js,jsx,ts,tsx,vue}",
  ],
  safelist: [
    {
      pattern: /\*/,
    },
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
