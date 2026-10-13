# ─────────────────────────────────────────────
# BlinkBasket — Zepto/Blinkit-style app for Bangalore
# Lightweight Nginx-based container
# ─────────────────────────────────────────────

FROM nginx:alpine

# Metadata
LABEL maintainer="sivakumar>"
LABEL description="BlinkBasket - 10-min grocery delivery prototype for Electronic City & Bangalore"
LABEL version="1.0.0"

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy app files
COPY index.html /usr/share/nginx/html/index.html

# Expose HTTP port
EXPOSE 80

# Health check — verifies the app is serving
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
