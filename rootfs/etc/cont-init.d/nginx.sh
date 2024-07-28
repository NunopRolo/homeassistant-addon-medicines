#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configure NGINX
# ==============================================================================
ingress_entry=$(bashio::addon.ingress_entry)
ingress_interface=$(bashio::addon.ip_address)

# Retrieve the ingress_entry query path so that nginx can perform rewrites accordingly
sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/nginx.conf
sed -i "s/%%interface%%/${ingress_interface}/g" /etc/nginx/nginx.conf
