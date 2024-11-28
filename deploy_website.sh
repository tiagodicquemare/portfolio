set -e

flutter build web

source ./secret_variables.properties

# Set local and remote directories (ensure paths are correct)
LOCAL_DIR='./build/web'   # Relative path to the build output directory
REMOTE_DIR='/www'       # Remote directory on your FTP server

# Use lftp to mirror the local directory to the remote directory
echo "Start Deployment to $HOST."
lftp -u "$USERNAME","$PASSWORD" "$HOST" <<EOF
mirror -R --delete "$LOCAL_DIR" "$REMOTE_DIR"
bye
EOF

echo "Deployment to $HOST completed successfully."