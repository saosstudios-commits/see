#!/usr/bin/env bash
set -euo pipefail

if ! command -v supabase >/dev/null 2>&1; then
  echo "Supabase CLI is required. Install it from https://supabase.com/docs/guides/cli" >&2
  exit 1
fi
read -r -p "Exact deployed site URL (e.g. https://seepay.shop or your Vercel preview URL): " SITE_URL
if [[ ! "$SITE_URL" =~ ^https://[^/]+$ ]]; then
  echo "Use the exact HTTPS origin only, with no path or trailing slash." >&2
  exit 1
fi
read -r -s -p "Paste the Paystack TEST secret key (sk_test_...): " PAYSTACK_SECRET_KEY
printf '\n'
if [[ ! "$PAYSTACK_SECRET_KEY" =~ ^sk_test_[A-Za-z0-9]+$ ]]; then
  echo "That does not look like a Paystack test secret key. Nothing was changed." >&2
  exit 1
fi
TEMP_ENV="$(mktemp)"
trap 'rm -f "$TEMP_ENV"' EXIT
chmod 600 "$TEMP_ENV"
printf 'PAYSTACK_SECRET_KEY=%s\nSITE_URL=%s\n' "$PAYSTACK_SECRET_KEY" "$SITE_URL" > "$TEMP_ENV"
unset PAYSTACK_SECRET_KEY
supabase secrets set --env-file "$TEMP_ENV"
echo "Paystack test secret and SITE_URL saved to the linked Supabase project."
