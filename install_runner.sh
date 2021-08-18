# Create a folder
curl -o actions-runner-linux-x64-2.280.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.280.1/actions-runner-linux-x64-2.280.1.tar.gz
echo "24a8857b7f124f7c1852b030686a2f2205ec5d59ed7e2c0635a2c321d2b9fde6  actions-runner-linux-x64-2.280.1.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.280.1.tar.gz