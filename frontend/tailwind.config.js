export default {
  content: [
    "./index.html",
    "./src/**/*.{html,js,jsx,ts,tsx,vue}",
  ],
  safelist: [],
  theme: {
    extend: {},
  },
  plugins: [
    require("@catppuccin/tailwindcss")(),
  ],
}
