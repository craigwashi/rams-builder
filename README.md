# WashRAMS

A free web app for exterior cleaners to create professional RAMS (Risk Assessment and Method Statement) and COSHH assessments for UK jobs: pressure washing, soft washing, roof, gutter, window, conservatory, solar and decking cleaning.

Everything runs in the browser from a single `index.html` file. Saved jobs and company details stay in each user's own browser. Documents download as A4 PDFs or print directly.

Live at https://www.washrams.co.uk (GitHub Pages from the `main` branch).

Generated documents must be checked by a competent person before use. Chemical classifications are typical values; the product safety data sheet always takes precedence.

## Accounts

Optional sign-in (Supabase) saves each user's company details, logo, default site details and jobs to their account. To switch it on:

1. Create a free project at supabase.com.
2. In the SQL Editor, run `supabase/setup.sql`.
3. Put the project URL and publishable (anon) key in `CLOUD_CONFIG` near the bottom of `index.html`.
4. In Authentication > URL Configuration, set the Site URL to `https://www.washrams.co.uk`.

Until `CLOUD_CONFIG` is filled in, the account button stays hidden and everything is saved in the browser only.
