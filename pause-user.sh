LINE_NUMBER=$(grep -n "### Client ${CLIENT_NAME}" /etc/wireguard/wg0.conf | head -n 1 | cut -d: -f1)
AI_LINE_NUMBER=$((LINE_NUMBER+4))
SEARCH_STRING=$(head -$AI_LINE_NUMBER /etc/wireguard/wg0.conf | tail -1)
REPLACE_STRING="### STOP ${CLIENT_NAME} ${SEARCH_STRING}"

sed -i "s|${SEARCH_STRING}|${REPLACE_STRING}|g" /etc/wireguard/wg0.conf