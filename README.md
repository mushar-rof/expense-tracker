# Expense Tracker — GitHub Pages + Supabase

This project is a static PWA hosted by GitHub Pages. Supabase provides authentication and database services. No Netlify is required.

## Before uploading
1. Extract this ZIP.
2. Open `docs/supabase-config.js` in Notepad or VS Code.
3. Replace `PASTE_YOUR_SB_PUBLISHABLE_KEY_HERE` with your Supabase **Publishable key** (`sb_publishable_...`).
4. Save the file. The Supabase Project URL is already configured.
5. Never use a Supabase Secret key (`sb_secret_...`) or `service_role` key in browser code or GitHub.

## Upload to GitHub
Upload the contents of this folder to the root of `mushar-rof/expense-tracker`:
- Upload the `docs` folder as a folder (preserve its folder name).
- Upload `README.md`.
- Upload `supabase-admin-setup.sql`.
- `.gitignore` is optional for this browser-upload workflow.

Do not upload the ZIP file itself. Do not upload any `.env` file or database password.

## Enable GitHub Pages
1. Open repository Settings → Pages.
2. Under Build and deployment, choose **Deploy from a branch**.
3. Branch: `main`.
4. Folder: `/docs`.
5. Save.

Expected website URL:
`https://mushar-rof.github.io/expense-tracker/`

## Supabase setup
The main database schema was already run in the Supabase SQL Editor. It creates `profiles`, `user_data`, `announcements`, RLS policies, and the `avatars` bucket.

After you create your first account on the live website:
1. Open Supabase → SQL Editor.
2. Run `supabase-admin-setup.sql`.
3. In that SQL, uncomment the final UPDATE statement and replace `YOUR_EMAIL@example.com` with your own registered email, then run it to grant your own account admin permissions.

## Auth URL configuration
After GitHub Pages is live, open Supabase → Authentication → URL Configuration:
- Site URL: `https://mushar-rof.github.io/expense-tracker/`
- Add the same URL to Redirect URLs.

Email confirmation may be enabled. If so, confirm the email before the first login.

## Important limitations and security
- GitHub Pages is static hosting; Supabase supplies Auth and database services.
- Each user's `user_data` is protected by Row Level Security. Do not remove or weaken RLS.
- The browser Publishable key is designed to be public, but RLS policies are essential.
- Never expose a Secret/service_role key, database password, or private credentials.
- The current app retains a 5-digit PIN UI and maps it internally to a longer Supabase Auth password. A 5-digit PIN is weak; upgrade to a strong password/passphrase before relying on this for sensitive financial data.
- Free-plan limits and availability can change. Lifetime-free service cannot be guaranteed.
- The package has been syntax-checked but not yet tested against your live Supabase project.
